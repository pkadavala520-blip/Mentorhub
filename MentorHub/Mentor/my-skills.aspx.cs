
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public partial class Mentor_My_Skills : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN SESSION
            if (Session["MentorID"] == null ||
                !int.TryParse(Session["MentorID"].ToString(), out mentorID))
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadSkills();
                LoadStatistics();

                // SUCCESS MESSAGES
                if (Request.QueryString["added"] == "1")
                {
                    lblMessage.Text = "Skill added successfully!";
                    lblMessage.CssClass = "skills-message success";
                }
                else if (Request.QueryString["updated"] == "1")
                {
                    lblMessage.Text = "Skill updated successfully!";
                    lblMessage.CssClass = "skills-message success";
                }
                else if (Request.QueryString["deleted"] == "1")
                {
                    lblMessage.Text = "Skill deleted successfully!";
                    lblMessage.CssClass = "skills-message success";
                }
            }
            int mentorId = Convert.ToInt32(Session["MentorID"]);

            MentorNotificationsHelper.LoadNotifications(
                mentorId,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );
        }

        // CONNECTION METHOD
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // LOAD SKILLS
        void LoadSkills()
        {
            getcon();

            cmd = new SqlCommand(
                "SELECT ms.MentorSkillID, s.Skill_Nm, " +
                "s.Category AS Categories, ms.SkillLevel, " +
                "ms.YearsExperience, ms.Description " +
                "FROM MentorSkills ms " +
                "INNER JOIN Skill s ON ms.Skill_ID = s.Skill_Id " +
                "WHERE ms.MentorID = " + mentorID +
                " ORDER BY ms.MentorSkillID DESC", con);

            dt = new DataTable();

            da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            rptSkills.DataSource = dt;
            rptSkills.DataBind();

            // EMPTY STATE
            pnlNoSkills.Visible = dt.Rows.Count == 0;
            rptSkills.Visible = dt.Rows.Count > 0;

            con.Close();
        }

        // LOAD SKILL STATISTICS
        void LoadStatistics()
        {
            getcon();

            // TOTAL SKILLS
            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM MentorSkills " +
                "WHERE MentorID = " + mentorID, con);

            int total = Convert.ToInt32(cmd.ExecuteScalar());

            lblTotalSkills.Text = total.ToString();


            // TOTAL CATEGORIES
            cmd = new SqlCommand(
                "SELECT COUNT(DISTINCT s.Category) " +
                "FROM MentorSkills ms " +
                "INNER JOIN Skill s ON ms.Skill_ID = s.Skill_Id " +
                "WHERE ms.MentorID = " + mentorID, con);

            int categories = Convert.ToInt32(cmd.ExecuteScalar());

            lblTotalCategories.Text = categories.ToString();


            // EXPERT SKILLS
            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM MentorSkills " +
                "WHERE MentorID = " + mentorID +
                " AND SkillLevel = 'Expert'", con);

            int expert = Convert.ToInt32(cmd.ExecuteScalar());

            lblExpertSkills.Text = expert.ToString();

            con.Close();
        }

        // EDIT AND DELETE SKILLS
        protected void rptSkills_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int skillID;

            if (!int.TryParse(e.CommandArgument.ToString(), out skillID))
            {
                return;
            }

            // EDIT SKILL
            if (e.CommandName == "EditSkill")
            {
                Response.Redirect("edit-skills.aspx?id=" + skillID);
                return;
            }

            // DELETE SKILL
            if (e.CommandName == "DeleteSkill")
            {
                getcon();

                cmd = new SqlCommand(
                    "DELETE FROM MentorSkills " +
                    "WHERE MentorSkillID = " + skillID +
                    " AND MentorID = " + mentorID, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    Response.Redirect("my-skills.aspx?deleted=1");
                }
                else
                {
                    lblMessage.Text = "Unable to delete this skill.";
                    lblMessage.CssClass = "skills-message error";
                }

                LoadSkills();
                LoadStatistics();
            }
        }
    }
}
