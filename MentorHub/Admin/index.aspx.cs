using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Admin
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminsEmail"] != null)
            {
                getcon();

                da = new SqlDataAdapter("SELECT * FROM Admins WHERE Email = '" + Session["AdminsEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);



                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

               
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
