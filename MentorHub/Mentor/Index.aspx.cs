using System;
using System.Configuration;
using System.Data;
//namespace
using System.Data.SqlClient;
using System.IO;
using System.Reflection.Emit;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_Index : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MentorEmail"] != null)
            {
                getcon();

                da = new SqlDataAdapter("SELECT * FROM Mentor WHERE Email = '" + Session["MentorEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);



                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                Label1.Text = "Welcome back, " + nm;
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
