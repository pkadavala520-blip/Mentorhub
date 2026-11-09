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
    public partial class categories : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                countandFillMentors();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void countandFillMentors()
        {
            getcon();
            da = new SqlDataAdapter("Select c.Category_Id , c.Category_Nm, c.Category_Des, COUNT(m.Expertise) AS MentorCount FROM Category c LEFT JOIN Mentor m ON m.Expertise LIKE c.Category_Nm + ' - %' GROUP BY c.Category_Id, c.Category_Nm, c.Category_Des ORDER BY c.Category_Id;", con);
            ds = new DataSet();
            da.Fill(ds);
            dlCategories.DataSource = ds;
            dlCategories.DataBind(); 
        }
    }
}