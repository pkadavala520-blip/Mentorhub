using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MentorHub.Mentor
{
    public partial class Mentor_Feedback : System.Web.UI.Page
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

            // LOAD NOTIFICATIONS
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

                // LOAD SIDEBAR COUNTS
                LoadSidebarCounts();

                // LOAD RATING SUMMARY
                LoadRatingSummary();

                // LOAD RATING BREAKDOWN
                LoadRatingBars();

                // LOAD REVIEWS
                LoadReviews();
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

        void LoadMentorDetails()
        {
            getcon();

            string query =
                "SELECT FullName FROM Mentor WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            string name = "Mentor";

            if (dt.Rows.Count > 0)
            {
                name = dt.Rows[0]["FullName"].ToString();
            }

            lblSidebarName.Text = name;
            lblSidebarInitials.Text = GetInitials(name);

            con.Close();
        }

        // =====================================
        // GET INITIALS
        // =====================================

        string GetInitials(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
            {
                return "M";
            }

            string initials = "";

            string[] words = name.Trim().Split(' ');

            foreach (string word in words)
            {
                if (word.Length > 0)
                {
                    initials += word.Substring(0, 1).ToUpper();

                    if (initials.Length == 2)
                    {
                        break;
                    }
                }
            }

            return initials;
        }

        // =====================================
        // LOAD SIDEBAR COUNTS
        // =====================================

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
                " AND IsRead = 0";

            cmd = new SqlCommand(messageQuery, con);

            lblSidebarMessages.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        // =====================================
        // LOAD RATING SUMMARY
        // =====================================

        void LoadRatingSummary()
        {
            getcon();

            string query =
                "SELECT COUNT(*) AS TotalReviews, " +
                "ISNULL(AVG(CAST(Rating AS FLOAT)), 0) AS AverageRating " +
                "FROM MentorFeedback " +
                "WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            int total = Convert.ToInt32(dt.Rows[0]["TotalReviews"]);

            double average = Convert.ToDouble(dt.Rows[0]["AverageRating"]);

            lblTotalReviews.Text = total.ToString();

            lblAverageRating.Text = average.ToString("0.0");

            lblAverageStars.Text = GetStars((int)Math.Round(average));

            con.Close();
        }

        // =====================================
        // LOAD RATING BREAKDOWN
        // =====================================

        void LoadRatingBars()
        {
            getcon();

            // GET RATINGS COUNT
            string query =
                "SELECT Rating, COUNT(*) AS Total " +
                "FROM MentorFeedback " +
                "WHERE MentorID = " + mentorID +
                " GROUP BY Rating";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            // TOTAL REVIEWS
            int totalReviews = 0;

            foreach (DataRow row in dt.Rows)
            {
                totalReviews += Convert.ToInt32(row["Total"]);
            }

            // CREATE DISPLAY TABLE
            DataTable displayTable = new DataTable();

            displayTable.Columns.Add("Rating", typeof(int));
            displayTable.Columns.Add("Total", typeof(int));
            displayTable.Columns.Add("Percent", typeof(int));

            // DISPLAY 5 TO 1 STARS
            for (int i = 5; i >= 1; i--)
            {
                int count = 0;

                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToInt32(row["Rating"]) == i)
                    {
                        count = Convert.ToInt32(row["Total"]);
                    }
                }

                int percent = 0;

                if (totalReviews > 0)
                {
                    percent = (int)Math.Round(
                        count * 100.0 / totalReviews
                    );
                }

                displayTable.Rows.Add(i, count, percent);
            }

            // BIND RATING BARS
            rptRatingBars.DataSource = displayTable;
            rptRatingBars.DataBind();

            con.Close();
        }

        // =====================================
        // LOAD REVIEWS
        // =====================================

        void LoadReviews()
        {
            getcon();

            string query =
                "SELECT F.FeedbackID, F.Rating, " +
                "ISNULL(F.Comment, '') AS Comment, " +
                "F.CreatedAt, " +
                "ISNULL(M.FullName, 'Mentee') AS FullName " +
                "FROM MentorFeedback F " +
                "LEFT JOIN Mentee M ON F.MenteeID = M.MenteeID " +
                "WHERE F.MentorID = " + mentorID +
                " ORDER BY F.CreatedAt DESC";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            // ADD INITIALS COLUMN
            dt.Columns.Add("Initials", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                row["Initials"] = GetInitials(row["FullName"].ToString());
            }

            // BIND REVIEWS
            rptReviews.DataSource = dt;
            rptReviews.DataBind();

            // EMPTY REVIEWS
            pnlNoReviews.Visible = dt.Rows.Count == 0;

            rptReviews.Visible = dt.Rows.Count > 0;

            con.Close();
        }

        // =====================================
        // DISPLAY STARS
        // =====================================

        public string GetStars(int rating)
        {
            string stars = "";

            for (int i = 1; i <= 5; i++)
            {
                if (i <= rating)
                {
                    stars += "★";
                }
                else
                {
                    stars += "☆";
                }
            }

            return stars;
        }
    }
}