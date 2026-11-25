
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_Edit_Skills : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID;
        int mentorSkillID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            mentorID = Convert.ToInt32(Session["MentorID"]);

            // GET SKILL ID
            if (Request.QueryString["id"] != null)
            {
                int.TryParse(Request.QueryString["id"], out mentorSkillID);
            }

            // LOAD DATA
            if (!IsPostBack)
            {
                LoadSkillList();

                if (mentorSkillID > 0)
                {
                    LoadExistingSkill();
                }
                else
                {
                    lblPageTitle.Text = "Add New Skill";
                    btnSave.Text = "Save Skill";
                }
            }

            // LOAD NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorID,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );
        }

        // CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // LOAD ALL SKILLS
        void LoadSkillList()
        {
            getcon();

            string query = "SELECT Skill_Id, Skill_Nm FROM Skill ORDER BY Skill_Nm";

            cmd = new SqlCommand(query, con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            ddlSkill.DataSource = dt;
            ddlSkill.DataTextField = "Skill_Nm";
            ddlSkill.DataValueField = "Skill_Id";
            ddlSkill.DataBind();

            ddlSkill.Items.Insert(0, new ListItem("Select Skill", ""));

            con.Close();
        }

        // SKILL SELECTION CHANGED
        protected void ddlSkill_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSelectedCategory();
        }

        // LOAD CATEGORY
        void LoadSelectedCategory()
        {
            txtCategory.Text = "";

            if (ddlSkill.SelectedValue == "")
                return;

            int skillID = Convert.ToInt32(ddlSkill.SelectedValue);

            getcon();

            string query = "SELECT Category FROM Skill WHERE Skill_Id = " + skillID;

            cmd = new SqlCommand(query, con);

            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                txtCategory.Text = result.ToString();
            }

            con.Close();
        }

        // LOAD EXISTING SKILL
        void LoadExistingSkill()
        {
            getcon();

            string query =
                "SELECT ms.Skill_ID, ms.SkillLevel, ms.YearsExperience, " +
                "ms.Description, s.Category " +
                "FROM MentorSkills ms " +
                "INNER JOIN Skill s ON ms.Skill_ID = s.Skill_Id " +
                "WHERE ms.MentorSkillID = " + mentorSkillID +
                " AND ms.MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                ddlSkill.SelectedValue = dr["Skill_ID"].ToString();

                txtCategory.Text = dr["Category"].ToString();

                ddlSkillLevel.SelectedValue = dr["SkillLevel"].ToString();

                txtExperience.Text = dr["YearsExperience"].ToString();

                txtDescription.Text = dr["Description"].ToString();

                lblPageTitle.Text = "Edit Skill";
                btnSave.Text = "Update Skill";
            }
            else
            {
                dr.Close();
                con.Close();

                Response.Redirect("my-skills.aspx");
                return;
            }

            dr.Close();
            con.Close();
        }

        // SAVE OR UPDATE SKILL
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int skillID;
            int experience;

            // CHECK SKILL
            if (!int.TryParse(ddlSkill.SelectedValue, out skillID))
            {
                ShowMessage("Please select a skill.");
                return;
            }

            // CHECK SKILL LEVEL
            if (ddlSkillLevel.SelectedValue == "")
            {
                ShowMessage("Please select skill level.");
                return;
            }

            // CHECK EXPERIENCE
            if (!int.TryParse(txtExperience.Text, out experience) || experience < 0)
            {
                ShowMessage("Please enter valid years of experience.");
                return;
            }

            // GET DESCRIPTION
            string description = txtDescription.Text.Trim();

            if (description.Length > 500)
            {
                ShowMessage("Description cannot exceed 500 characters.");
                return;
            }

            getcon();

            // CHECK DUPLICATE SKILL
            string checkQuery =
                "SELECT COUNT(*) FROM MentorSkills " +
                "WHERE MentorID = " + mentorID +
                " AND Skill_ID = " + skillID +
                " AND MentorSkillID <> " + mentorSkillID;

            cmd = new SqlCommand(checkQuery, con);

            int duplicate = Convert.ToInt32(cmd.ExecuteScalar());

            if (duplicate > 0)
            {
                con.Close();
                ShowMessage("You have already added this skill.");
                return;
            }

            // UPDATE SKILL
            if (mentorSkillID > 0)
            {
                string updateQuery =
                    "UPDATE MentorSkills SET " +
                    "Skill_ID = " + skillID +
                    ", SkillLevel = '" + ddlSkillLevel.SelectedValue.Replace("'", "''") + "'" +
                    ", YearsExperience = " + experience +
                    ", Description = '" + description.Replace("'", "''") + "'" +
                    " WHERE MentorSkillID = " + mentorSkillID +
                    " AND MentorID = " + mentorID;

                cmd = new SqlCommand(updateQuery, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    Response.Redirect("my-skills.aspx?updated=1");
                }
                else
                {
                    ShowMessage("Unable to update skill.");
                }
            }
            else
            {
                // INSERT NEW SKILL
                string insertQuery =
                    "INSERT INTO MentorSkills " +
                    "(MentorID, Skill_ID, SkillLevel, YearsExperience, Description) " +
                    "VALUES (" + mentorID + ", " +
                    skillID + ", '" +
                    ddlSkillLevel.SelectedValue.Replace("'", "''") + "', " +
                    experience + ", '" +
                    description.Replace("'", "''") + "')";

                cmd = new SqlCommand(insertQuery, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    Response.Redirect("my-skills.aspx?added=1");
                }
                else
                {
                    ShowMessage("Unable to save skill.");
                }
            }
        }

        // BACK BUTTON
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("my-skills.aspx");
        }

        // ERROR MESSAGE
        void ShowMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message-label message-error";
        }
    }
}
