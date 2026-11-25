using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;

namespace MentorHub.Mentor
{
    public partial class Mentor_Index : System.Web.UI.Page
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
                Response.Redirect("~/Home/SignIn_up.aspx");
                return;
            }

            mentorID = Convert.ToInt32(Session["MentorID"]);

            // LOAD NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorID,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );

            if (!IsPostBack)
            {
                // TODAY DATE
                lblToday.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");

                // LOAD DASHBOARD
                LoadMentor();
                LoadDashboard();
                LoadSessions();
                LoadRecentRequests();
                LoadRecentActivity();
                LoadChart();
                LoadNotifications();
            }
        }

        // =====================================
        // GET CONNECTION
        // =====================================

        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // =====================================
        // LOAD MENTOR DETAILS
        // =====================================

        void LoadMentor()
        {
            getcon();

            string query = "SELECT * FROM Mentor WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                string name = dt.Rows[0]["FullName"].ToString();

                Label1.Text = "Welcome back, " + name;
                lblSidebarName.Text = name;

                // GENERATE INITIALS
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

                lblSidebarInitials.Text = initials;
                lblTopInitials.Text = initials;

                Session["MentorEmail"] = dt.Rows[0]["Email"].ToString();
            }

            con.Close();
        }

        // =====================================
        // LOAD DASHBOARD STATISTICS
        // =====================================

        void LoadDashboard()
        {
            getcon();

            // TOTAL ACCEPTED MENTEES
            string menteeQuery =
                "SELECT COUNT(DISTINCT MenteeID) FROM MentorRequests " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Accepted'";

            cmd = new SqlCommand(menteeQuery, con);

            lblMentees.Text = cmd.ExecuteScalar().ToString();


            // UPCOMING SESSIONS
            string sessionQuery =
                "SELECT COUNT(*) FROM MentorSessions " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Upcoming' " +
                "AND DATEADD(SECOND, " +
                "DATEDIFF(SECOND, CAST('00:00:00' AS TIME), CAST(SessionTime AS TIME)), " +
                "CAST(CAST(SessionDate AS DATE) AS DATETIME)) >= GETDATE()";

            cmd = new SqlCommand(sessionQuery, con);

            lblUpcomingSessions.Text = cmd.ExecuteScalar().ToString();


            // PENDING REQUESTS
            string requestQuery =
                "SELECT COUNT(*) FROM MentorRequests " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Pending'";

            cmd = new SqlCommand(requestQuery, con);

            lblPendingRequests.Text = cmd.ExecuteScalar().ToString();

            lblSidebarRequests.Text = lblPendingRequests.Text;


            // COMPLETED SESSIONS
            string completedQuery =
                "SELECT COUNT(*) FROM MentorSessions " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Completed'";

            cmd = new SqlCommand(completedQuery, con);

            lblCompletedSessions.Text = cmd.ExecuteScalar().ToString();


            // AVERAGE RATING
            string ratingQuery =
                "SELECT ISNULL(AVG(CAST(Rating AS FLOAT)), 0) " +
                "FROM MentorFeedback " +
                "WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(ratingQuery, con);

            double averageRating = Convert.ToDouble(cmd.ExecuteScalar());

            lblAverageRating.Text = averageRating.ToString("0.0");


            // UNREAD MESSAGES
            string messageQuery =
                "SELECT COUNT(*) FROM MentorMessages " +
                "WHERE MentorID = " + mentorID +
                " AND IsRead = 0";

            cmd = new SqlCommand(messageQuery, con);

            lblSidebarMessages.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        // =====================================
        // LOAD UPCOMING SESSIONS
        // =====================================

        void LoadSessions()
        {
            pnlCurrentSession.Visible = false;
            pnlNoSession.Visible = true;
            pnlNoUpcoming.Visible = true;

            getcon();

            string sessionDateTime =
                "DATEADD(SECOND, " +
                "DATEDIFF(SECOND, CAST('00:00:00' AS TIME), CAST(SessionTime AS TIME)), " +
                "CAST(CAST(SessionDate AS DATE) AS DATETIME))";

            string query =
                "SELECT TOP 5 * FROM MentorSessions " +
                "WHERE MentorID = " + mentorID +
                " AND Status = 'Upcoming' " +
                "AND " + sessionDateTime + " >= GETDATE() " +
                "ORDER BY " + sessionDateTime + " ASC";

            cmd = new SqlCommand(query, con);

            da = new SqlDataAdapter(cmd);

            DataTable sessions = new DataTable();

            da.Fill(sessions);

            // CHECK SESSIONS
            if (sessions.Rows.Count == 0)
            {
                rptUpcoming.DataSource = null;
                rptUpcoming.DataBind();

                con.Close();
                return;
            }

            // NEXT SESSION
            DataRow first = sessions.Rows[0];

            DateTime when = GetSessionDateTime(first);

            lblCurSessionName.Text =
                Server.HtmlEncode(ReadSessionName(first));

            lblCurSessionStatus.Text =
                Server.HtmlEncode(first["Status"].ToString());

            lblCurSessionMentee.Text =
                Server.HtmlEncode(ReadMenteeName(first));

            lblCurSessionDate.Text =
                when.ToString("dddd, dd MMM yyyy");

            lblCurSessionTime.Text =
                when.ToString("hh:mm tt");

            lblCurSessionCountdown.Text =
                BuildCountdown(when);

            pnlCurrentSession.Visible = true;
            pnlNoSession.Visible = false;


            // REMAINING UPCOMING SESSIONS
            DataTable list = new DataTable();

            list.Columns.Add("SessionName");
            list.Columns.Add("MenteeName");
            list.Columns.Add("Month");
            list.Columns.Add("Day");
            list.Columns.Add("TimeText");

            for (int i = 1; i < sessions.Rows.Count; i++)
            {
                DataRow row = sessions.Rows[i];

                DateTime d = GetSessionDateTime(row);

                list.Rows.Add(
                    ReadSessionName(row),
                    ReadMenteeName(row),
                    d.ToString("MMM"),
                    d.ToString("dd"),
                    d.ToString("hh:mm tt")
                );
            }

            rptUpcoming.DataSource = list;
            rptUpcoming.DataBind();

            pnlNoUpcoming.Visible = list.Rows.Count == 0;

            con.Close();
        }

        // =====================================
        // GET SESSION DATE AND TIME
        // =====================================

        DateTime GetSessionDateTime(DataRow row)
        {
            DateTime sessionDate = Convert.ToDateTime(row["SessionDate"]);

            TimeSpan sessionTime = TimeSpan.Zero;

            if (row["SessionTime"] != DBNull.Value)
            {
                sessionTime = TimeSpan.Parse(row["SessionTime"].ToString());
            }

            return sessionDate.Date.Add(sessionTime);
        }

        // =====================================
        // GET SESSION NAME
        // =====================================

        string ReadSessionName(DataRow row)
        {
            if (row.Table.Columns.Contains("SessionTitle") &&
                row["SessionTitle"] != DBNull.Value &&
                row["SessionTitle"].ToString() != "")
            {
                return row["SessionTitle"].ToString();
            }

            if (row.Table.Columns.Contains("Title") &&
                row["Title"] != DBNull.Value &&
                row["Title"].ToString() != "")
            {
                return row["Title"].ToString();
            }

            if (row.Table.Columns.Contains("Topic") &&
                row["Topic"] != DBNull.Value &&
                row["Topic"].ToString() != "")
            {
                return row["Topic"].ToString();
            }

            if (row.Table.Columns.Contains("SessionName") &&
                row["SessionName"] != DBNull.Value &&
                row["SessionName"].ToString() != "")
            {
                return row["SessionName"].ToString();
            }

            if (row.Table.Columns.Contains("Subject") &&
                row["Subject"] != DBNull.Value &&
                row["Subject"].ToString() != "")
            {
                return row["Subject"].ToString();
            }

            return "Mentoring Session";
        }

        // =====================================
        // GET MENTEE NAME
        // =====================================

        string ReadMenteeName(DataRow row)
        {
            if (row.Table.Columns.Contains("MenteeID") &&
                row["MenteeID"] != DBNull.Value)
            {
                int menteeID = Convert.ToInt32(row["MenteeID"]);

                string query =
                    "SELECT FullName FROM Mentee WHERE MenteeID = " + menteeID;

                cmd = new SqlCommand(query, con);

                object value = cmd.ExecuteScalar();

                if (value != null && value != DBNull.Value)
                {
                    return value.ToString();
                }
            }

            return "Mentee";
        }

        // =====================================
        // SESSION COUNTDOWN
        // =====================================

        string BuildCountdown(DateTime when)
        {
            TimeSpan diff = when - DateTime.Now;

            if (diff.TotalMinutes <= 1)
            {
                return "Starting now";
            }

            if (diff.TotalHours < 1)
            {
                return "Starts in " + (int)diff.TotalMinutes + " min";
            }

            if (diff.TotalDays < 1)
            {
                return "Starts in " +
                       (int)diff.TotalHours + " hr " +
                       diff.Minutes + " min";
            }

            return "Starts in " +
                   (int)diff.TotalDays + " day" +
                   ((int)diff.TotalDays == 1 ? "" : "s") +
                   " " + diff.Hours + " hr";
        }

        // =====================================
        // LOAD NOTIFICATIONS
        // =====================================

        void LoadNotifications()
        {
            getcon();

            // UNREAD COUNT
            string countQuery =
                "SELECT COUNT(*) FROM MentorNotifications " +
                "WHERE MentorID = " + mentorID +
                " AND IsRead = 0";

            cmd = new SqlCommand(countQuery, con);

            int unreadCount = Convert.ToInt32(cmd.ExecuteScalar());

            lblNotifDot.Visible = unreadCount > 0;


            // LATEST 5 NOTIFICATIONS
            string query =
                "SELECT TOP 5 NotificationID, Title, Message, " +
                "NotificationType, IsRead, CreatedAt " +
                "FROM MentorNotifications " +
                "WHERE MentorID = " + mentorID +
                " ORDER BY CreatedAt DESC";

            cmd = new SqlCommand(query, con);

            da = new SqlDataAdapter(cmd);

            dt = new DataTable();

            da.Fill(dt);

            rptTopNotifications.DataSource = dt;
            rptTopNotifications.DataBind();

            pnlTopEmpty.Visible = dt.Rows.Count == 0;

            con.Close();
        }

        // =====================================
        // LOAD RECENT REQUESTS
        // =====================================

        void LoadRecentRequests()
        {
            getcon();

            string query =
                "SELECT TOP 5 M.FullName, R.Status, " +
                "R.CreatedAt AS RequestDate " +
                "FROM MentorRequests R " +
                "INNER JOIN Mentee M ON R.MenteeID = M.MenteeID " +
                "WHERE R.MentorID = " + mentorID +
                " ORDER BY R.CreatedAt DESC";

            cmd = new SqlCommand(query, con);

            da = new SqlDataAdapter(cmd);

            dt = new DataTable();

            da.Fill(dt);

            rptRecentRequests.DataSource = dt;
            rptRecentRequests.DataBind();

            pnlNoRequests.Visible = dt.Rows.Count == 0;

            con.Close();
        }

        // =====================================
        // LOAD RECENT ACTIVITY
        // =====================================

        void LoadRecentActivity()
        {
            getcon();

            string query =
                "SELECT TOP 5 " +
                "M.FullName + ' - ' + R.Status AS ActivityTitle, " +
                "R.CreatedAt AS ActivityDate, " +
                "'Mentoring request updated' AS ActivityDescription " +
                "FROM MentorRequests R " +
                "INNER JOIN Mentee M ON R.MenteeID = M.MenteeID " +
                "WHERE R.MentorID = " + mentorID +
                " ORDER BY R.CreatedAt DESC";

            cmd = new SqlCommand(query, con);

            da = new SqlDataAdapter(cmd);

            dt = new DataTable();

            da.Fill(dt);

            rptActivity.DataSource = dt;
            rptActivity.DataBind();

            pnlNoActivity.Visible = dt.Rows.Count == 0;

            con.Close();
        }

        // =====================================
        // LOAD SESSION CHART
        // =====================================

        void LoadChart()
        {
            pnlChart.Visible = false;
            pnlNoChart.Visible = true;

            getcon();

            List<string> labels = new List<string>();
            List<int> values = new List<int>();

            int grandTotal = 0;

            // LAST SIX MONTHS
            for (int i = 5; i >= 0; i--)
            {
                DateTime monthDate = DateTime.Today.AddMonths(-i);

                DateTime startDate = new DateTime(
                    monthDate.Year,
                    monthDate.Month,
                    1
                );

                DateTime endDate = startDate.AddMonths(1);

                string query =
                    "SELECT COUNT(*) FROM MentorSessions " +
                    "WHERE MentorID = " + mentorID +
                    " AND SessionDate >= '" +
                    startDate.ToString("yyyy-MM-dd") +
                    "' AND SessionDate < '" +
                    endDate.ToString("yyyy-MM-dd") + "'";

                cmd = new SqlCommand(query, con);

                int total = Convert.ToInt32(cmd.ExecuteScalar());

                labels.Add(monthDate.ToString("MMM"));
                values.Add(total);

                grandTotal += total;
            }

            // CHECK CHART DATA
            if (grandTotal > 0)
            {
                JavaScriptSerializer js = new JavaScriptSerializer();

                hfChartLabels.Value = js.Serialize(labels);
                hfChartValues.Value = js.Serialize(values);

                pnlChart.Visible = true;
                pnlNoChart.Visible = false;
            }
            else
            {
                hfChartLabels.Value = "[]";
                hfChartValues.Value = "[]";
            }

            con.Close();
        }
    }
}