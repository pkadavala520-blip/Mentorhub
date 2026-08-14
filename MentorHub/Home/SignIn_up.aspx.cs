using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


//namespace
using System.Data.SqlClient;
using System.Data;
using System.IO;


namespace MentorHub.Home
{
    public partial class SignIn_up : System.Web.UI.Page
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
                fillMenteeGrid();
            }
        }

        //DATA CONNECTION
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        //MENTOR GRID
        void fillMentorGrid()
        {
            getcon();

            da = new SqlDataAdapter("Select *from Mentor",con);
            ds = new DataSet();
            da.Fill(ds);

            gvMentors.DataSource = ds;
            gvMentors.DataBind();

            con.Close();
            
        }

        //MENTEE GRID
        void fillMenteeGrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from Mentee",con);
            ds=new DataSet();
            da.Fill(ds);

            gvMentees.DataSource = ds;
            gvMentees.DataBind();

            con.Close();
        }
        ///Image upload
        void mentorimgupload()
        {
            fnm = "~/ProfilePhotos/Mentor/" + flpMentorProfilePhoto.FileName;
            flpMentorProfilePhoto.SaveAs(Server.MapPath(fnm));
        }

        void menteeimgupload()
        {
            fnm = "~/ProfilePhotos/Mentee/" + flpMenteeProfilePhoto.FileName;
            flpMenteeProfilePhoto.SaveAs(Server.MapPath(fnm));
        }

        //CLEAR MENTOR
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

        //CLEAR METEE
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
        // Mentor Registration

        protected void btnMentorRegister_Click(object sender, EventArgs e)
        {
            

            if(btnMentorRegister.Text== "Create Mentor Account")
            {
                getcon();
                mentorimgupload();
                

                cmd=new SqlCommand("insert into Mentor(FullName,Email,Password,Phone,ProfessionalTitle,Company,Experience,Expertise,Skills,Availability,Bio,ProfilePhoto,TermsAccepted)" +
                    " values ('"+ txtMentorFullName.Text+ "','"+ txtMentorEmail.Text+ "','"+ txtMentorPassword.Text+ "','"+ txtMentorPhone.Text+ "','"+ txtProfessionalTitle.Text+ "','"+ txtCompany .Text+ "','"+ ddlExperience.SelectedValue+ "','"+ ddlExpertise.Text + "','"+ txtMentorSkills.Text+ "','"+ ddlAvailability.SelectedValue+ "','"+ txtMentorBio .Text+ "','" + fnm + "','" + (chkMentorTerms.Checked ? "1" : "0")+"')", con);
                cmd.ExecuteNonQuery();

                clearMentor();
                con.Close();
                fillMentorGrid();
            }
            else
            {
                //update
                getcon();
                cmd = new SqlCommand("update Mentor set FullName='" + txtMentorFullName.Text+ "',Email='" + txtMentorEmail.Text + "',Password='" + txtMentorPassword.Text + "',Phone='" + txtMentorPhone.Text + "',ProfessionalTitle='" + txtProfessionalTitle.Text + "',Company='" + txtCompany.Text +
                    "',Experience='" + ddlExperience.SelectedValue +
                    "',Expertise='" + ddlExpertise.Text +
                    "',Skills='" + txtMentorSkills.Text +
                    "',Availability='" + ddlAvailability.SelectedValue +
                    "',Bio='" + txtMentorBio.Text +
                    "',TermsAccepted='" + (chkMentorTerms.Checked ? "1" : "0") +
                    "' where MentorID='" + ViewState["MentorID"] + "'", con);

                cmd.ExecuteNonQuery();
                clearMentor();
                btnMentorRegister.Text = "Create Mentor Account";
                con.Close();
                fillMentorGrid();
            }
        }
        // Mentee Registration

        protected void btnMenteeRegister_Click(object sender, EventArgs e)
        {
            if (btnMenteeRegister.Text == "Create Mentee Account")
            {
                getcon();
                menteeimgupload();

                cmd = new SqlCommand("insert into Mentee(FullName,Email,Password,Phone,Education,College,CareerGoal,LearningGoal,SkillsInterests,PreferredDomain,Bio,ProfilePhoto,TermsAccepted) " +
                    "values('"+ txtMenteeFullName.Text+ "','"+ txtMenteeEmail.Text+"','"+ txtMenteePassword.Text+ "','"+ txtMenteePhone.Text+ "','"+ ddlEducation.SelectedValue + "','"+ txtCollege .Text + "','"+ ddlCareerGoal.SelectedValue+ "','"+ txtLearningGoal.Text + "','"+ txtSkillsInterests.Text+ "','"+ ddlPreferredDomain.SelectedValue+ "','"+ txtMenteeBio.Text+ "','" + fnm + "','" + (chkMenteeTerms.Checked ? "1":"0")+"')", con);

                cmd.ExecuteNonQuery();
                clearMentee();
                con.Close();
                fillMenteeGrid();
            }
            else
            {
                //Update

                getcon();
                cmd = new SqlCommand("Update Mentee set FullName='" + txtMenteeFullName.Text +"',Email='" + txtMenteeEmail.Text +"',Password='" + txtMenteePassword.Text +"',Phone='" + txtMenteePhone.Text +"',Education='" + ddlEducation.SelectedValue +"',College='" + txtCollege.Text +"',CareerGoal='" + ddlCareerGoal.SelectedValue +"',LearningGoal='" + txtLearningGoal.Text +"',SkillsInterests='" + txtSkillsInterests.Text + "',PreferredDomain='" + ddlPreferredDomain.SelectedValue +"',Bio='" + txtMenteeBio.Text +"',TermsAccepted='" + (chkMenteeTerms.Checked ? "1" : "0") +  "' where MenteeID='" + ViewState["MenteeID"] + "'", con);
                cmd.ExecuteNonQuery();
                clearMentee();
                btnMenteeRegister.Text = "Update Mentee Account";
                con.Close();
                fillMenteeGrid();
            }
            
        }
        //Mentor edit data
        
        void fillMentorData()
        {
            getcon();
            da = new SqlDataAdapter("select * from Mentor where MentorID='" + ViewState["MentorID"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            //paring
           
                txtMentorFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtMentorEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtMentorPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                txtMentorPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                txtProfessionalTitle.Text = ds.Tables[0].Rows[0]["ProfessionalTitle"].ToString();
                txtCompany.Text = ds.Tables[0].Rows[0]["Company"].ToString();
                ddlExperience.SelectedValue = ds.Tables[0].Rows[0]["Experience"].ToString();
                ddlExpertise.SelectedValue = ds.Tables[0].Rows[0]["Expertise"].ToString();
                txtMentorSkills.Text = ds.Tables[0].Rows[0]["Skills"].ToString();
                ddlAvailability.SelectedValue = ds.Tables[0].Rows[0]["Availability"].ToString();
                txtMentorBio.Text = ds.Tables[0].Rows[0]["Bio"].ToString();
                
           
            con.Close();

        }

        //Mentee edit data

        void fillMenteeData()
        {
            getcon();
            da = new SqlDataAdapter("select * from Mentee where MenteeID='" + ViewState["MenteeID"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            //paring
           
                txtMenteeFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtMenteeEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtMenteePassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                txtMenteePhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                ddlEducation.SelectedValue = ds.Tables[0].Rows[0]["Education"].ToString();
                txtCollege.Text = ds.Tables[0].Rows[0]["College"].ToString();
                ddlCareerGoal.SelectedValue = ds.Tables[0].Rows[0]["CareerGoal"].ToString();
                txtLearningGoal.Text = ds.Tables[0].Rows[0]["LearningGoal"].ToString();
                txtSkillsInterests.Text = ds.Tables[0].Rows[0]["SkillsInterests"].ToString();
                ddlPreferredDomain.SelectedValue = ds.Tables[0].Rows[0]["PreferredDomain"].ToString();
                txtMenteeBio.Text = ds.Tables[0].Rows[0]["Bio"].ToString();
           
            con.Close();

        }
        // Mentor edit and delete
        protected void gvMentors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditMentor")
            {
                int id=Convert.ToInt32(e.CommandArgument);
                ViewState["MentorID"] = id;
                btnMentorRegister.Text = "Update Mentor Account";
                fillMentorData();
            }
            else if (e.CommandName == "DeleteMentor")
            {
                getcon();
                cmd = new SqlCommand("delete from Mentor where MentorID='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                fillMentorGrid();
            }
        }

        //Mentee

        protected void gvMentees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditMentee")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                ViewState["MenteeID"] = id;

                btnMenteeRegister.Text = "Update Mentee Account";

                fillMenteeData();
            }
            else if (e.CommandName == "DeleteMentee")
            {
                getcon();

                cmd = new SqlCommand("delete from Mentee where MenteeID='" + e.CommandArgument + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillMenteeGrid();
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
        }

        protected void btnMentorLogin_Click(object sender, EventArgs e)
        {
        }

        protected void btnMenteeLogin_Click(object sender, EventArgs e)
        {
        }
    }
}