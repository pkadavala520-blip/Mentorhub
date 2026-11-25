
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MentorHub.Mentor
{
    public partial class Mentor_Add_Slot : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }
            int mentorId = Convert.ToInt32(Session["MentorID"]);

            // Load the common notification bell
            MentorNotificationsHelper.LoadNotifications(
                mentorId,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );
        }

        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }
            int mentorId = Convert.ToInt32(Session["MentorID"]);

            string day = ddlDayName.SelectedValue;
            string start = txtStartTime.Text;
            string end = txtEndTime.Text;

            if (day == "" || start == "" || end == "")
            {
                lblMessage.Text = "Please fill all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.Compare(start, end) >= 0)
            {
                lblMessage.Text = "End time must be later than start time.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            getcon();

            cmd = new SqlCommand("INSERT INTO MentorAvailability (MentorID, DayName, StartTime, EndTime) VALUES ('" +mentorId + "', '" + day + "', '" + start + "', '" + end + "')", con);

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("availability.aspx?added=1");
        }


    }
}


