using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Configuration;
using System.Data;
//namespace
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
=======
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Admin
{
    public partial class mentee_details : System.Web.UI.Page
    {
<<<<<<< HEAD
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete
        string nm;

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminsEmail"] != null)
            {
                getcon();

                da = new SqlDataAdapter(
                    "Select * from Admins where email='" + Session["AdminsEmail"] + "'",
                    con);

                ds = new DataSet();
                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        FillEditMentee();
                    }
                    else
                    {
                        Response.Redirect("manage-mentees.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/Home/SignIn_up.aspx");
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void FillEditMentee()
        {
            getcon();
            da = new SqlDataAdapter("Select * from Mentee where MenteeID = '" + Request.QueryString["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                lbledu.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                lblstu.Text = ds.Tables[0].Rows[0]["Status"].ToString();
                lblem.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                lblint.Text = ds.Tables[0].Rows[0]["SkillsInterests"].ToString();
                lblAssignMentor.Text = "Not Assigned";
                lbljoind.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["RegistrationDate"]).ToString("dd-MM-yyyy");

                // Upadate 
                txtfnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtedu.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                txtint.Text = ds.Tables[0].Rows[0]["SkillsInterests"].ToString();
                if (ds.Tables[0].Rows[0]["Status"].ToString() == "Active")
                {
                    drpstu.SelectedValue = "Active";
                }
                else if (ds.Tables[0].Rows[0]["Status"].ToString() == "Pending")
                {
                    drpstu.SelectedValue = "Pending";
                }
                else if (ds.Tables[0].Rows[0]["Status"].ToString() == "Inactive")
                {
                    drpstu.SelectedValue = "Inactive";
                }

                if (ds.Tables[0].Rows[0]["ProfilePhoto"] != DBNull.Value &&
                    ds.Tables[0].Rows[0]["ProfilePhoto"].ToString() != "")
                {
                    MenteePhoto.ImageUrl =
                        ds.Tables[0].Rows[0]["ProfilePhoto"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("Update Mentee set FullName='" + txtfnm.Text + "', Education='" + txtedu.Text + "',SkillsInterests='" + txtint.Text + "',Status='" + drpstu.SelectedValue + "' where MenteeID = '" + Request.QueryString["id"] + "'", con);
            cmd.ExecuteNonQuery();
            FillEditMentee();
=======
        protected void Page_Load(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}