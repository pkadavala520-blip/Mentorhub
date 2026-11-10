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
    public partial class skills : System.Web.UI.Page
    {
<<<<<<< HEAD
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

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

                if (!IsPostBack)
                {
                    fillGrid();
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

        void fillGrid()
        {
            da = new SqlDataAdapter("Select * From Skill", con);
            ds = new DataSet();
            da.Fill(ds);
            dlskl.DataSource = ds;
            dlskl.DataBind();
=======
        protected void Page_Load(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}