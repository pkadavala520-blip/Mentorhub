using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_Notifications : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            mentorID = Convert.ToInt32(Session["MentorID"]);

            // LOAD TOPBAR NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorID,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );

            if (!IsPostBack)
            {
                // LOAD MENTOR DETAILS
                LoadMentorDetails();

                // LOAD NOTIFICATIONS
                LoadNotifications();

                // LOAD SIDEBAR COUNTS
                LoadSidebarCounts();
            }
        }

        // GET CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // =====================================
        // LOAD MENTOR DETAILS
        // =====================================

        void LoadMentorDetails()
        {
            getcon();

            string query = "SELECT FullName FROM Mentor WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                string name = dt.Rows[0]["FullName"].ToString();

                lblMiniName.Text = name;

                string initials = "";

                string[] words = name.Trim().Split(' ');

                foreach (string word in words)
                {
                    if (word.Length > 0)
                    {
                        initials += word.Substring(0, 1).ToUpper();
                    }
                }

                if (initials.Length > 2)
                {
                    initials = initials.Substring(0, 2);
                }

                lblMiniAvatar.Text = initials;
            }

            con.Close();
        }

        // =====================================
        // LOAD ALL NOTIFICATIONS
        // =====================================

        void LoadNotifications()
        {
            getcon();

            string query = "SELECT NotificationID, MentorID, Title, Message, " +
                           "NotificationType, IsRead, CreatedAt " +
                           "FROM dbo.MentorNotifications " +
                           "WHERE MentorID = " + mentorID +
                           " ORDER BY CreatedAt DESC";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            // DISPLAY NOTIFICATIONS
            rptNotifications.DataSource = dt;
            rptNotifications.DataBind();

            // SHOW EMPTY PANEL
            pnlNoNotifications.Visible = dt.Rows.Count == 0;

            // COUNT UNREAD NOTIFICATIONS
            int unreadCount = 0;

            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToBoolean(row["IsRead"]) == false)
                {
                    unreadCount++;
                }
            }

            lblUnreadCount.Text = unreadCount.ToString();

            lblSidebarNotifications.Text = unreadCount.ToString();

            con.Close();
        }

        // =====================================
        // LOAD SIDEBAR COUNTS
        // =====================================

        void LoadSidebarCounts()
        {
            getcon();

            // PENDING REQUESTS
            string requestQuery = "SELECT COUNT(*) FROM MentorRequests " +
                                  "WHERE MentorID = " + mentorID +
                                  " AND Status = 'Pending'";

            cmd = new SqlCommand(requestQuery, con);

            lblSidebarRequests.Text = cmd.ExecuteScalar().ToString();


            // UNREAD MESSAGES
            string messageQuery = "SELECT COUNT(*) FROM MentorMessages " +
                                   "WHERE MentorID = " + mentorID +
                                   " AND IsRead = 0";

            cmd = new SqlCommand(messageQuery, con);

            lblSidebarMessages.Text = cmd.ExecuteScalar().ToString();


            // UNREAD NOTIFICATIONS
            string notificationQuery = "SELECT COUNT(*) FROM MentorNotifications " +
                                        "WHERE MentorID = " + mentorID +
                                        " AND IsRead = 0";

            cmd = new SqlCommand(notificationQuery, con);

            lblSidebarNotifications.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        // =====================================
        // MARK ONE NOTIFICATION AS READ
        // =====================================

        protected void rptNotifications_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Read")
            {
                int notificationID = Convert.ToInt32(e.CommandArgument);

                getcon();

                string query = "UPDATE dbo.MentorNotifications SET IsRead = 1 " +
                               "WHERE NotificationID = " + notificationID +
                               " AND MentorID = " + mentorID;

                cmd = new SqlCommand(query, con);

                cmd.ExecuteNonQuery();

                con.Close();

                ShowMessage("Notification marked as read.");

                // RELOAD NOTIFICATIONS
                LoadNotifications();

                // RELOAD SIDEBAR COUNTS
                LoadSidebarCounts();

                // RELOAD TOPBAR NOTIFICATIONS
                MentorNotificationsHelper.LoadNotifications(
                    mentorID,
                    rptTopNotifications,
                    lblNotifDot,
                    pnlTopEmpty
                );
            }
        }

        // =====================================
        // MARK ALL NOTIFICATIONS AS READ
        // =====================================

        protected void btnMarkAllRead_Click(object sender, EventArgs e)
        {
            getcon();

            string query = "UPDATE dbo.MentorNotifications SET IsRead = 1 " +
                            "WHERE MentorID = " + mentorID +
                            " AND IsRead = 0";

            cmd = new SqlCommand(query, con);

            int result = cmd.ExecuteNonQuery();

            con.Close();

            if (result > 0)
            {
                ShowMessage("All notifications marked as read.");
            }
            else
            {
                ShowMessage("There are no unread notifications.");
            }

            // RELOAD NOTIFICATIONS
            LoadNotifications();

            // RELOAD SIDEBAR COUNTS
            LoadSidebarCounts();

            // RELOAD TOPBAR NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorID,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );
        }

        // =====================================
        // SHOW MESSAGE
        // =====================================

        void ShowMessage(string message)
        {
            pnlMessage.Visible = true;

            lblMessage.Text = message;
        }

        // =====================================
        // NOTIFICATION ICON
        // =====================================

        public string GetNotificationIcon(string type)
        {
            switch ((type ?? "").ToLower())
            {
                case "request":
                    return "bi-person-plus";

                case "message":
                    return "bi-chat-dots";

                case "session":
                    return "bi-calendar-check";

                case "feedback":
                    return "bi-star";

                case "approval":
                    return "bi-check-circle";

                case "profile":
                    return "bi-person-gear";

                default:
                    return "bi-bell";
            }
        }
    }
}