using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentee
{
    public partial class find_mentor : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            da = new SqlDataAdapter(
                "Select * from Admins where email='" + Session["MenteeEmail"] + "'",
                con);

            ds = new DataSet();
            da.Fill(ds);

            //nm = ds.Tables[0].Rows[0]["FullName"].ToString();

            if (!IsPostBack)
            {
                fillMentorDatalist();
                fillcategorycombo();
                fillskillcombo();
            }
            //else
            //{
            //    Response.Redirect("~/Home/SignIn_up.aspx");
            //}
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillMentorDatalist()
        {
            getcon();

            da = new SqlDataAdapter("Select * From Mentor", con);
            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        void fillskillcombo()
        {
            da = new SqlDataAdapter("select * from Skill", con);
            ds = new DataSet();
            da.Fill(ds);

            drpskl.Items.Clear();
            drpskl.Items.Add(new ListItem("-- Select Skill --", ""));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpskl.Items.Add(
                    ds.Tables[0].Rows[i]["Skill_Nm"].ToString());
            }
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from Mentor where FullName = '" + txtsearch.Text + "'", con); ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (txtsearch.Text.Trim() != "")
            {
                da = new SqlDataAdapter("select * from Mentor where FullName = '" + txtsearch.Text + "'", con);
            }
            else if (drpskl.SelectedValue != "")
            {
                da = new SqlDataAdapter("select * from Mentor where Skills like '%" + drpskl.SelectedItem + "%'", con);
            }
            else if (drpcat.SelectedValue != "")
            {
                da = new SqlDataAdapter("select * from Mentor where Expertise like '%" + drpcat.SelectedItem + "%'", con);
            }
            else
            {
                fillMentorDatalist();
            }

            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void drpskl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpskl.SelectedValue == "")
            {
                fillMentorDatalist();
            }
            else
            {
                da = new SqlDataAdapter("select * from Mentor where Skills like '%" + drpskl.SelectedItem + "%'", con);
                ds = new DataSet();
                da.Fill(ds);

                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }

        protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpcat.SelectedValue == "")
            {
                fillMentorDatalist();
            }
            else
            {
                da = new SqlDataAdapter("select * from Mentor where Expertise like '%" + drpcat.SelectedItem + "%'", con);
                ds = new DataSet();
                da.Fill(ds);

                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }

        void fillcategorycombo()
        {
            da = new SqlDataAdapter("select * from Category", con);
            ds = new DataSet();
            da.Fill(ds);

            drpcat.Items.Clear();
            drpcat.Items.Add(new ListItem("-- Select Category --", ""));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpcat.Items.Add(
                    ds.Tables[0].Rows[i]["Category_Nm"].ToString());
            }
        }
    }
}
