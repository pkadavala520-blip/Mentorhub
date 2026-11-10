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
    public partial class edit_profile : System.Web.UI.Page
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

                da = new SqlDataAdapter("Select * from Admins where email='" + Session["AdminsEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                if (!IsPostBack)
                {
                    fillAdminData();
                }
                //else
                //{
                //    Response.Redirect("~/Home/SignIn_up.aspx");
                //}
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillAdminData()
        {
            getcon();
            da = new SqlDataAdapter("select * from Admins", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtfnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtem.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtrl.Text = ds.Tables[0].Rows[0]["Role"].ToString();
                txtlcn.Text = ds.Tables[0].Rows[0]["Location "].ToString();
                txtbio.Text = ds.Tables[0].Rows[0]["Bio"].ToString();
            }
        }



        protected void btnscng_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("Update Admins set FullName='" + txtfnm.Text + "',Email='" + txtem.Text + "',Role='" + txtrl.Text + "', [Location ]='" + txtlcn.Text + "',Bio='" + txtbio.Text + "' where Email='" + Session["AdminsEmail"] + "'", con);
            cmd.ExecuteNonQuery();
            Session["AdminsEmail"] = txtem.Text;
            Response.Redirect("profile.aspx");
=======
        protected void Page_Load(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}