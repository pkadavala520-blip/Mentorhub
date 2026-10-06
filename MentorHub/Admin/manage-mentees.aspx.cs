using MentorHub.Home;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Admin
{
    public partial class manage_mentees : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillMenteeGrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillMenteeGrid()
        {
            getcon();


            da = new SqlDataAdapter(" SELECT * FROM Mentee", con);

            ds = new DataSet();
            da.Fill(ds);

            gvMentees.DataSource = ds;
            gvMentees.DataBind();

            con.Close();
        }
        protected void gvMentees_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}