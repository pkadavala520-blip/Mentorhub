
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MentorHub.Mentor
{
    public partial class Mentor_Mentees : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MentorID"] != null)
            {
                mentorID = Convert.ToInt32(Session["MentorID"]);

                getcon();

                if (!IsPostBack)
                {
                    LoadMentorDetails();
                    LoadSidebarCounts();
                    fillGrid();
                }

                con.Close();
            }
            else
            {
                Response.Redirect("~/Home/SignIn_up.aspx");
            }
            int mentorId = Convert.ToInt32(Session["MentorID"]);

            MentorNotificationsHelper.LoadNotifications(
                mentorId,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );
        }

        // DATABASE CONNECTION
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // MENTOR DETAILS
        void LoadMentorDetails()
        {
            da = new SqlDataAdapter(
                "SELECT FullName FROM Mentor WHERE MentorID = " + mentorID, con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string name = ds.Tables[0].Rows[0]["FullName"].ToString();

                lblSidebarName.Text = name;

                string initials = "";

                string[] words = name.Trim().Split(' ');

                foreach (string word in words)
                {
                    if (word.Length > 0)
                    {
                        initials += word.Substring(0, 1);

                        if (initials.Length == 2)
                            break;
                    }
                }

                lblSidebarInitials.Text = initials.ToUpper();
            }
        }

        // SIDEBAR REQUEST COUNT
        void LoadSidebarCounts()
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM MentorRequests WHERE MentorID = "
                + mentorID + " AND Status = 'Pending'", con);

            lblSidebarRequests.Text = cmd.ExecuteScalar().ToString();
        }

        // DISPLAY ACCEPTED MENTEES
        void fillGrid()
        {
            string query =
                "SELECT R.RequestID, R.MentorID, R.MenteeID, R.Goal, R.Status, R.CreatedAt, " +
                "M.FullName, M.Email, M.PreferredDomain, " +
                "LEFT(M.FullName, 1) + " +
                "ISNULL(SUBSTRING(M.FullName, CHARINDEX(' ', M.FullName + ' ') + 1, 1), '') AS Initials " +
                "FROM MentorRequests R " +
                "INNER JOIN Mentee M ON R.MenteeID = M.MenteeID " +
                "WHERE R.MentorID = " + mentorID +
                " AND R.Status = 'Accepted'";

            string search = txtMenteeSearch.Text.Trim();

            if (search != "")
            {
                search = search.Replace("'", "''");

                query += " AND (M.FullName LIKE '%" + search + "%' " +
                         "OR M.Email LIKE '%" + search + "%' " +
                         "OR R.Goal LIKE '%" + search + "%' " +
                         "OR M.PreferredDomain LIKE '%" + search + "%')";
            }

            query += " ORDER BY R.CreatedAt DESC";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();
            da.Fill(ds);

            rptMentees.DataSource = ds;
            rptMentees.DataBind();

            if (ds.Tables[0].Rows.Count == 0)
            {
                pnlNoMentees.Visible = true;
            }
            else
            {
                pnlNoMentees.Visible = false;
            }
        }

        // SEARCH MENTEES
        protected void txtMenteeSearch_TextChanged(object sender, EventArgs e)
        {
            getcon();

            fillGrid();

            con.Close();
        }

        protected void rptMentees_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {

        }
    }
}
