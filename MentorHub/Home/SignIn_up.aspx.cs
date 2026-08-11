using System;
using System.Web.UI;
using System.Web.UI.WebControls;

// namespaces for database
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace MentorHub.Home
{
    public partial class SignIn_up : System.Web.UI.Page
    {
        SqlConnection con;       // connection
        SqlDataAdapter da;       // container
        DataSet ds;              // select
        SqlCommand cmd;          // insert, update, delete

        string fnm;

        string s = ConfigurationManager
            .ConnectionStrings["MentorHubConnection"]
            .ConnectionString;


        // =====================================================
        // PAGE LOAD
        // =====================================================

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillMentorGrid();
                fillMenteeGrid();
            }
        }


        // =====================================================
        // DATABASE CONNECTION
        // =====================================================

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        // =====================================================
        // MENTOR IMAGE UPLOAD
        // =====================================================

        void mentorimgupload()
        {
            if (fuMentorPhoto.HasFile)
            {
                fnm = "images/" + fuMentorPhoto.FileName;

                string folder =
                    Server.MapPath("~/images/");

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                fuMentorPhoto.SaveAs(
                    Server.MapPath("~/" + fnm)
                );
            }
            else
            {
                fnm = "";
            }
        }


        // =====================================================
        // MENTEE IMAGE UPLOAD
        // =====================================================

        void menteeimgupload()
        {
            if (fuMenteePhoto.HasFile)
            {
                fnm = "images/" + fuMenteePhoto.FileName;

                string folder =
                    Server.MapPath("~/images/");

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                fuMenteePhoto.SaveAs(
                    Server.MapPath("~/" + fnm)
                );
            }
            else
            {
                fnm = "";
            }
        }


        // =====================================================
        // FILL MENTOR GRID
        // =====================================================

        void fillMentorGrid()
        {
            getcon();

            da = new SqlDataAdapter(
                "select MentorID,FullName,Email,Phone," +
                "ProfessionalTitle,Company,Experience," +
                "Expertise,Skills,Availability,Status," +
                "RegistrationDate from Mentor",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            gvMentors.DataSource = ds;

            gvMentors.DataBind();

            con.Close();
        }


        // =====================================================
        // FILL MENTEE GRID
        // =====================================================

        void fillMenteeGrid()
        {
            getcon();

            da = new SqlDataAdapter(
                "select MenteeID,FullName,Email,Phone," +
                "Education,College,CareerGoal,LearningGoal," +
                "SkillsInterests,PreferredDomain,Status," +
                "RegistrationDate from Mentee",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            gvMentees.DataSource = ds;

            gvMentees.DataBind();

            con.Close();
        }


        // =====================================================
        // CLEAR MENTOR FORM
        // =====================================================

        void clearMentor()
        {
            txtMentorFullName.Text = "";

            txtMentorEmail.Text = "";

            txtMentorPassword.Text = "";

            txtMentorPhone.Text = "";

            txtProfessionalTitle.Text = "";

            txtCompany.Text = "";

            ddlExperience.SelectedIndex = -1;

            ddlExpertise.SelectedIndex = -1;

            txtMentorSkills.Text = "";

            ddlAvailability.SelectedIndex = -1;

            txtMentorBio.Text = "";

            chkMentorTerms.Checked = false;
        }


        // =====================================================
        // CLEAR MENTEE FORM
        // =====================================================

        void clearMentee()
        {
            txtMenteeFullName.Text = "";

            txtMenteeEmail.Text = "";

            txtMenteePassword.Text = "";

            txtMenteePhone.Text = "";

            ddlEducation.SelectedIndex = -1;

            txtCollege.Text = "";

            ddlCareerGoal.SelectedIndex = -1;

            txtLearningGoal.Text = "";

            txtSkillsInterests.Text = "";

            ddlPreferredDomain.SelectedIndex = -1;

            txtMenteeBio.Text = "";

            chkMenteeTerms.Checked = false;
        }


        // =====================================================
        // MENTOR REGISTER
        // =====================================================

        protected void btnMentorRegister_Click(
            object sender,
            EventArgs e)
        {
            if (Page.IsValid)
            {
                getcon();

                mentorimgupload();

                cmd = new SqlCommand(
                    "insert into Mentor(" +
                    "FullName,Email,PasswordHash,Phone," +
                    "ProfessionalTitle,Company,Experience," +
                    "Expertise,Skills,Availability,Bio," +
                    "ProfilePhoto,TermsAccepted) " +

                    "values('" +
                    txtMentorFullName.Text + "','" +
                    txtMentorEmail.Text + "','" +
                    txtMentorPassword.Text + "','" +
                    txtMentorPhone.Text + "','" +
                    txtProfessionalTitle.Text + "','" +
                    txtCompany.Text + "','" +
                    ddlExperience.SelectedValue + "','" +
                    ddlExpertise.SelectedValue + "','" +
                    txtMentorSkills.Text + "','" +
                    ddlAvailability.SelectedValue + "','" +
                    txtMentorBio.Text + "','" +
                    fnm + "'," +
                    (chkMentorTerms.Checked ? "1" : "0") +
                    ")",
                    con
                );

                cmd.ExecuteNonQuery();

                con.Close();

                clearMentor();

                lblMentorMessage.Text =
                    "Mentor Registration Successful!";

                lblMentorMessage.CssClass =
                    "d-block mb-3 text-success";

                RegistrationSuccess.Value = "1";

                fillMentorGrid();

                fillMenteeGrid();
            }
        }


        // =====================================================
        // MENTEE REGISTER
        // =====================================================

        protected void btnMenteeRegister_Click(
            object sender,
            EventArgs e)
        {
            if (Page.IsValid)
            {
                getcon();

                menteeimgupload();

                cmd = new SqlCommand(
                    "insert into Mentee(" +
                    "FullName,Email,PasswordHash,Phone," +
                    "Education,College,CareerGoal,LearningGoal," +
                    "SkillsInterests,PreferredDomain,Bio," +
                    "ProfilePhoto,TermsAccepted) " +

                    "values('" +
                    txtMenteeFullName.Text + "','" +
                    txtMenteeEmail.Text + "','" +
                    txtMenteePassword.Text + "','" +
                    txtMenteePhone.Text + "','" +
                    ddlEducation.SelectedValue + "','" +
                    txtCollege.Text + "','" +
                    ddlCareerGoal.SelectedValue + "','" +
                    txtLearningGoal.Text + "','" +
                    txtSkillsInterests.Text + "','" +
                    ddlPreferredDomain.SelectedValue + "','" +
                    txtMenteeBio.Text + "','" +
                    fnm + "'," +
                    (chkMenteeTerms.Checked ? "1" : "0") +
                    ")",
                    con
                );

                cmd.ExecuteNonQuery();

                con.Close();

                clearMentee();

                lblMenteeMessage.Text =
                    "Mentee Registration Successful!";

                lblMenteeMessage.CssClass =
                    "d-block mb-3 text-success";

                RegistrationSuccess.Value = "1";

                fillMentorGrid();

                fillMenteeGrid();
            }
        }


        // =====================================================
        // MENTOR TERMS
        // =====================================================

        protected void cvMentorTerms_ServerValidate(
            object source,
            ServerValidateEventArgs args)
        {
            args.IsValid =
                chkMentorTerms.Checked;
        }


        // =====================================================
        // MENTEE TERMS
        // =====================================================

        protected void cvMenteeTerms_ServerValidate(
            object source,
            ServerValidateEventArgs args)
        {
            args.IsValid =
                chkMenteeTerms.Checked;
        }


        // =====================================================
        // ADMIN LOGIN
        // =====================================================

        protected void btnAdminLogin_Click(
            object sender,
            EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "select * from Admins " +
                "where Email='" +
                txtLoginEmail.Text +
                "' and Password='" +
                txtLoginPassword.Text + "'",
                con
            );

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["AdminEmail"] =
                    txtLoginEmail.Text;

                con.Close();

                Response.Redirect(
                    "~/Admin/AdminDashboard.aspx"
                );
            }
            else
            {
                lblLoginMessage.Text =
                    "Invalid Admin Email or Password.";

                con.Close();
            }
        }


        // =====================================================
        // MENTOR LOGIN
        // =====================================================

        protected void btnMentorLogin_Click(
            object sender,
            EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "select * from Mentor " +
                "where Email='" +
                txtLoginEmail.Text +
                "' and PasswordHash='" +
                txtLoginPassword.Text + "'",
                con
            );

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["MentorID"] =
                    dr["MentorID"].ToString();

                Session["MentorName"] =
                    dr["FullName"].ToString();

                con.Close();

                Response.Redirect(
                    "~/Mentor/MentorDashboard.aspx"
                );
            }
            else
            {
                lblLoginMessage.Text =
                    "Invalid Mentor Email or Password.";

                con.Close();
            }
        }


        // =====================================================
        // MENTEE LOGIN
        // =====================================================

        protected void btnMenteeLogin_Click(
            object sender,
            EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "select * from Mentee " +
                "where Email='" +
                txtLoginEmail.Text +
                "' and PasswordHash='" +
                txtLoginPassword.Text + "'",
                con
            );

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["MenteeID"] =
                    dr["MenteeID"].ToString();

                Session["MenteeName"] =
                    dr["FullName"].ToString();

                con.Close();

                Response.Redirect(
                    "~/Mentee/MenteeDashboard.aspx"
                );
            }
            else
            {
                lblLoginMessage.Text =
                    "Invalid Mentee Email or Password.";

                con.Close();
            }
        }
    }
}