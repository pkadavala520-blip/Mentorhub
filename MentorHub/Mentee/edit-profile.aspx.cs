using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
<<<<<<< HEAD
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
=======
using System.Linq;
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

<<<<<<< HEAD

=======
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
namespace MentorHub.Mentee
{
    public partial class edit_profile : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            da = new SqlDataAdapter(
                "Select * from Admins where email='" + Session["MenteeEmail"] + "'",
                con);

            ds = new DataSet();
            da.Fill(ds);

            //nm = ds.Tables[0].Rows[0]["FullName"].ToString();

            if (!IsPostBack)
            {
                fillMenteeData();
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
        void fillMenteeData()
        {
            getcon();

            da = new SqlDataAdapter("select * from Mentee where Email='" + Session["MenteeEmail"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtEducation.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                txtInterests.Text = ds.Tables[0].Rows[0]["SkillsInterests"].ToString();
                txtCareerGoals.Text = ds.Tables[0].Rows[0]["CareerGoal"].ToString();
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("Update Mentee set FullName='" + txtFullName.Text + "',Email='" + txtEmail.Text + "',Education='" + txtEducation.Text + "',SkillsInterests='" + txtInterests.Text + "',CareerGoal='" + txtCareerGoals.Text + "' where Email='" + Session["MenteeEmail"] + "'", con);

            cmd.ExecuteNonQuery();

            Session["MenteeEmail"] = txtEmail.Text;

            lblMessage.Text = "Profile Updated Successfully!";
            Response.Redirect("profile.aspx");

        }
    }
}