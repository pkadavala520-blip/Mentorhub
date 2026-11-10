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
    public partial class mentor_details : System.Web.UI.Page
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
                        FillEditMentor();
                    }
                    else
                    {
                        Response.Redirect("manage-mentors.aspx");
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

        void FillEditMentor()
        {
            getcon();
            da = new SqlDataAdapter("Select * from Mentor where MentorID = '" + Request.QueryString["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                lblCom.Text = ds.Tables[0].Rows[0]["Company"].ToString();
                lblDom.Text = ds.Tables[0].Rows[0]["Expertise"].ToString();
                lblstu.Text = ds.Tables[0].Rows[0]["Status"].ToString();
                lblem.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                lblSkl.Text = ds.Tables[0].Rows[0]["Skills"].ToString();
                lblExp.Text = ds.Tables[0].Rows[0]["Experience"].ToString() + " years";

                // Upadate 
                txtmfnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtmdmn.Text = ds.Tables[0].Rows[0]["Expertise"].ToString();
                txtmsk.Text = ds.Tables[0].Rows[0]["Skills"].ToString(); 
                if (ds.Tables[0].Rows[0]["Status"].ToString() == "Active")
                {
                    drpmstu.SelectedValue = "Active";
                }
                else if (ds.Tables[0].Rows[0]["Status"].ToString() == "Pending")
                {
                    drpmstu.SelectedValue = "Pending";
                }
                else if (ds.Tables[0].Rows[0]["Status"].ToString() == "Inactive")
                {
                    drpmstu.SelectedValue = "Inactive";
                }

                if (ds.Tables[0].Rows[0]["ProfilePhoto"] != DBNull.Value &&
                    ds.Tables[0].Rows[0]["ProfilePhoto"].ToString() != "")
                {
                    MentorPhoto.ImageUrl =
                        ds.Tables[0].Rows[0]["ProfilePhoto"].ToString();
                }
            }
        }

        protected void btnscng_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("Update Mentor set FullName='" + txtmfnm.Text + "', Expertise='" + txtmdmn.Text + "', Skills='" + txtmsk.Text + "', Status='" + drpmstu.SelectedValue + "' where MentorID = '" + Request.QueryString["id"] + "'", con);
            cmd.ExecuteNonQuery();

            FillEditMentor();
=======
        protected void Page_Load(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}