using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
//namespace
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MentorHub.Admin
{
    public partial class manage_mentors : System.Web.UI.Page
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
                fillMentorGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillMentorGrid()
        {
            getcon();

            
            da = new SqlDataAdapter(" SELECT * FROM Mentor ", con);

            ds = new DataSet();
            da.Fill(ds);

            gvMentors.DataSource = ds;
            gvMentors.DataBind();

            con.Close();
        }
        protected void gvMentors_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMentors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

      
    }
}