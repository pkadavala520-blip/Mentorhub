using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;

namespace MentorHub.Mentor
{
    public class MentorPageBase : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;

        protected string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        // MENTOR ID
        protected int MentorId
        {
            get
            {
                if (Session["MentorID"] == null)
                    return 0;

                return Convert.ToInt32(Session["MentorID"]);
            }
        }

        // INIT
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            EnsureMentorPanelTables();
        }

        // CHECK LOGIN
        protected void CheckMentorLogin()
        {
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
            }
        }

        // GET CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // ESCAPE SQL TEXT
        string S(string value)
        {
            return (value ?? "").Replace("'", "''");
        }

        // GET DATA
        protected DataTable GetData(string query)
        {
            getcon();

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            con.Close();

            return dt;
        }

        // EXECUTE QUERY
        protected void ExecuteQuery(string query)
        {
            getcon();

            cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();

            con.Close();
        }

        // HTML ENCODE
        protected string H(object value)
        {
            return HttpUtility.HtmlEncode(value == null ? "" : value.ToString());
        }

        // STATUS MESSAGE
        protected string StatusMessage()
        {
            string message = Session["MentorPanelStatus"] as string;

            if (string.IsNullOrEmpty(message))
                return "";

            Session.Remove("MentorPanelStatus");

            string css = message.StartsWith("Error:")
                ? "alert-danger"
                : "alert-success";

            return "<div class='alert " + css + " py-2'>" + H(message) + "</div>";
        }

        // PROFILE UPDATE
        void SaveProfile()
        {
            string name = Request.Form["name"];
            string title = Request.Form["title"];
            string bio = Request.Form["bio"];

            if (string.IsNullOrWhiteSpace(name))
                throw new Exception("Full name is required.");

            string query = "UPDATE Mentor SET FullName='" + S(name) +
                           "', ProfessionalTitle='" + S(title) +
                           "', Bio='" + S(bio) +
                           "' WHERE MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Profile updated successfully.";
        }

        // SKILLS UPDATE
        void SaveSkills()
        {
            string skills = Request.Form["skills"];

            string query = "UPDATE Mentor SET Skills='" + S(skills) +
                           "' WHERE MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Skills updated successfully.";
        }

        // ADD AVAILABILITY SLOT
        void AddSlot()
        {
            string day = Request.Form["day"];
            string start = Request.Form["start"];
            string end = Request.Form["end"];

            if (string.IsNullOrWhiteSpace(day) ||
                string.IsNullOrWhiteSpace(start) ||
                string.IsNullOrWhiteSpace(end))
            {
                throw new Exception("Day, start time and end time are required.");
            }

            if (string.Compare(start, end, StringComparison.Ordinal) >= 0)
                throw new Exception("End time must be after start time.");

            string query = "INSERT INTO MentorAvailability " +
                           "(MentorID, DayName, StartTime, EndTime, IsActive) VALUES (" +
                           MentorId + ", '" + S(day) + "', '" + S(start) + "', '" + S(end) + "', 1)";

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Availability slot added.";
        }

        // ACCOUNT SETTINGS
        void SaveSettings()
        {
            string name = Request.Form["displayName"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];

            if (string.IsNullOrWhiteSpace(name) ||
                string.IsNullOrWhiteSpace(email))
            {
                throw new Exception("Display name and email are required.");
            }

            string query = "UPDATE Mentor SET FullName='" + S(name) +
                           "', Email='" + S(email) +
                           "', Phone='" + S(phone) +
                           "' WHERE MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Account preferences saved.";
        }

        // CHANGE PASSWORD
        void ChangePassword()
        {
            string current = Request.Form["currentPassword"];
            string next = Request.Form["newPassword"];

            if (string.IsNullOrWhiteSpace(current) ||
                string.IsNullOrWhiteSpace(next))
            {
                throw new Exception("Both password fields are required.");
            }

            string query = "SELECT Password FROM Mentor WHERE MentorID=" + MentorId;

            dt = GetData(query);

            if (dt.Rows.Count == 0 ||
                Convert.ToString(dt.Rows[0]["Password"]) != current)
            {
                throw new Exception("Current password is incorrect.");
            }

            query = "UPDATE Mentor SET Password='" + S(next) +
                    "' WHERE MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Password updated successfully.";
        }

        // SEND MESSAGE
        void SendMessage()
        {
            string message = Request.Form["message"];
            int menteeId = GetSelectedMenteeId();

            if (string.IsNullOrWhiteSpace(message))
                throw new Exception("Please enter a message.");

            if (menteeId <= 0)
                throw new Exception("No mentee is connected to this mentor.");

            string query = "INSERT INTO MentorMessages " +
                           "(MentorID, MenteeID, SenderType, MessageText, SentAt, IsRead) VALUES (" +
                           MentorId + ", " + menteeId +
                           ", 'Mentor', '" + S(message) + "', GETDATE(), 0)";

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Message sent.";
        }

        // MARK NOTIFICATIONS AS READ
        void MarkNotificationsRead()
        {
            string query = "UPDATE MentorNotifications SET IsRead=1 WHERE MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "All notifications marked as read.";
        }

        // ADD SESSION
        void AddSession()
        {
            string mentee = Request.Form["mentee"];
            string date = Request.Form["date"];
            string time = Request.Form["time"];
            string topic = Request.Form["topic"];

            int menteeId;

            if (!int.TryParse(mentee, out menteeId))
                throw new Exception("Please select a mentee.");

            DateTime sessionDate;

            if (!DateTime.TryParse(date, out sessionDate))
                throw new Exception("Please select a valid date.");

            string query = "INSERT INTO MentorSessions " +
                           "(MentorID, MenteeID, SessionDate, SessionTime, Topic, Status) VALUES (" +
                           MentorId + ", " + menteeId + ", '" +
                           sessionDate.ToString("yyyy-MM-dd") + "', '" +
                           S(time) + "', '" + S(topic) + "', 'Scheduled')";

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Session scheduled successfully.";
        }

        // COMMON POST HANDLER
        protected void HandleCommonPost()
        {
            string action = Request.Form["action"];

            try
            {
                if (string.IsNullOrWhiteSpace(action))
                    return;

                switch (action)
                {
                    case "profile":
                        SaveProfile();
                        break;

                    case "skills":
                        SaveSkills();
                        break;

                    case "add-slot":
                        AddSlot();
                        break;

                    case "settings":
                        SaveSettings();
                        break;

                    case "password":
                        ChangePassword();
                        break;

                    case "message":
                        SendMessage();
                        break;

                    case "notifications":
                        MarkNotificationsRead();
                        break;

                    case "schedule":
                        AddSession();
                        break;
                }
            }
            catch (Exception ex)
            {
                Session["MentorPanelStatus"] = "Error: " + ex.Message;
            }
        }

        // ACCEPT REQUEST
        protected void AcceptRequest(int requestId)
        {
            string query = "UPDATE MentorRequests SET Status='Accepted' " +
                           "WHERE RequestID=" + requestId +
                           " AND MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Request accepted.";
        }

        // REJECT REQUEST
        protected void RejectRequest(int requestId)
        {
            string query = "UPDATE MentorRequests SET Status='Rejected' " +
                           "WHERE RequestID=" + requestId +
                           " AND MentorID=" + MentorId;

            ExecuteQuery(query);

            Session["MentorPanelStatus"] = "Request declined.";
        }

        // DISPLAY REQUESTS
        protected string RenderRequests()
        {
            string query = "SELECT r.RequestID, r.MenteeID, r.Goal, r.Status, " +
                           "r.CreatedAt, m.FullName FROM MentorRequests r " +
                           "INNER JOIN Mentee m ON m.MenteeID=r.MenteeID " +
                           "WHERE r.MentorID=" + MentorId +
                           " ORDER BY r.CreatedAt DESC";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            if (dt.Rows.Count == 0)
                return "<div class='mp-card p-4'><div class='text-muted'>No matching requests yet.</div></div>";

            foreach (DataRow r in dt.Rows)
            {
                string status = Convert.ToString(r["Status"]);

                string badge = status == "Accepted" ? "bg-success" :
                               status == "Rejected" ? "bg-danger" :
                               "bg-warning text-dark";

                sb.Append("<div class='mp-card p-4'>");
                sb.Append("<div class='d-flex justify-content-between align-items-start gap-3'>");
                sb.Append("<div><h5 class='fw-semibold mb-1'>" + H(r["FullName"]) + "</h5>");
                sb.Append("<p class='text-muted mb-2'>" + H(r["Goal"]) + "</p>");
                sb.Append("<span class='badge " + badge + "'>" + H(status) + "</span></div>");

                if (status == "Pending")
                {
                    int id = Convert.ToInt32(r["RequestID"]);

                    sb.Append("<div class='d-flex gap-2'>");
                    sb.Append("<a class='mp-btn mp-btn-primary btn-sm' href='requests.aspx?action=accept&id=" + id + "'>Accept</a>");
                    sb.Append("<a class='mp-btn mp-btn-danger-soft btn-sm' href='requests.aspx?action=reject&id=" + id + "'>Decline</a>");
                    sb.Append("</div>");
                }

                sb.Append("</div></div>");
            }

            return sb.ToString();
        }

        // DISPLAY ACCEPTED MENTEES
        protected string RenderMentees()
        {
            string query = "SELECT DISTINCT m.MenteeID, m.FullName, m.Email, " +
                           "m.Education, m.CareerGoal, m.SkillsInterests " +
                           "FROM Mentee m INNER JOIN MentorRequests r ON r.MenteeID=m.MenteeID " +
                           "WHERE r.MentorID=" + MentorId +
                           " AND r.Status='Accepted' ORDER BY m.FullName";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            if (dt.Rows.Count == 0)
                return "<div class='col-12'><div class='mp-card p-4 text-muted'>No accepted mentees yet.</div></div>";

            foreach (DataRow r in dt.Rows)
            {
                sb.Append("<div class='col-md-6 col-xl-4'><div class='mp-card p-4 h-100'>");
                sb.Append("<div class='d-flex align-items-center gap-3 mb-3'>");
                sb.Append("<div class='mp-avatar'>" + H(Initials(r["FullName"])) + "</div>");
                sb.Append("<div><h5 class='mb-1 fw-semibold'>" + H(r["FullName"]) + "</h5>");
                sb.Append("<div class='text-muted small'>" + H(r["Education"]) + "</div></div></div>");
                sb.Append("<p class='small text-muted mb-2'><strong>Goal:</strong> " + H(r["CareerGoal"]) + "</p>");
                sb.Append("<p class='small text-muted mb-3'><strong>Skills:</strong> " + H(r["SkillsInterests"]) + "</p>");
                sb.Append("<a class='mp-btn mp-btn-soft btn-sm' href='mentee-profile.aspx?id=" +
                          Convert.ToInt32(r["MenteeID"]) + "'>View Profile</a>");
                sb.Append("</div></div>");
            }

            return sb.ToString();
        }

        // DISPLAY AVAILABILITY
        protected string RenderAvailability()
        {
            string query = "SELECT SlotID, DayName, StartTime, EndTime, IsActive " +
                           "FROM MentorAvailability WHERE MentorID=" + MentorId +
                           " ORDER BY DayName, StartTime";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            string[] days = {
                "Monday", "Tuesday", "Wednesday", "Thursday",
                "Friday", "Saturday", "Sunday"
            };

            foreach (string day in days)
            {
                sb.Append("<div class='mp-week-day'>");
                sb.Append("<div class='fw-semibold mb-2'>" + day + "</div>");

                bool found = false;

                foreach (DataRow r in dt.Rows)
                {
                    if (string.Equals(Convert.ToString(r["DayName"]), day,
                        StringComparison.OrdinalIgnoreCase))
                    {
                        found = true;

                        sb.Append("<div class='mp-slot mb-2'><span>");
                        sb.Append(H(r["StartTime"]) + " - " + H(r["EndTime"]));
                        sb.Append("</span></div>");
                    }
                }

                if (!found)
                    sb.Append("<div class='text-muted small'>No slots</div>");

                sb.Append("</div>");
            }

            return sb.ToString();
        }

        // DISPLAY SKILLS
        protected string RenderSkills()
        {
            string query = "SELECT Skills FROM Mentor WHERE MentorID=" + MentorId;

            dt = GetData(query);

            if (dt.Rows.Count == 0)
                return "";

            string skills = Convert.ToString(dt.Rows[0]["Skills"]);

            string[] list = (skills ?? "").Split(
                new[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);

            StringBuilder sb = new StringBuilder();

            foreach (string skill in list)
            {
                string clean = skill.Trim();

                if (clean.Length == 0)
                    continue;

                sb.Append("<div class='col-md-6'><div class='mp-card p-4'>");
                sb.Append("<div class='d-flex justify-content-between mb-2'>");
                sb.Append("<strong>" + H(clean) + "</strong>");
                sb.Append("<span class='text-muted'>Professional</span></div>");
                sb.Append("<div class='progress' style='height:8px'>");
                sb.Append("<div class='progress-bar' style='width:80%'></div>");
                sb.Append("</div></div></div>");
            }

            if (sb.Length == 0)
                sb.Append("<div class='col-12'><div class='mp-card p-4 text-muted'>No skills added yet. Use Edit Skills.</div></div>");

            return sb.ToString();
        }

        // DISPLAY FEEDBACK
        protected string RenderFeedback()
        {
            string query = "SELECT TOP 10 f.Rating, f.Comment, f.CreatedAt, m.FullName " +
                           "FROM MentorFeedback f INNER JOIN Mentee m ON m.MenteeID=f.MenteeID " +
                           "WHERE f.MentorID=" + MentorId +
                           " ORDER BY f.CreatedAt DESC";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            if (dt.Rows.Count == 0)
                return "<div class='text-muted'>No reviews yet.</div>";

            foreach (DataRow r in dt.Rows)
            {
                int rating = Convert.ToInt32(r["Rating"]);

                sb.Append("<div class='border-bottom py-3'>");
                sb.Append("<div class='d-flex justify-content-between'>");
                sb.Append("<strong>" + H(r["FullName"]) + "</strong>");
                sb.Append("<span class='text-warning'>");

                for (int i = 0; i < rating; i++)
                    sb.Append("★");

                sb.Append("</span></div>");
                sb.Append("<p class='mb-1 mt-2'>" + H(r["Comment"]) + "</p>");
                sb.Append("<small class='text-muted'>" +
                          H(Convert.ToDateTime(r["CreatedAt"]).ToString("dd MMM yyyy")) +
                          "</small></div>");
            }

            return sb.ToString();
        }

        // DISPLAY RATING BARS
        protected string RenderRatingBars()
        {
            string query = "SELECT Rating, COUNT(*) AS Total FROM MentorFeedback " +
                           "WHERE MentorID=" + MentorId +
                           " GROUP BY Rating ORDER BY Rating DESC";

            dt = GetData(query);

            int total = 0;

            foreach (DataRow r in dt.Rows)
                total += Convert.ToInt32(r["Total"]);

            StringBuilder sb = new StringBuilder();

            for (int rating = 5; rating >= 1; rating--)
            {
                int count = 0;

                foreach (DataRow r in dt.Rows)
                {
                    if (Convert.ToInt32(r["Rating"]) == rating)
                        count = Convert.ToInt32(r["Total"]);
                }

                int percent = total == 0 ? 0 : count * 100 / total;

                sb.Append("<div class='d-flex align-items-center gap-2 mb-2'>");
                sb.Append("<small>" + rating + "</small>");
                sb.Append("<div class='progress flex-grow-1' style='height:7px'>");
                sb.Append("<div class='progress-bar' style='width:" + percent + "%'></div>");
                sb.Append("</div><small class='text-muted'>" + count + "</small></div>");
            }

            return sb.ToString();
        }

        // DISPLAY NOTIFICATIONS
        protected string RenderNotifications()
        {
            string query = "SELECT TOP 10 NotificationID, Title, MessageText, IsRead, CreatedAt " +
                           "FROM MentorNotifications WHERE MentorID=" + MentorId +
                           " ORDER BY CreatedAt DESC";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            if (dt.Rows.Count == 0)
                return "<div class='text-muted p-3'>No notifications.</div>";

            foreach (DataRow r in dt.Rows)
            {
                sb.Append("<div class='p-3 border-bottom " +
                    (Convert.ToBoolean(r["IsRead"]) ? "" : "bg-light") + "'>");

                sb.Append("<strong>" + H(r["Title"]) + "</strong>");
                sb.Append("<div class='small text-muted'>" + H(r["MessageText"]) + "</div>");
                sb.Append("<div class='small text-muted mt-1'>" +
                    H(Convert.ToDateTime(r["CreatedAt"]).ToString("dd MMM yyyy hh:mm tt")) +
                    "</div></div>");
            }

            return sb.ToString();
        }

        // DISPLAY CONVERSATIONS
        protected string RenderConversations()
        {
            string query = "SELECT DISTINCT m.MenteeID, m.FullName FROM Mentee m " +
                           "INNER JOIN MentorMessages mm ON mm.MenteeID=m.MenteeID " +
                           "WHERE mm.MentorID=" + MentorId +
                           " ORDER BY m.FullName";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            foreach (DataRow r in dt.Rows)
            {
                int id = Convert.ToInt32(r["MenteeID"]);

                sb.Append("<a class='d-flex align-items-center gap-2 p-2 rounded-3 text-decoration-none' href='messages.aspx?menteeId=" +
                          id + "'>");
                sb.Append("<span class='mp-avatar sm'>" + H(Initials(r["FullName"])) + "</span>");
                sb.Append("<span>" + H(r["FullName"]) + "</span></a>");
            }

            if (sb.Length == 0)
                sb.Append("<div class='text-muted p-2'>No conversations yet.</div>");

            return sb.ToString();
        }

        // DISPLAY MESSAGES
        protected string RenderMessages()
        {
            int menteeId = GetSelectedMenteeId();

            if (menteeId <= 0)
                return "<div class='text-muted p-3'>Select a mentee to view messages.</div>";

            string query = "SELECT SenderType, MessageText, SentAt FROM MentorMessages " +
                           "WHERE MentorID=" + MentorId +
                           " AND MenteeID=" + menteeId +
                           " ORDER BY SentAt";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            foreach (DataRow r in dt.Rows)
            {
                bool mine = Convert.ToString(r["SenderType"]) == "Mentor";

                sb.Append("<div class='mb-2 " + (mine ? "text-end" : "") + "'>");
                sb.Append("<span class='d-inline-block p-2 rounded-3 " +
                          (mine ? "bg-primary text-white" : "bg-light") + "'>");
                sb.Append(H(r["MessageText"]) + "</span>");
                sb.Append("<div class='small text-muted'>" +
                          H(Convert.ToDateTime(r["SentAt"]).ToString("hh:mm tt")) +
                          "</div></div>");
            }

            if (sb.Length == 0)
                sb.Append("<div class='text-muted p-3'>No messages yet.</div>");

            return sb.ToString();
        }

        // DISPLAY SESSIONS
        protected string RenderSessions()
        {
            string query = "SELECT TOP 10 s.SessionID, s.SessionDate, s.SessionTime, " +
                           "s.Topic, s.Status, m.FullName FROM MentorSessions s " +
                           "INNER JOIN Mentee m ON m.MenteeID=s.MenteeID " +
                           "WHERE s.MentorID=" + MentorId +
                           " ORDER BY s.SessionDate, s.SessionTime";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            foreach (DataRow r in dt.Rows)
            {
                sb.Append("<div class='mp-card p-3 mb-2'>");
                sb.Append("<div class='d-flex justify-content-between'>");
                sb.Append("<strong>" + H(r["Topic"]) + "</strong>");
                sb.Append("<span class='badge bg-success'>" + H(r["Status"]) + "</span></div>");
                sb.Append("<div class='small text-muted'>" + H(r["FullName"]) + " • " +
                          H(Convert.ToDateTime(r["SessionDate"]).ToString("dd MMM yyyy")) +
                          " • " + H(r["SessionTime"]) + "</div></div>");
            }

            if (sb.Length == 0)
                sb.Append("<div class='text-muted'>No sessions scheduled.</div>");

            return sb.ToString();
        }

        // GET MENTOR DETAILS
        protected string GetMentorValue(string column)
        {
            string[] allowed = {
                "FullName", "Email", "Phone", "ProfessionalTitle",
                "Company", "Experience", "Expertise", "Skills",
                "Availability", "Bio", "ProfilePhoto"
            };

            bool valid = false;

            foreach (string item in allowed)
            {
                if (item == column)
                    valid = true;
            }

            if (!valid)
                return "";

            string query = "SELECT " + column + " FROM Mentor WHERE MentorID=" + MentorId;

            dt = GetData(query);

            if (dt.Rows.Count == 0)
                return "";

            return H(dt.Rows[0][0]);
        }

        // GET STATISTICS
        protected int GetStat(string query)
        {
            dt = GetData(query);

            if (dt.Rows.Count == 0)
                return 0;

            return Convert.ToInt32(dt.Rows[0][0]);
        }

        // GET INITIALS
        protected string Initials(object value)
        {
            string[] parts = Convert.ToString(value).Split(
                new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            if (parts.Length == 0)
                return "M";

            if (parts.Length == 1)
                return parts[0].Substring(0, 1).ToUpper();

            return (parts[0].Substring(0, 1) +
                    parts[parts.Length - 1].Substring(0, 1)).ToUpper();
        }

        // GET FIRST ACCEPTED MENTEE
        int GetFirstMenteeId()
        {
            string query = "SELECT TOP 1 m.MenteeID FROM Mentee m " +
                           "INNER JOIN MentorRequests r ON r.MenteeID=m.MenteeID " +
                           "WHERE r.MentorID=" + MentorId +
                           " AND r.Status='Accepted' ORDER BY m.MenteeID";

            dt = GetData(query);

            if (dt.Rows.Count == 0)
                return 0;

            return Convert.ToInt32(dt.Rows[0]["MenteeID"]);
        }

        // GET SELECTED MENTEE
        int GetSelectedMenteeId()
        {
            int id;

            if (int.TryParse(Request.QueryString["menteeId"], out id))
                return id;

            return GetFirstMenteeId();
        }

        // HANDLE REQUEST ACTION
        protected void HandleRequestAction()
        {
            string action = Request.QueryString["action"];
            int id;

            if (string.IsNullOrEmpty(action) ||
                !int.TryParse(Request.QueryString["id"], out id))
                return;

            if (action == "accept")
                AcceptRequest(id);

            else if (action == "reject")
                RejectRequest(id);

            Response.Redirect("requests.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        // ENSURE SUPPORT TABLES
        void EnsureMentorPanelTables()
        {
            getcon();

            string query = @"
IF OBJECT_ID('dbo.MentorRequests','U') IS NULL
CREATE TABLE dbo.MentorRequests(
 RequestID INT IDENTITY(1,1) PRIMARY KEY,
 MentorID INT NOT NULL,
 MenteeID INT NOT NULL,
 Goal NVARCHAR(500) NULL,
 Status NVARCHAR(30) NOT NULL DEFAULT 'Pending',
 CreatedAt DATETIME NOT NULL DEFAULT GETDATE());

IF OBJECT_ID('dbo.MentorAvailability','U') IS NULL
CREATE TABLE dbo.MentorAvailability(
 SlotID INT IDENTITY(1,1) PRIMARY KEY,
 MentorID INT NOT NULL,
 DayName NVARCHAR(20) NOT NULL,
 StartTime NVARCHAR(10) NOT NULL,
 EndTime NVARCHAR(10) NOT NULL,
 IsActive BIT NOT NULL DEFAULT 1);

IF OBJECT_ID('dbo.MentorSessions','U') IS NULL
CREATE TABLE dbo.MentorSessions(
 SessionID INT IDENTITY(1,1) PRIMARY KEY,
 MentorID INT NOT NULL,
 MenteeID INT NOT NULL,
 SessionDate DATE NOT NULL,
 SessionTime NVARCHAR(10) NOT NULL,
 Topic NVARCHAR(250) NULL,
 Status NVARCHAR(30) NOT NULL DEFAULT 'Scheduled');

IF OBJECT_ID('dbo.MentorMessages','U') IS NULL
CREATE TABLE dbo.MentorMessages(
 MessageID INT IDENTITY(1,1) PRIMARY KEY,
 MentorID INT NOT NULL,
 MenteeID INT NOT NULL,
 SenderType NVARCHAR(20) NOT NULL,
 MessageText NVARCHAR(MAX) NOT NULL,
 SentAt DATETIME NOT NULL DEFAULT GETDATE(),
 IsRead BIT NOT NULL DEFAULT 0);

IF OBJECT_ID('dbo.MentorNotifications','U') IS NULL
CREATE TABLE dbo.MentorNotifications(
 NotificationID INT IDENTITY(1,1) PRIMARY KEY,
 MentorID INT NOT NULL,
 Title NVARCHAR(200) NOT NULL,
 MessageText NVARCHAR(500) NULL,
 IsRead BIT NOT NULL DEFAULT 0,
 CreatedAt DATETIME NOT NULL DEFAULT GETDATE());

IF OBJECT_ID('dbo.MentorFeedback','U') IS NULL
CREATE TABLE dbo.MentorFeedback(
 FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
 MentorID INT NOT NULL,
 MenteeID INT NOT NULL,
 Rating INT NOT NULL,
 Comment NVARCHAR(1000) NULL,
 CreatedAt DATETIME NOT NULL DEFAULT GETDATE());";

            cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();

            con.Close();
        }

        // AVERAGE RATING
        protected string GetAverageRating()
        {
            string query = "SELECT AVG(CAST(Rating AS DECIMAL(10,2))) " +
                           "FROM MentorFeedback WHERE MentorID=" + MentorId;

            dt = GetData(query);

            if (dt.Rows.Count == 0 || dt.Rows[0][0] == DBNull.Value)
                return "0.0";

            return Convert.ToDecimal(dt.Rows[0][0]).ToString("0.0");
        }

        // REVIEW COUNT
        protected int GetReviewCount()
        {
            string query = "SELECT COUNT(*) FROM MentorFeedback WHERE MentorID=" + MentorId;

            dt = GetData(query);

            return dt.Rows.Count == 0 ? 0 : Convert.ToInt32(dt.Rows[0][0]);
        }

        // MENTEE DROPDOWN OPTIONS
        protected string RenderMenteeOptions()
        {
            string query = "SELECT DISTINCT m.MenteeID, m.FullName FROM Mentee m " +
                           "INNER JOIN MentorRequests r ON r.MenteeID=m.MenteeID " +
                           "WHERE r.MentorID=" + MentorId +
                           " AND r.Status='Accepted' ORDER BY m.FullName";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            foreach (DataRow r in dt.Rows)
            {
                sb.Append("<option value='" + Convert.ToInt32(r["MenteeID"]) + "'>");
                sb.Append(H(r["FullName"]) + "</option>");
            }

            return sb.ToString();
        }

        // SELECTED MENTEE NAME
        protected string RenderSelectedMenteeName()
        {
            int id = GetSelectedMenteeId();

            if (id <= 0)
                return "Mentee";

            string query = "SELECT FullName FROM Mentee WHERE MenteeID=" + id;

            dt = GetData(query);

            if (dt.Rows.Count == 0)
                return "Mentee";

            return H(dt.Rows[0]["FullName"]);
        }

        // GET MENTEE DETAILS
        protected string GetMenteeValue(string column)
        {
            string[] allowed = {
                "FullName", "Email", "Phone", "Education", "College",
                "CareerGoal", "LearningGoal", "SkillsInterests",
                "PreferredDomain", "Bio", "ProfilePhoto"
            };

            bool valid = false;

            foreach (string item in allowed)
            {
                if (item == column)
                    valid = true;
            }

            if (!valid)
                return "";

            int id = GetSelectedMenteeId();

            if (id <= 0)
                return "";

            string query = "SELECT " + column + " FROM Mentee WHERE MenteeID=" + id;

            dt = GetData(query);

            if (dt.Rows.Count == 0)
                return "";

            return H(dt.Rows[0][0]);
        }

        // DASHBOARD RECENT REQUESTS
        protected string RenderDashboardRequests()
        {
            string query = "SELECT TOP 5 r.RequestID, r.Goal, r.Status, m.FullName " +
                           "FROM MentorRequests r INNER JOIN Mentee m ON m.MenteeID=r.MenteeID " +
                           "WHERE r.MentorID=" + MentorId +
                           " ORDER BY r.CreatedAt DESC";

            dt = GetData(query);

            StringBuilder sb = new StringBuilder();

            foreach (DataRow r in dt.Rows)
            {
                sb.Append("<li class='list-group-item px-0 d-flex justify-content-between align-items-center'>");
                sb.Append("<span><strong>" + H(r["FullName"]) + "</strong><br>");
                sb.Append("<small class='text-muted'>" + H(r["Goal"]) + "</small></span>");
                sb.Append("<span class='badge bg-light text-dark'>" + H(r["Status"]) + "</span></li>");
            }

            if (sb.Length == 0)
                sb.Append("<li class='list-group-item px-0 text-muted'>No requests yet.</li>");

            return sb.ToString();
        }
    }
}