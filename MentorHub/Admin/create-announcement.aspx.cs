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
    public partial class create_announcement : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void lbtnaddpn_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("insert into Announcement (Title,Message,Audience,Created_Date) values ('"+txttle.Text+"','"+txtmsg.Text+"','"+drpaud.SelectedValue+"',Getdate())", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("announcements.aspx");
        }
    }
}