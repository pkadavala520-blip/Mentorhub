using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< HEAD
using System.Web.Script.Serialization;
=======
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a

namespace MentorHub.Admin
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con; //connnection
        SqlDataAdapter da;  // container
        DataSet ds;  //select
        SqlCommand cmd; //insert,update,edit,delete

        string s = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;
        string fnm, nm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminsEmail"] != null)
            {
                getcon();

<<<<<<< HEAD
                da = new SqlDataAdapter("Select * From Admins where Email = '" + Session["AdminsEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                nm = ds.Tables[0].Rows[0]["FullName"].ToString();
                Label1.Text = "Welcome Back, " + nm;

            }
            else
            {
                Response.Redirect("~/Home/SignIn_up.aspx");
            }

            LoadCategoryChart();
            LoadPlatformAnalytics();


            if (!IsPostBack)
            {
                FillTopDataList();
                fillcountMenteeGrid();
                fillcountMentorGrid();
            }
=======
                da = new SqlDataAdapter("SELECT * FROM Admins WHERE Email = '" + Session["AdminsEmail"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);



                nm = ds.Tables[0].Rows[0]["FullName"].ToString();

               
            }
            else
            {

                Response.Redirect("~/Home/SignIn_up.aspx");
            }
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
<<<<<<< HEAD

        void fillcountMentorGrid()
        {
            cmd = new SqlCommand("SELECT COUNT(MentorID) FROM Mentor", con);
            int total = Convert.ToInt32(cmd.ExecuteScalar());
            lblCountMentor.Text = total.ToString();
        }

        void fillcountMenteeGrid()
        {
            cmd = new SqlCommand("SELECT COUNT(MenteeID) FROM Mentee", con);
            int total = Convert.ToInt32(cmd.ExecuteScalar());
            lblcountMentee.Text = total.ToString();
        }

        void FillTopDataList()
        {
            da = new SqlDataAdapter("select Top 6* from Mentor", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }


        void LoadPlatformAnalytics()
        {
            string query = @"
        SELECT
            FORMAT(Months.MonthStart, 'MMM') AS MonthName,
            (
                SELECT COUNT(*)
                FROM Mentor
                WHERE RegistrationDate >= Months.MonthStart
                  AND RegistrationDate < DATEADD(MONTH, 1, Months.MonthStart)
            ) AS MentorCount,
            (
                SELECT COUNT(*)
                FROM Mentee
                WHERE RegistrationDate >= Months.MonthStart
                  AND RegistrationDate < DATEADD(MONTH, 1, Months.MonthStart)
            ) AS MenteeCount
        FROM
        (
            SELECT DATEADD(MONTH, -n, 
                DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
            ) AS MonthStart
            FROM (VALUES (5), (4), (3), (2), (1), (0)) AS Numbers(n)
        ) AS Months
        ORDER BY Months.MonthStart";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            string[] months = ds.Tables[0].AsEnumerable()
                .Select(row => row["MonthName"].ToString()).ToArray();

            int[] mentorCounts = ds.Tables[0].AsEnumerable()
                .Select(row => Convert.ToInt32(row["MentorCount"])).ToArray();

            int[] menteeCounts = ds.Tables[0].AsEnumerable()
                .Select(row => Convert.ToInt32(row["MenteeCount"])).ToArray();

            JavaScriptSerializer js = new JavaScriptSerializer();

            string script = "renderAnalyticsChart(" +
                js.Serialize(months) + "," +
                js.Serialize(mentorCounts) + "," +
                js.Serialize(menteeCounts) + ");";

            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "AnalyticsChart", script, true);
        }


        void LoadCategoryChart()
        {
            da = new SqlDataAdapter("Select c.Category_Id , c.Category_Nm, c.Category_Des, COUNT(m.Expertise) AS MentorCount FROM Category c LEFT JOIN Mentor m ON m.Expertise LIKE c.Category_Nm + ' - %' GROUP BY c.Category_Id, c.Category_Nm, c.Category_Des ORDER BY c.Category_Id;", con);
            ds = new DataSet();
            da.Fill(ds);

            string[] labels = ds.Tables[0].AsEnumerable()
                .Select(row => row["Category_Nm"].ToString()).ToArray();

            int[] values = ds.Tables[0].AsEnumerable()
                .Select(row => Convert.ToInt32(row["MentorCount"])).ToArray();

            JavaScriptSerializer js = new JavaScriptSerializer();

            string categoryLabels = js.Serialize(labels);
            string categoryValues = js.Serialize(values);

            string script = "renderCategoryChart(" + categoryLabels + "," +
                            categoryValues + ");";

            ClientScript.RegisterStartupScript(
                this.GetType(), "CategoryChart", script, true);
        }
=======
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
    }
}
