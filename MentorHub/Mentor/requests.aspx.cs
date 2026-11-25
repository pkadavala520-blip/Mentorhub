
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_Requests : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID = 0;

        // CURRENT FILTER
        string CurrentFilter
        {
            get
            {
                if (ViewState["CurrentFilter"] == null)
                    return "All";

                return ViewState["CurrentFilter"].ToString();
            }
            set
            {
                ViewState["CurrentFilter"] = value;
            }
        }

        // CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // PAGE LOAD
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
                CurrentFilter = "All";

                txtRequestSearch.Text = "";

                LoadMentorDetails();

                LoadSidebarCounts();

                BindRequests();
            }

            SetActiveTab();
        }

        // LOAD MENTOR DETAILS
        void LoadMentorDetails()
        {
            getcon();

            string query = "SELECT FullName FROM Mentor WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            object result = cmd.ExecuteScalar();

            string name = "Mentor";

            if (result != null)
            {
                name = result.ToString();
            }

            lblSidebarName.Text = Server.HtmlEncode(name);
            lblMentorHeading.Text = Server.HtmlEncode(name);

            string initials = GetInitials(name);

            lblSidebarInitials.Text = initials;
            lblTopInitials.Text = initials;

            con.Close();
        }

        // GET INITIALS
        string GetInitials(string name)
        {
            if (name == "")
                return "MH";

            string[] words = name.Split(' ');

            string initials = "";

            foreach (string word in words)
            {
                if (word != "")
                {
                    initials += word.Substring(0, 1);
                }

                if (initials.Length == 2)
                    break;
            }

            return initials.ToUpper();
        }

        // LOAD SIDEBAR COUNTS
        void LoadSidebarCounts()
        {
            lblSidebarRequests.Text = "0";
            lblSidebarMessages.Text = "0";

            getcon();

            // PENDING REQUESTS
            string query = "SELECT COUNT(*) FROM MentorRequests " +
                           "WHERE MentorID = " + mentorID +
                           " AND Status = 'Pending'";

            cmd = new SqlCommand(query, con);

            lblSidebarRequests.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        // LOAD REQUESTS
        void BindRequests()
        {
            int mentorId = Convert.ToInt32(Session["MentorID"]);

            getcon();

            string query =
                "SELECT R.RequestID, R.MentorID, R.MenteeID, " +
                "ISNULL(M.FullName, 'Unknown Mentee') AS MenteeName, " +
                "ISNULL(M.Email, '') AS Email, " +
                "ISNULL(M.Phone, '') AS Phone, " +
                "ISNULL(M.Education, '') AS Education, " +
                "ISNULL(M.PreferredDomain, '') AS PreferredDomain, " +
                "R.Goal, R.Status, R.CreatedAt, " +
                "LEFT(ISNULL(M.FullName, 'U'), 1) + " +
                "CASE WHEN CHARINDEX(' ', ISNULL(M.FullName, '')) > 0 " +
                "THEN SUBSTRING(M.FullName, CHARINDEX(' ', M.FullName) + 1, 1) " +
                "ELSE '' END AS Initials " +
                "FROM MentorRequests R " +
                "LEFT JOIN Mentee M ON R.MenteeID = M.MenteeID " +
                "WHERE R.MentorID = " + mentorId;

            // STATUS FILTER
            if (CurrentFilter != "All")
            {
                query += " AND R.Status = '" + CurrentFilter + "'";
            }

            // SEARCH
            string search = txtRequestSearch.Text.Trim();

            if (search != "")
            {
                search = search.Replace("'", "''");

                query += " AND (M.FullName LIKE '%" + search + "%' " +
                         "OR M.Email LIKE '%" + search + "%' " +
                         "OR M.Phone LIKE '%" + search + "%' " +
                         "OR R.Goal LIKE '%" + search + "%' " +
                         "OR CAST(R.RequestID AS VARCHAR) LIKE '%" + search + "%')";
            }

            query += " ORDER BY R.CreatedAt DESC";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            // DISPLAY REQUESTS
            rptRequests.DataSource = dt;
            rptRequests.DataBind();

            rptRequests.Visible = dt.Rows.Count > 0;
            pnlNoRequests.Visible = dt.Rows.Count == 0;

            if (dt.Rows.Count == 0)
            {
                ShowMessage("No matching requests found.", "warning");
            }
            else
            {
                HideMessage();
            }

            con.Close();
        }

        // STATUS BADGE
        public string GetStatusCss(object statusValue)
        {
            string status = statusValue.ToString();

            if (status == "Pending")
                return "status-badge status-pending";

            if (status == "Accepted")
                return "status-badge status-accepted";

            if (status == "Rejected")
                return "status-badge status-rejected";

            return "status-badge";
        }

        // FILTER BUTTONS
        protected void Filter_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            CurrentFilter = btn.CommandArgument;

            BindRequests();

            SetActiveTab();
        }

        // SEARCH
        protected void txtRequestSearch_TextChanged(object sender, EventArgs e)
        {
            BindRequests();

            SetActiveTab();
        }

        // ACTIVE TAB
        void SetActiveTab()
        {
            btnAll.CssClass = "mp-tab";
            btnPending.CssClass = "mp-tab";
            btnAccepted.CssClass = "mp-tab";
            btnRejected.CssClass = "mp-tab";

            if (CurrentFilter == "All")
                btnAll.CssClass = "mp-tab active";

            else if (CurrentFilter == "Pending")
                btnPending.CssClass = "mp-tab active";

            else if (CurrentFilter == "Accepted")
                btnAccepted.CssClass = "mp-tab active";

            else if (CurrentFilter == "Rejected")
                btnRejected.CssClass = "mp-tab active";
        }

        // ACCEPT / REJECT
        protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Accept")
            {
                UpdateRequestStatus(e.CommandArgument.ToString(), "Accepted");
            }

            else if (e.CommandName == "Reject")
            {
                UpdateRequestStatus(e.CommandArgument.ToString(), "Rejected");
            }
        }

        // UPDATE STATUS
        void UpdateRequestStatus(string requestID, string status)
        {
            int id;

            if (!int.TryParse(requestID, out id))
            {
                ShowMessage("Invalid request ID.", "danger");
                return;
            }

            getcon();

            string query = "UPDATE MentorRequests SET Status = '" + status + "' " +
                           "WHERE RequestID = " + id +
                           " AND MentorID = " + mentorID +
                           " AND Status = 'Pending'";

            cmd = new SqlCommand(query, con);

            int result = cmd.ExecuteNonQuery();

            con.Close();

            if (result > 0)
            {
                if (status == "Accepted")
                {
                    ShowMessage("Request accepted successfully!", "success");
                }
                else
                {
                    ShowMessage("Request rejected successfully!", "success");
                }
            }
            else
            {
                ShowMessage("Request not found or already updated.", "warning");
            }

            LoadSidebarCounts();

            BindRequests();

            SetActiveTab();
        }

        // SHOW MESSAGE
        void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;

            lblMessage.Text = Server.HtmlEncode(message);

            pnlMessage.CssClass = "alert alert-" + type + " rounded-3 mb-3";
        }

        // HIDE MESSAGE
        void HideMessage()
        {
            pnlMessage.Visible = false;
            lblMessage.Text = "";
        }
    }
}
