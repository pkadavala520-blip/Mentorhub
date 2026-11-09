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

namespace MentorHub.Mentee
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
            if(Session["MenteeEmail"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from Mentee where email = '" + Session["MenteeEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                if(!IsPostBack)
                {
                    loadProfile();
                }
                else
                {
                    Response.Redirect("~/Mentee/Index.aspx");
                }
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
            da = new SqlDataAdapter("select * from Mentee", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblStudentType.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                lblnm.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                lblEdu.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                lblCrg.Text = ds.Tables[0].Rows[0]["CareerGoal"].ToString();
                lblInt.Text = ds.Tables[0].Rows[0]["PreferredDomain"].ToString();
                lblSkl.Text = ds.Tables[0].Rows[0]["SkillsInterests"].ToString();
            }
        }
    }
}