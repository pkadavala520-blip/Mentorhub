using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Configuration;
using System.Data;
//namespace
using System.Data.SqlClient;
using System.Drawing;
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
    public partial class add_skill : System.Web.UI.Page
    {
<<<<<<< HEAD
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

                da = new SqlDataAdapter(
                    "Select * from Admins where email='" + Session["AdminsEmail"] + "'",
                    con);

                ds = new DataSet();
                da.Fill(ds);

                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

                if (!IsPostBack)
                {
                    fillcombo();
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

        void fillcombo()
        {
            getcon();
            da = new SqlDataAdapter("Select * From Category", con);
            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpcat.Items.Add(ds.Tables[0].Rows[i]["Category_Nm"].ToString());
            }
        }

        protected void lbtnaddsk_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("Insert into Skill (Skill_Nm,Category) values ('" + txtsnm.Text + "','" + drpcat.SelectedItem.Text + "') ", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("skills.aspx");
=======
        protected void Page_Load(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}