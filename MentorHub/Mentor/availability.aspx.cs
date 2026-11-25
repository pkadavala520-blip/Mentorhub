
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_Availability : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            int mentorId = Convert.ToInt32(Session["MentorID"]);

            // LOAD NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorId,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );

            if (!IsPostBack)
            {
                // LOAD AVAILABILITY
                LoadAvailability();

                // SUCCESS MESSAGES
                if (Request.QueryString["added"] == "1")
                {
                    lblStatus.Text = "Availability slot added successfully!";
                    lblStatus.CssClass = "availability-success mb-3";
                }
                else if (Request.QueryString["updated"] == "1")
                {
                    lblStatus.Text = "Availability slot updated successfully!";
                    lblStatus.CssClass = "availability-success mb-3";
                }
                else if (Request.QueryString["deleted"] == "1")
                {
                    lblStatus.Text = "Availability slot deleted successfully!";
                    lblStatus.CssClass = "availability-success mb-3";
                }
            }
        }

        // GET CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // LOAD AVAILABILITY
        void LoadAvailability()
        {
            int mentorId = Convert.ToInt32(Session["MentorID"]);

            getcon();

            string query = "SELECT AvailabilityID, DayName, StartTime, EndTime " +
                           "FROM MentorAvailability WHERE MentorID = " + mentorId +
                           " ORDER BY DayName, StartTime";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            rptAvailability.DataSource = dt;
            rptAvailability.DataBind();

            lblTotalSlots.Text = dt.Rows.Count.ToString();

            pnlEmpty.Visible = dt.Rows.Count == 0;
            rptAvailability.Visible = dt.Rows.Count > 0;

            con.Close();
        }

        // DELETE AVAILABILITY
        protected void rptAvailability_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteSlot")
            {
                int availabilityId = Convert.ToInt32(e.CommandArgument);
                int mentorId = Convert.ToInt32(Session["MentorID"]);

                getcon();

                string query = "DELETE FROM MentorAvailability " +
                               "WHERE AvailabilityID = " + availabilityId +
                               " AND MentorID = " + mentorId;

                cmd = new SqlCommand(query, con);

                cmd.ExecuteNonQuery();

                con.Close();

                Response.Redirect("availability.aspx?deleted=1");
            }
        }
    }
}
