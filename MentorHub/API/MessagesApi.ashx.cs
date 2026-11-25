using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.SessionState;
using System.Web.Script.Serialization;

namespace MentorHub.API
{
    public class MessagesApi : IHttpHandler, IRequiresSessionState
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager
            .ConnectionStrings["MentorHubConnection"]
            .ConnectionString;

        JavaScriptSerializer serializer = new JavaScriptSerializer();

        public bool IsReusable
        {
            get { return false; }
        }

        // ==============================================
        // MAIN API
        // ==============================================

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            context.Response.ContentEncoding = System.Text.Encoding.UTF8;

            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.Cache.SetNoStore();

            try
            {
                string action = context.Request["action"];
                string role = context.Request["role"];

                if (role != "mentor" && role != "mentee")
                {
                    Write(false, "Invalid role.", null);
                    return;
                }

                int userId = GetUserID(role);

                if (userId <= 0)
                {
                    context.Response.StatusCode = 401;

                    Write(false, "Please login again.", null);
                    return;
                }

                if (action == "conversations")
                {
                    GetConversations(role, userId);
                }
                else if (action == "messages")
                {
                    GetMessages(context, role, userId);
                }
                else if (action == "send")
                {
                    SendMessage(context, role, userId);
                }
                else if (action == "markread")
                {
                    MarkRead(context, role, userId);
                }
                else
                {
                    Write(false, "Invalid action.", null);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());

                context.Response.StatusCode = 500;

                Write(false, "Error: " + ex.Message, null);
            }
        }

        // ==============================================
        // GET USER ID
        // ==============================================

        int GetUserID(string role)
        {
            if (role == "mentor")
            {
                if (SessionValue("MentorID") != "")
                {
                    return Convert.ToInt32(SessionValue("MentorID"));
                }
            }
            else
            {
                if (SessionValue("MenteeID") != "")
                {
                    return Convert.ToInt32(SessionValue("MenteeID"));
                }
            }

            return 0;
        }

        string SessionValue(string key)
        {
            if (HttpContext.Current.Session[key] == null)
            {
                return "";
            }

            return HttpContext.Current.Session[key].ToString();
        }

        // ==============================================
        // GET CONNECTION
        // ==============================================

        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // ==============================================
        // GET CONVERSATIONS
        // ==============================================

        void GetConversations(string role, int userId)
        {
            string query = "";

            if (role == "mentor")
            {
                query = @"
                    SELECT DISTINCT
                        MR.MenteeID AS PeerID,
                        M.FullName AS PeerName,
                        'Mentee' AS PeerType,
                        ISNULL(LM.MessageText, '') AS LastMessage,
                        LM.SentAt AS LastMessageTime,
                        ISNULL(U.UnreadCount, 0) AS UnreadCount

                    FROM MentorRequests MR

                    INNER JOIN Mentee M
                        ON M.MenteeID = MR.MenteeID

                    OUTER APPLY
                    (
                        SELECT TOP 1
                            MM.MessageText,
                            MM.SentAt

                        FROM MentorMessages MM

                        WHERE MM.MentorID = MR.MentorID
                          AND MM.MenteeID = MR.MenteeID

                        ORDER BY MM.MessageID DESC
                    ) LM

                    OUTER APPLY
                    (
                        SELECT COUNT(*) AS UnreadCount

                        FROM MentorMessages MM

                        WHERE MM.MentorID = MR.MentorID
                          AND MM.MenteeID = MR.MenteeID
                          AND MM.SenderType = 'Mentee'
                          AND MM.IsRead = 0
                    ) U

                    WHERE MR.MentorID = " + userId + @"
                      AND MR.Status = 'Accepted'

                    ORDER BY LM.SentAt DESC";
            }
            else
            {
                query = @"
                    SELECT DISTINCT
                        MR.MentorID AS PeerID,
                        M.FullName AS PeerName,
                        'Mentor' AS PeerType,
                        ISNULL(LM.MessageText, '') AS LastMessage,
                        LM.SentAt AS LastMessageTime,
                        ISNULL(U.UnreadCount, 0) AS UnreadCount

                    FROM MentorRequests MR

                    INNER JOIN Mentor M
                        ON M.MentorID = MR.MentorID

                    OUTER APPLY
                    (
                        SELECT TOP 1
                            MM.MessageText,
                            MM.SentAt

                        FROM MentorMessages MM

                        WHERE MM.MentorID = MR.MentorID
                          AND MM.MenteeID = MR.MenteeID

                        ORDER BY MM.MessageID DESC
                    ) LM

                    OUTER APPLY
                    (
                        SELECT COUNT(*) AS UnreadCount

                        FROM MentorMessages MM

                        WHERE MM.MentorID = MR.MentorID
                          AND MM.MenteeID = MR.MenteeID
                          AND MM.SenderType = 'Mentor'
                          AND MM.IsRead = 0
                    ) U

                    WHERE MR.MenteeID = " + userId + @"
                      AND MR.Status = 'Accepted'

                    ORDER BY LM.SentAt DESC";
            }

            getcon();

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            con.Close();

            Write(true, "Conversations loaded.", TableToList(dt));
        }

        // ==============================================
        // GET MESSAGES
        // ==============================================

        void GetMessages(HttpContext context, string role, int userId)
        {
            int peerId = Convert.ToInt32(
                context.Request["peerId"]);

            if (peerId <= 0)
            {
                Write(false, "Invalid conversation.", null);
                return;
            }

            if (!IsAccepted(role, userId, peerId))
            {
                Write(false, "Connection is not accepted.", null);
                return;
            }

            int mentorId;
            int menteeId;

            GetIDs(role, userId, peerId, out mentorId, out menteeId);

            string query = @"
                SELECT
                    MessageID,
                    MentorID,
                    MenteeID,
                    SenderType,
                    MessageText,
                    SentAt,
                    IsRead

                FROM MentorMessages

                WHERE MentorID = " + mentorId + @"
                  AND MenteeID = " + menteeId + @"

                ORDER BY MessageID ASC";

            getcon();

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            con.Close();

            Write(true, "Messages loaded.", TableToList(dt));
        }

        // ==============================================
        // SEND MESSAGE
        // ==============================================

        void SendMessage(HttpContext context, string role, int userId)
        {
            if (context.Request.HttpMethod != "POST")
            {
                Write(false, "POST request required.", null);
                return;
            }

            string json = "";

            using (StreamReader reader =
                new StreamReader(context.Request.InputStream))
            {
                json = reader.ReadToEnd();
            }

            RequestData request;

            try
            {
                request = serializer.Deserialize<RequestData>(json);
            }
            catch
            {
                Write(false, "Invalid message data.", null);
                return;
            }

            if (request == null)
            {
                Write(false, "Message data is empty.", null);
                return;
            }

            int peerId = request.peerId;

            string message = request.messageText;

            if (peerId <= 0)
            {
                Write(false, "Please select a conversation.", null);
                return;
            }

            if (string.IsNullOrWhiteSpace(message))
            {
                Write(false, "Please enter a message.", null);
                return;
            }

            message = message.Trim();

            if (message.Length > 2000)
            {
                Write(false, "Maximum 2000 characters allowed.", null);
                return;
            }

            if (!IsAccepted(role, userId, peerId))
            {
                Write(false, "Connection is not accepted.", null);
                return;
            }

            int mentorId;
            int menteeId;

            GetIDs(role, userId, peerId, out mentorId, out menteeId);

            string senderType = role == "mentor"
                ? "Mentor"
                : "Mentee";

            // Escape single quotes in message text
            message = message.Replace("'", "''");

            string query = @"
                INSERT INTO MentorMessages
                (
                    MentorID,
                    MenteeID,
                    SenderType,
                    MessageText,
                    SentAt,
                    IsRead
                )

                VALUES
                (
                    " + mentorId + @",
                    " + menteeId + @",
                    '" + senderType + @"',
                    N'" + message + @"',
                    GETDATE(),
                    0
                );

                SELECT SCOPE_IDENTITY();";

            getcon();

            cmd = new SqlCommand(query, con);

            int messageId = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            Write(true, "Message sent successfully.",
                new
                {
                    MessageID = messageId,
                    MentorID = mentorId,
                    MenteeID = menteeId,
                    SenderType = senderType,
                    MessageText = request.messageText.Trim(),
                    SentAt = DateTime.Now,
                    IsRead = false
                });
        }

        // ==============================================
        // MARK MESSAGES AS READ
        // ==============================================

        void MarkRead(HttpContext context, string role, int userId)
        {
            int peerId = Convert.ToInt32(
                context.Request["peerId"]);

            if (peerId <= 0)
            {
                Write(false, "Invalid conversation.", null);
                return;
            }

            if (!IsAccepted(role, userId, peerId))
            {
                Write(false, "Connection is not accepted.", null);
                return;
            }

            int mentorId;
            int menteeId;

            GetIDs(role, userId, peerId, out mentorId, out menteeId);

            string senderType = role == "mentor"
                ? "Mentee"
                : "Mentor";

            string query = @"
                UPDATE MentorMessages

                SET IsRead = 1

                WHERE MentorID = " + mentorId + @"
                  AND MenteeID = " + menteeId + @"
                  AND SenderType = '" + senderType + @"'
                  AND IsRead = 0";

            getcon();

            cmd = new SqlCommand(query, con);

            int updated = cmd.ExecuteNonQuery();

            con.Close();

            Write(true, "Messages marked as read.",
                new { Updated = updated });
        }

        // ==============================================
        // CHECK ACCEPTED REQUEST
        // ==============================================

        bool IsAccepted(string role, int userId, int peerId)
        {
            int mentorId;
            int menteeId;

            GetIDs(role, userId, peerId, out mentorId, out menteeId);

            string query = @"
                SELECT COUNT(*)

                FROM MentorRequests

                WHERE MentorID = " + mentorId + @"
                  AND MenteeID = " + menteeId + @"
                  AND Status = 'Accepted'";

            getcon();

            cmd = new SqlCommand(query, con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            return count > 0;
        }

        // ==============================================
        // GET MENTOR AND MENTEE IDS
        // ==============================================

        void GetIDs(
            string role,
            int userId,
            int peerId,
            out int mentorId,
            out int menteeId)
        {
            if (role == "mentor")
            {
                mentorId = userId;
                menteeId = peerId;
            }
            else
            {
                mentorId = peerId;
                menteeId = userId;
            }
        }

        // ==============================================
        // DATATABLE TO LIST
        // ==============================================

        List<Dictionary<string, object>> TableToList(DataTable dt)
        {
            List<Dictionary<string, object>> rows =
                new List<Dictionary<string, object>>();

            foreach (DataRow row in dt.Rows)
            {
                Dictionary<string, object> item =
                    new Dictionary<string, object>();

                foreach (DataColumn column in dt.Columns)
                {
                    if (row[column] == DBNull.Value)
                    {
                        item[column.ColumnName] = null;
                    }
                    else
                    {
                        item[column.ColumnName] = row[column];
                    }
                }

                rows.Add(item);
            }

            return rows;
        }

        // ==============================================
        // JSON RESPONSE
        // ==============================================

        void Write(bool success, string message, object data)
        {
            var result = new
            {
                success = success,
                message = message,
                data = data
            };

            HttpContext.Current.Response.Write(
                serializer.Serialize(result));
        }

        // ==============================================
        // REQUEST CLASS
        // ==============================================

        public class RequestData
        {
            public int peerId { get; set; }

            public string messageText { get; set; }
        }
    }
}