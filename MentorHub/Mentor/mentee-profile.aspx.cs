
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MentorHub.Mentor
{
    public partial class Mentor_Mentee_Profile : System.Web.UI.Page
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

                if (!IsPostBack)
                {
                    getcon();

                    LoadMentorDetails();
                    LoadMenteeProfile();

                    con.Close();
                }
            }
            else
            {
                Response.Redirect("~/Home/SignIn_up.aspx");
            }
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

        // LOAD SELECTED MENTEE PROFILE
        void LoadMenteeProfile()
        {
            int requestID;

            if (!int.TryParse(Request.QueryString["id"], out requestID))
            {
                ShowMessage("Invalid mentee profile.", "warning");
                return;
            }

            string query =
                "SELECT R.RequestID, R.Goal, R.CreatedAt, " +
                "M.FullName, M.Email, M.Phone, M.Education, M.College, " +
                "M.CareerGoal, M.LearningGoal, M.PreferredDomain, M.Bio " +
                "FROM MentorRequests R " +
                "INNER JOIN Mentee M ON R.MenteeID = M.MenteeID " +
                "WHERE R.RequestID = " + requestID +
                " AND R.MentorID = " + mentorID +
                " AND R.Status = 'Accepted'";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];

                string name = dr["FullName"].ToString();

                lblMenteeName.Text = name;
                lblMenteeInitials.Text = GetInitials(name);

                lblMenteeGoal.Text = dr["Goal"].ToString();

                lblEmail.Text = dr["Email"].ToString();
                lblPhone.Text = dr["Phone"].ToString();

                lblCareerGoal.Text = dr["CareerGoal"].ToString();
                lblEducation.Text = dr["Education"].ToString();
                lblCollege.Text = dr["College"].ToString();

                lblDomain.Text = dr["PreferredDomain"].ToString();
                lblLearningGoal.Text = dr["LearningGoal"].ToString();

                lblBio.Text = dr["Bio"].ToString();

                if (dr["CreatedAt"] != DBNull.Value)
                {
                    lblRequestDate.Text =
                        Convert.ToDateTime(dr["CreatedAt"]).ToString("dd MMM yyyy");
                }
            }
            else
            {
                ShowMessage("Mentee not found or this request is not accepted.", "warning");
            }
        }

        // GET INITIALS
        string GetInitials(string name)
        {
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

            return initials.ToUpper();
        }

        // MESSAGE
        void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;

            lblMessage.Text = message;

            pnlMessage.CssClass = "alert alert-" + type + " mt-3";
        }
    }
}
