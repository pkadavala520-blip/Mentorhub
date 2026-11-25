
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

namespace MentorHub.Mentor
{
    public partial class Mentor_Messages : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        // ==========================================
        // CHECK LOGIN
        // ==========================================

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            int mentorId = Convert.ToInt32(Session["MentorID"]);

            if (!IsPostBack)
            {
                LoadUnreadMessageCount();

                MentorNotificationsHelper.LoadNotifications(
                    mentorId,
                    rptTopNotifications,
                    lblNotifDot,
                    pnlTopEmpty
                );
            }
        }

        // ==========================================
        // GET CONNECTION
        // ==========================================

        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // ==========================================
        // GET CURRENT MENTOR ID
        // ==========================================

        static int GetMentorID()
        {
            if (HttpContext.Current.Session["MentorID"] == null)
                throw new Exception("Please login again.");

            return Convert.ToInt32(
                HttpContext.Current.Session["MentorID"]);
        }

        // ==========================================
        // UNREAD MESSAGE COUNT
        // ==========================================

        void LoadUnreadMessageCount()
        {
            lblUnreadMessages.Visible = false;
            lblUnreadMessages.Text = "";

            int mentorId = Convert.ToInt32(Session["MentorID"]);

            getcon();

            string query = "SELECT COUNT(*) FROM MentorMessages " +
                           "WHERE MentorID = " + mentorId +
                           " AND SenderType = 'Mentee' " +
                           "AND IsRead = 0";

            cmd = new SqlCommand(query, con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count > 0)
            {
                lblUnreadMessages.Text =
                    count > 99 ? "99+" : count.ToString();

                lblUnreadMessages.Visible = true;
            }

            con.Close();
        }

        // ==========================================
        // CHECK MENTEE CONNECTION
        // ==========================================

        static bool ValidateMentee(int mentorId, int menteeId)
        {
            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings[
                    "MentorHubConnection"].ConnectionString);

            con.Open();

            string query = "SELECT COUNT(*) FROM MentorRequests " +
                           "WHERE MentorID = " + mentorId +
                           " AND MenteeID = " + menteeId +
                           " AND Status IN ('Accepted','Approved')";

            SqlCommand cmd = new SqlCommand(query, con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            if (count > 0)
                return true;

            return false;
        }

        // ==========================================
        // GET CONVERSATIONS
        // ==========================================

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ConversationDto> GetConversations()
        {
            int mentorId = GetMentorID();

            List<ConversationDto> list =
                new List<ConversationDto>();

            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings[
                    "MentorHubConnection"].ConnectionString);

            con.Open();

            string query = "SELECT M.MenteeID, M.FullName, " +
                           "ISNULL(L.MessageText,'') AS LastMessage, " +
                           "L.SentAt AS LastSentAt, " +
                           "ISNULL(U.UnreadCount,0) AS UnreadCount " +
                           "FROM Mentee M " +

                           "OUTER APPLY ( " +
                           "SELECT TOP 1 MessageText, SentAt " +
                           "FROM MentorMessages " +
                           "WHERE MentorID = " + mentorId +
                           " AND MenteeID = M.MenteeID " +
                           "ORDER BY MessageID DESC " +
                           ") L " +

                           "OUTER APPLY ( " +
                           "SELECT COUNT(*) AS UnreadCount " +
                           "FROM MentorMessages " +
                           "WHERE MentorID = " + mentorId +
                           " AND MenteeID = M.MenteeID " +
                           "AND SenderType = 'Mentee' " +
                           "AND IsRead = 0 " +
                           ") U " +

                           "WHERE EXISTS ( " +
                           "SELECT 1 FROM MentorRequests R " +
                           "WHERE R.MentorID = " + mentorId +
                           " AND R.MenteeID = M.MenteeID " +
                           "AND R.Status IN ('Accepted','Approved') " +
                           ") " +

                           "OR EXISTS ( " +
                           "SELECT 1 FROM MentorMessages MM " +
                           "WHERE MM.MentorID = " + mentorId +
                           " AND MM.MenteeID = M.MenteeID " +
                           ") " +

                           "ORDER BY L.SentAt DESC, M.FullName";

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                ConversationDto c = new ConversationDto();

                c.MenteeId = Convert.ToInt32(dr["MenteeID"]);
                c.Name = dr["FullName"].ToString();
                c.LastMessage = dr["LastMessage"].ToString();

                if (dr["LastSentAt"] != DBNull.Value)
                {
                    c.LastSentAt = Convert.ToDateTime(
                        dr["LastSentAt"]).ToString(
                        "yyyy-MM-dd HH:mm:ss");
                }
                else
                {
                    c.LastSentAt = "";
                }

                c.UnreadCount = Convert.ToInt32(dr["UnreadCount"]);

                list.Add(c);
            }

            dr.Close();
            con.Close();

            return list;
        }

        // ==========================================
        // GET CHAT HISTORY
        // ==========================================

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<MessageDto> GetMessages(int menteeId)
        {
            int mentorId = GetMentorID();

            if (menteeId <= 0)
                throw new Exception("Invalid mentee ID.");

            if (!ValidateMentee(mentorId, menteeId))
                throw new Exception("This mentee is not connected.");

            List<MessageDto> list = new List<MessageDto>();

            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings[
                    "MentorHubConnection"].ConnectionString);

            con.Open();

            // MARK MENTEE MESSAGES AS READ

            string readQuery = "UPDATE MentorMessages SET IsRead = 1 " +
                               "WHERE MentorID = " + mentorId +
                               " AND MenteeID = " + menteeId +
                               " AND SenderType = 'Mentee' " +
                               "AND IsRead = 0";

            SqlCommand readCmd = new SqlCommand(readQuery, con);
            readCmd.ExecuteNonQuery();

            // LOAD MESSAGES

            string query = "SELECT MessageID, SenderType, MessageText, SentAt " +
                           "FROM MentorMessages " +
                           "WHERE MentorID = " + mentorId +
                           " AND MenteeID = " + menteeId +
                           " ORDER BY MessageID ASC";

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                MessageDto msg = new MessageDto();

                msg.MessageId = Convert.ToInt32(dr["MessageID"]);
                msg.SenderType = dr["SenderType"].ToString();
                msg.Text = dr["MessageText"].ToString();

                msg.Time = Convert.ToDateTime(dr["SentAt"])
                    .ToString("hh:mm tt");

                if (msg.SenderType == "Mentor")
                    msg.IsMine = true;
                else
                    msg.IsMine = false;

                list.Add(msg);
            }

            dr.Close();
            con.Close();

            return list;
        }

        // ==========================================
        // SEND MESSAGE
        // ==========================================

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static SendMessageResult SendMessage(
            int menteeId, string message)
        {
            int mentorId = GetMentorID();

            message = (message ?? "").Trim();

            if (menteeId <= 0)
                throw new Exception("Please select a mentee.");

            if (message == "")
                throw new Exception("Please enter a message.");

            if (message.Length > 2000)
                throw new Exception("Message is too long.");

            if (!ValidateMentee(mentorId, menteeId))
                throw new Exception("Invalid mentee connection.");

            // ESCAPE SINGLE QUOTES
            message = message.Replace("'", "''");

            SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings[
                    "MentorHubConnection"].ConnectionString);

            con.Open();

            string query = "INSERT INTO MentorMessages " +
                           "(MentorID, MenteeID, SenderType, MessageText, SentAt, IsRead) " +
                           "VALUES (" + mentorId + ", " +
                           menteeId + ", 'Mentor', N'" +
                           message + "', GETDATE(), 0)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();

            con.Close();

            SendMessageResult result = new SendMessageResult();

            result.Success = true;
            result.Message = "Message sent successfully.";

            return result;
        }

        // ==========================================
        // DTO CLASSES
        // ==========================================

        public class ConversationDto
        {
            public int MenteeId { get; set; }
            public string Name { get; set; }
            public string LastMessage { get; set; }
            public string LastSentAt { get; set; }
            public int UnreadCount { get; set; }
        }

        public class MessageDto
        {
            public int MessageId { get; set; }
            public string SenderType { get; set; }
            public string Text { get; set; }
            public string Time { get; set; }
            public bool IsMine { get; set; }
        }

        public class SendMessageResult
        {
            public bool Success { get; set; }
            public string Message { get; set; }
        }
    }
}
