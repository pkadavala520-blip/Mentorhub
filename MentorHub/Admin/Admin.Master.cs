using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
=======
using System.Linq;
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
<<<<<<< HEAD
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
=======
        protected void Page_Load(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}