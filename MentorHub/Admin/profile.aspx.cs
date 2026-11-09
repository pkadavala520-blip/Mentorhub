using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
//namespace
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Admin
{
    public partial class profile : System.Web.UI.Page
    {

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
                    loadProfile();
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

            void loadProfile()
            {
                getcon();
                da = new SqlDataAdapter("select * from Admins where email='" + Session["AdminsEmail"] + "' ", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                    lblem.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    lblrl.Text = ds.Tables[0].Rows[0]["Role"].ToString();
                    lblLocation.Text = ds.Tables[0].Rows[0]["Location "].ToString();
                    lblRoleDetails.Text = ds.Tables[0].Rows[0]["Role"].ToString();
                    if (ds.Tables[0].Columns.Contains("Joined") && ds.Tables[0].Rows[0]["Joined"] != DBNull.Value)
                    {
                        lblJoined.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Joined"]).ToString("MMMM yyyy");
                    }
                    else
                    {
                        lblJoined.Text = "Not available";
                    }
                }
            }
        }
    }


}
