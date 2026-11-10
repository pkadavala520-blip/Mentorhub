using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentee
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;
        protected void Page_Load(object sender, EventArgs e)
        {
<<<<<<< HEAD
=======

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
            if (Session["MenteeEmail"] != null)
            {
                getcon();

                da = new SqlDataAdapter("SELECT * FROM Mentee WHERE Email = '" + Session["MenteeEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
<<<<<<< HEAD
                nm = ds.Tables[0].Rows[0]["FullName"].ToString();
                Label1.Text = "Welcome, " + nm;
=======



                nm = ds.Tables[0].Rows[0]["FullName"].ToString();


              //  Label1.Text = "Welcome, " + nm + " 👋";
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
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
    }
}