
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace MentorHub.Mentor
{
    public partial class Mentor_Schedule : Page
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

            // UPDATE SESSION STATUS
            UpdateSessionStatuses();

            // LOAD MENTOR DETAILS
            LoadMentorDetails();

            // LOAD SIDEBAR COUNTS
            LoadSidebarCounts();

            // LOAD NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorID,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );

            if (!IsPostBack)
            {
                // LOAD ACCEPTED MENTEES
                LoadMentees();

                // LOAD CALENDAR
                LoadSessions();

                // LOAD UPCOMING SESSIONS
                LoadUpcomingSessions();
            }
        }

        // CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // UPDATE SESSION STATUS
        void UpdateSessionStatuses()
        {
            getcon();

            // COMPLETE OLD SESSIONS
            string query =
                "UPDATE MentorSessions SET Status = 'Completed' " +
                "WHERE MentorID = " + mentorID +
                " AND SessionDate < CAST(GETDATE() AS DATE) " +
                "AND Status IN ('Upcoming', 'Scheduled')";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            // UPDATE FUTURE SESSIONS
            string query2 =
                "UPDATE MentorSessions SET Status = 'Upcoming' " +
                "WHERE MentorID = " + mentorID +
                " AND SessionDate >= CAST(GETDATE() AS DATE) " +
                "AND Status = 'Scheduled'";

            cmd = new SqlCommand(query2, con);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        // LOAD MENTOR DETAILS
        void LoadMentorDetails()
        {
            getcon();

            string query =
                "SELECT FullName FROM Mentor " +
                "WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            object result = cmd.ExecuteScalar();

            string name = "Mentor";

            if (result != null)
            {
                name = result.ToString();
            }

            lblSidebarName.Text = Server.HtmlEncode(name);

            string initials = GetInitials(name);

            lblSidebarInitials.Text = initials;
            lblTopInitials.Text = initials;

            con.Close();
        }

        // GET INITIALS
        string GetInitials(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
            {
                return "M";
            }

            string[] parts = name.Trim().Split(
                new char[] { ' ' },
                StringSplitOptions.RemoveEmptyEntries
            );

            if (parts.Length == 1)
            {
                return parts[0].Substring(0, 1).ToUpper();
            }

            return (
                parts[0].Substring(0, 1) +
                parts[parts.Length - 1].Substring(0, 1)
            ).ToUpper();
        }

        // LOAD SIDEBAR COUNTS
        void LoadSidebarCounts()
        {
            getcon();

            // PENDING REQUESTS
            string requestQuery =
                "SELECT COUNT(*) FROM MentorRequests " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Pending'";

            cmd = new SqlCommand(requestQuery, con);

            lblSidebarRequests.Text = cmd.ExecuteScalar().ToString();

            // UNREAD MESSAGES
            string messageQuery =
                "SELECT COUNT(*) FROM MentorMessages " +
                "WHERE MentorID = " + mentorID +
                " AND SenderType = 'Mentee' AND IsRead = 0";

            cmd = new SqlCommand(messageQuery, con);

            lblSidebarMessages.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        // LOAD ACCEPTED MENTEES
        void LoadMentees()
        {
            getcon();

            string query =
                "SELECT DISTINCT MenteeID FROM MentorRequests " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Accepted' " +
                "ORDER BY MenteeID";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            ddlSessionMentee.Items.Clear();

            ddlSessionMentee.Items.Add(
                new ListItem("-- Select Mentee --", "")
            );

            foreach (DataRow row in dt.Rows)
            {
                string menteeID = row["MenteeID"].ToString();

                ddlSessionMentee.Items.Add(
                    new ListItem("Mentee #" + menteeID, menteeID)
                );
            }

            if (dt.Rows.Count == 0)
            {
                ddlSessionMentee.Items.Add(
                    new ListItem("No accepted mentees available", "")
                );
            }

            con.Close();
        }

        // LOAD CALENDAR SESSIONS
        void LoadSessions()
        {
            getcon();

            string query =
                "SELECT SessionID, MenteeID, SessionDate, SessionTime, Topic, Status " +
                "FROM MentorSessions WHERE MentorID = " + mentorID +
                " ORDER BY SessionDate, SessionTime";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            List<object> sessionList = new List<object>();

            foreach (DataRow row in dt.Rows)
            {
                DateTime sessionDate = Convert.ToDateTime(row["SessionDate"]);

                string sessionTime = row["SessionTime"].ToString();

                // FORMAT TIME
                TimeSpan time;

                if (TimeSpan.TryParse(sessionTime, out time))
                {
                    sessionTime = DateTime.Today.Add(time).ToString("hh:mm tt");
                }

                sessionList.Add(new
                {
                    sessionID = row["SessionID"].ToString(),
                    date = sessionDate.ToString("yyyy-MM-dd"),
                    time = sessionTime,
                    menteeID = row["MenteeID"].ToString(),
                    topic = row["Topic"].ToString(),
                    status = row["Status"].ToString()
                });
            }

            // CONVERT TO JSON
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            hfSessionsJson.Value = serializer.Serialize(sessionList);

            con.Close();
        }

        // LOAD UPCOMING SESSIONS
        void LoadUpcomingSessions()
        {
            getcon();

            string query =
                "SELECT TOP 10 SessionID, MenteeID, SessionDate, SessionTime, Topic, Status " +
                "FROM MentorSessions WHERE MentorID = " + mentorID +
                " AND SessionDate >= CAST(GETDATE() AS DATE) " +
                "AND Status NOT IN ('Cancelled', 'Completed') " +
                "ORDER BY SessionDate, SessionTime";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            rptUpcomingSessions.DataSource = dt;
            rptUpcomingSessions.DataBind();

            pnlUpcomingEmpty.Visible = dt.Rows.Count == 0;

            con.Close();
        }

        // ADD SESSION
        protected void btnSaveSession_Click(object sender, EventArgs e)
        {
            pnlMessage.Visible = false;

            DateTime sessionDate;
            TimeSpan sessionTime;
            int menteeID;

            // CHECK DATE
            if (!DateTime.TryParse(txtSessionDate.Text, out sessionDate))
            {
                ShowMessage("Please select a valid date.", "alert-danger", true);
                return;
            }

            // CHECK TIME
            if (!TimeSpan.TryParse(txtSessionTime.Text, out sessionTime))
            {
                ShowMessage("Please select a valid time.", "alert-danger", true);
                return;
            }

            // CHECK MENTEE
            if (!int.TryParse(ddlSessionMentee.SelectedValue, out menteeID))
            {
                ShowMessage("Please select a mentee.", "alert-danger", true);
                return;
            }

            // CHECK TOPIC
            string topic = txtSessionTopic.Text.Trim();

            if (topic == "")
            {
                ShowMessage("Please enter the session topic.", "alert-danger", true);
                return;
            }

            if (topic.Length > 200)
            {
                ShowMessage("Topic cannot exceed 200 characters.", "alert-danger", true);
                return;
            }

            // CHECK PAST DATE
            if (sessionDate.Date < DateTime.Today)
            {
                ShowMessage("You cannot schedule a session in the past.", "alert-danger", true);
                return;
            }

            // CHECK ACCEPTED MENTEE
            getcon();

            string checkMentee =
                "SELECT COUNT(*) FROM MentorRequests " +
                "WHERE MentorID = " + mentorID +
                " AND MenteeID = " + menteeID +
                " AND Status = 'Accepted'";

            cmd = new SqlCommand(checkMentee, con);

            int accepted = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            if (accepted == 0)
            {
                ShowMessage("This mentee is not accepted under your account.", "alert-danger", true);
                return;
            }

            // CHECK DUPLICATE SESSION
            getcon();

            string checkSession =
                "SELECT COUNT(*) FROM MentorSessions " +
                "WHERE MentorID = " + mentorID +
                " AND MenteeID = " + menteeID +
                " AND SessionDate = '" + sessionDate.ToString("yyyy-MM-dd") + "'" +
                " AND SessionTime = '" + sessionTime.ToString(@"hh\:mm\:ss") + "'" +
                " AND Status <> 'Cancelled'";

            cmd = new SqlCommand(checkSession, con);

            int duplicate = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            if (duplicate > 0)
            {
                ShowMessage("This mentee already has a session at this date and time.", "alert-warning", true);
                return;
            }

            // INSERT SESSION
            try
            {
                getcon();

                string query =
                    "INSERT INTO MentorSessions " +
                    "(MentorID, MenteeID, SessionDate, SessionTime, Topic, Status) " +
                    "VALUES (" +
                    mentorID + ", " +
                    menteeID + ", '" +
                    sessionDate.ToString("yyyy-MM-dd") + "', '" +
                    sessionTime.ToString(@"hh\:mm\:ss") + "', '" +
                    topic.Replace("'", "''") + "', 'Upcoming')";

                cmd = new SqlCommand(query, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    // CLEAR TOPIC
                    txtSessionTopic.Text = "";

                    ShowMessage("Session successfully scheduled!", "alert-success", false);

                    // REFRESH CALENDAR
                    LoadSessions();

                    // REFRESH UPCOMING SESSIONS
                    LoadUpcomingSessions();

                    // CLOSE MODAL
                    string script =
                        "var modalElement = document.getElementById('addSessionModal');" +
                        "if(modalElement){" +
                        "var modal = bootstrap.Modal.getOrCreateInstance(modalElement);" +
                        "modal.hide();}";

                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "CloseModal",
                        script,
                        true
                    );
                }
                else
                {
                    ShowMessage("Session was not saved.", "alert-danger", true);
                }
            }
            catch (Exception)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowMessage("Unable to save session. Please try again.", "alert-danger", true);
            }
        }

        // SHOW MESSAGE
        void ShowMessage(string message, string cssClass, bool reopenModal)
        {
            pnlMessage.Visible = true;

            pnlMessage.CssClass = "alert schedule-alert " + cssClass;

            lblMessage.Text = Server.HtmlEncode(message);

            // REOPEN MODAL ON ERROR
            if (reopenModal)
            {
                string script =
                    "var modalElement = document.getElementById('addSessionModal');" +
                    "if(modalElement){" +
                    "var modal = bootstrap.Modal.getOrCreateInstance(modalElement);" +
                    "modal.show();}";

                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "OpenModal",
                    script,
                    true
                );
            }
        }
    }
}
