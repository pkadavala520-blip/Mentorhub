using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_Profile : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            da = new SqlDataAdapter(
                "Select * from Admins where email='" + Session["MenteeEmail"] + "'",
                con);

            ds = new DataSet();
            da.Fill(ds);

            if (!IsPostBack)
            {
                fillMentorData();
            }

            //else
            //{
            //    Response.Redirect("~/Home/SignIn_up.aspx");
            //}
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillMentorData()
        {
            getcon();

            da = new SqlDataAdapter("select * from Mentor where Email='" + Session["MentorEmail"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtTitle.Text = ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString();
                txtCompany.Text = ds.Tables[0].Rows[0]["Company"].ToString();
                txtExperience.Text = ds.Tables[0].Rows[0]["Experience"].ToString();
                txtExpertise.Text = ds.Tables[0].Rows[0]["Expertise"].ToString();
                txtSkills.Text = ds.Tables[0].Rows[0]["Skills"].ToString();
                txtAvailability.Text = ds.Tables[0].Rows[0]["Availability"].ToString();
                txtBio.Text = ds.Tables[0].Rows[0]["Bio"].ToString();

                lblProfileName.Text = txtFullName.Text;
                lblProfileTitle.Text = txtTitle.Text;
                lblProfileBio.Text = txtBio.Text;
                lblProfileExperience.Text = txtExperience.Text;
                lblProfileeducation.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                lblProfileSkills.Text = txtSkills.Text;
                lblProfileAvailability.Text = txtAvailability.Text;
            }

        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("Update Mentor set FullName='" + txtFullName.Text + "',ProfessionalTitle='" + txtTitle.Text + "',Company = '"+txtCompany.Text+"',Experience='" + txtExperience.Text + "',Expertise = '"+ txtExpertise.Text+ "',Skills='" + txtSkills.Text + "',Availability='" + txtAvailability.Text + "',Bio='" + txtBio.Text + "' where Email = '" + Session["MentorEmail"] + "'", con);
            cmd.ExecuteNonQuery();
            
            //Session["MentorEmail"] = txt.Text;

            lblMessage.Text = "Profile Updated Successfully!";
        }

    }
}
