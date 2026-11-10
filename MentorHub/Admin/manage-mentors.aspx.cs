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
<<<<<<< HEAD
                fillcountMentorGrid();
=======
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
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
<<<<<<< HEAD
            da = new SqlDataAdapter(" SELECT * FROM Mentor ", con);
            ds = new DataSet();
            da.Fill(ds);
            gvMentors.DataSource = ds;
            gvMentors.DataBind();
        }

        void fillcountMentorGrid()
        {
            cmd = new SqlCommand("SELECT COUNT(MentorID) FROM Mentor", con);
            int total = Convert.ToInt32(cmd.ExecuteScalar());

            lblTotalMentors.Text = total.ToString();
=======

            
            da = new SqlDataAdapter(" SELECT * FROM Mentor ", con);

            ds = new DataSet();
            da.Fill(ds);

            gvMentors.DataSource = ds;
            gvMentors.DataBind();

            con.Close();
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }
        protected void gvMentors_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMentors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
<<<<<<< HEAD
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                Response.Redirect("mentor-details.aspx?id=" + ViewState["id"]);
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                int id = Convert.ToInt16(e.CommandArgument);
                cmd = new SqlCommand("delete from Mentor where MentorID = '" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillMentorGrid();
                fillcountMentorGrid();
            }
        }

        protected void btnfilter_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from Mentor where FullName like '%" + txtsmentor.Text + "%' OR ProfessionalTitle like '%" + txtsmentor.Text + "%' OR Expertise like '%" + txtsmentor.Text + "%'", con);
            ds = new DataSet();
            da.Fill(ds);
            gvMentors.DataSource = ds;
            gvMentors.DataBind();
        }
=======
           
        }

      
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
    }
}