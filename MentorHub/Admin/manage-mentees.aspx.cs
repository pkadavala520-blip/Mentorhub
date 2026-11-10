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
<<<<<<< HEAD
                fillcountMenteeGrid();
=======
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
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
<<<<<<< HEAD
            da = new SqlDataAdapter(" SELECT * FROM Mentee", con);
            ds = new DataSet();
            da.Fill(ds);
            gvMentees.DataSource = ds;
            gvMentees.DataBind();
        }

        void fillcountMenteeGrid()
        {
            cmd = new SqlCommand("SELECT COUNT(MenteeID) FROM Mentee", con);
            int total = Convert.ToInt32(cmd.ExecuteScalar());
            lblTotalMentees.Text = total.ToString();
        }

        protected void gvMentees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_vw")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                Response.Redirect("mentee-details.aspx?id=" + ViewState["id"]);
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                int id = Convert.ToInt16(e.CommandArgument);
                cmd = new SqlCommand("delete from Mentee where MenteeID = '" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillMenteeGrid();
                fillcountMenteeGrid();
            }
        }

        protected void btnfilter_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from Mentee where FullName like '%" + txtsearch.Text + "%' OR SkillsInterests like '%" + txtsearch.Text + "%' OR PreferredDomain like '%" + txtsearch.Text + "%'", con);
            ds = new DataSet();
            da.Fill(ds);
            gvMentees.DataSource = ds;
            gvMentees.DataBind();
=======


            da = new SqlDataAdapter(" SELECT * FROM Mentee", con);

            ds = new DataSet();
            da.Fill(ds);

            gvMentees.DataSource = ds;
            gvMentees.DataBind();

            con.Close();
        }
        protected void gvMentees_SelectedIndexChanged(object sender, EventArgs e)
        {

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
    }
}