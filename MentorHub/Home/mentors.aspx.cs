using System;
using System.Collections.Generic;
<<<<<<< HEAD
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
=======
using System.Linq;
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Home
{
    public partial class mentors : System.Web.UI.Page
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
            makeTab();

            if (!IsPostBack)
            {
                fillMentorDatalist();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillMentorDatalist(string categoryName="all")
        {
            getcon();

            if (categoryName == "all")
            {
                da = new SqlDataAdapter("SELECT * FROM Mentor", con);
                ds = new DataSet();
                da.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Mentor WHERE Expertise LIKE '%" + categoryName + "%'", con);
                ds = new DataSet();
                da.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }

            lblNoMentors.Visible =ds.Tables[0].Rows.Count == 0;
        }

        void makeTab()
        {
            getcon();

            da = new SqlDataAdapter("SELECT Category_Nm FROM Category", con);
            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string categoryName = ds.Tables[0].Rows[i]["Category_Nm"].ToString();

                LinkButton lnk = new LinkButton();

                lnk.ID = "lnkCategory" + i;
                lnk.Text = HttpUtility.HtmlEncode(categoryName);
                lnk.CssClass = "filter-pill";
                lnk.CommandArgument = categoryName;

                lnk.Click += Category_Click;

                mentorFilters.Controls.Add(lnk);
            }
        }

        // Gets the clicked category and displays mentors matching that category.
        protected void Category_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;

            fillMentorDatalist(lnk.CommandArgument);
        }
    }
}
=======
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
