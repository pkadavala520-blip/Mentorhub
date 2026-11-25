
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MentorHub.Mentor
{
    public partial class edit_slot : Page
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
                Response.Redirect("~/Home/SignIn_up.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadSlot();
            }
        }

        // DATABASE CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // LOAD SELECTED SLOT
        void LoadSlot()
        {
            int availabilityId;

            if (!int.TryParse(Request.QueryString["id"], out availabilityId))
            {
                lblMessage.Text = "Invalid availability slot!";
                lblMessage.CssClass = "edit-message text-danger";
                btnUpdate.Enabled = false;
                return;
            }

            int mentorId = Convert.ToInt32(Session["MentorID"]);

            getcon();

            cmd = new SqlCommand(
                "SELECT DayName, StartTime, EndTime FROM dbo.MentorAvailability " +
                "WHERE AvailabilityID = " + availabilityId +
                " AND MentorID = " + mentorId, con);

            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                ddlDayName.SelectedValue = dt.Rows[0]["DayName"].ToString();

                // SQL TIME RETURNS TIMESPAN
                txtStartTime.Text = ((TimeSpan)dt.Rows[0]["StartTime"]).ToString(@"hh\:mm");

                txtEndTime.Text = ((TimeSpan)dt.Rows[0]["EndTime"]).ToString(@"hh\:mm");
            }
            else
            {
                lblMessage.Text = "Availability slot not found!";
                lblMessage.CssClass = "edit-message text-danger";
                btnUpdate.Enabled = false;
            }

            con.Close();
        }

        // UPDATE SLOT
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int availabilityId;

            if (!int.TryParse(Request.QueryString["id"], out availabilityId))
            {
                lblMessage.Text = "Invalid availability slot!";
                lblMessage.CssClass = "edit-message text-danger";
                return;
            }

            int mentorId = Convert.ToInt32(Session["MentorID"]);

            string dayName = ddlDayName.SelectedValue;
            string startTime = txtStartTime.Text;
            string endTime = txtEndTime.Text;

            if (dayName == "" || startTime == "" || endTime == "")
            {
                lblMessage.Text = "Please fill all fields!";
                lblMessage.CssClass = "edit-message text-danger";
                return;
            }

            // CHECK START TIME AND END TIME
            TimeSpan start;
            TimeSpan end;

            if (!TimeSpan.TryParse(startTime, out start) ||
                !TimeSpan.TryParse(endTime, out end))
            {
                lblMessage.Text = "Please enter valid times!";
                lblMessage.CssClass = "edit-message text-danger";
                return;
            }

            if (start >= end)
            {
                lblMessage.Text = "End time must be later than start time!";
                lblMessage.CssClass = "edit-message text-danger";
                return;
            }

            getcon();

            cmd = new SqlCommand(
                "UPDATE dbo.MentorAvailability SET " +
                "DayName = '" + dayName + "', " +
                "StartTime = '" + startTime + "', " +
                "EndTime = '" + endTime + "' " +
                "WHERE AvailabilityID = " + availabilityId +
                " AND MentorID = " + mentorId, con);

            int result = cmd.ExecuteNonQuery();

            con.Close();

            if (result > 0)
            {
                Response.Redirect("availability.aspx?updated=1");
            }
            else
            {
                lblMessage.Text = "Unable to update availability slot!";
                lblMessage.CssClass = "edit-message text-danger";
            }
        }
    }
}
