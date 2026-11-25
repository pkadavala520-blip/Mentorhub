
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace MentorHub.Mentor
{
    public partial class Mentor_Profile : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID;

        // PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            mentorID = Convert.ToInt32(Session["MentorID"]);

            // LOAD PROFILE
            if (!IsPostBack)
            {
                LoadMentorData();
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

        // LOAD PROFILE DATA
        void LoadMentorData()
        {
            con = new SqlConnection(conStr);

            string query = "SELECT * FROM Mentor WHERE MentorID = " + mentorID;

            da = new SqlDataAdapter(query, con);

            dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];

                string name = r["FullName"].ToString();
                string title = r["ProfessionalTitle"].ToString();
                string phone = r["Phone"].ToString();
                string company = r["Company"].ToString();
                string experience = r["Experience"].ToString();
                string expertise = r["Expertise"].ToString();
                string skills = r["Skills"].ToString();
                string availability = r["Availability"].ToString();
                string bio = r["Bio"].ToString();
                string photo = r["ProfilePhoto"].ToString();
                string email = r["Email"].ToString();

                // EDIT FORM
                txtFullName.Text = name;
                txtTitle.Text = title;
                txtPhone.Text = phone;
                txtCompany.Text = company;
                txtExperience.Text = experience;
                txtExpertise.Text = expertise;
                txtSkills.Text = skills;
                txtAvailability.Text = availability;
                txtBio.Text = bio;

                // PROFILE DETAILS
                lblProfileName.Text = name;
                lblProfileTitle.Text = title;
                lblHeroCompany.Text = company;
                lblHeroExperience.Text = experience;

                lblProfileBio.Text = bio;
                lblProfileCompany.Text = company;
                lblProfileExperience.Text = experience;
                lblProfileAvailability.Text = availability;
                lblProfileEmail.Text = email;
                lblProfilePhone.Text = phone;

                // EXPERTISE
                litExpertise.Text = BuildChips(expertise);

                // SKILLS
                litSkills.Text = BuildChips(skills);

                // INITIAL
                string initial = GetInitial(name);

                lblSidebarName.Text = name;
                lblSidebarInitial.Text = initial;
                lblTopAvatar.Text = initial;
                lblProfilePhotoFallback.Text = initial;

                // PHOTO
                ApplyPhoto(photo);

                // VISIBILITY
                bool visible = false;

                if (r["ProfileVisibility"] != DBNull.Value)
                {
                    visible = Convert.ToBoolean(r["ProfileVisibility"]);
                }

                chkProfileVisibility.Checked = visible;

                UpdateVisibilityBadge(visible);

                // PROFILE COMPLETION
                ProfileCompletion(r);
            }
            else
            {
                ShowPageMessage("Profile not found.", false);
            }
        }

        // GET INITIAL
        string GetInitial(string name)
        {
            if (name == "")
                return "M";

            return name.Substring(0, 1).ToUpper();
        }

        // APPLY PROFILE PHOTO
        void ApplyPhoto(string photo)
        {
            bool hasPhoto = photo != "";

            if (hasPhoto)
            {
                imgProfilePhoto.ImageUrl = ResolveUrl(photo);
                imgSidebarPhoto.ImageUrl = ResolveUrl(photo);
                imgTopPhoto.ImageUrl = ResolveUrl(photo);
            }

            imgProfilePhoto.Visible = hasPhoto;
            lblProfilePhotoFallback.Visible = !hasPhoto;

            imgSidebarPhoto.Visible = hasPhoto;
            lblSidebarInitial.Visible = !hasPhoto;

            imgTopPhoto.Visible = hasPhoto;
            lblTopAvatar.Visible = !hasPhoto;

            btnRemoveUi.Visible = hasPhoto;
        }

        // PROFILE VISIBILITY BADGE
        void UpdateVisibilityBadge(bool visible)
        {
            if (visible)
            {
                lblStatusBadge.Text = "Visible to mentees";
                lblStatusBadge.CssClass = "pf-badge pf-badge-on";
            }
            else
            {
                lblStatusBadge.Text = "Hidden from mentees";
                lblStatusBadge.CssClass = "pf-badge pf-badge-off";
            }
        }

        // PROFILE COMPLETION
        void ProfileCompletion(DataRow r)
        {
            string[] fields =
            {
                "FullName", "Email", "Phone", "ProfessionalTitle",
                "Company", "Experience", "Expertise", "Skills",
                "Availability", "Bio", "ProfilePhoto"
            };

            string[] names =
            {
                "Full name", "Email", "Phone", "Professional title",
                "Company", "Experience", "Expertise", "Skills",
                "Availability", "Overview", "Profile photo"
            };

            int completed = 0;
            string missing = "";

            for (int i = 0; i < fields.Length; i++)
            {
                if (r[fields[i]].ToString().Trim() != "")
                {
                    completed++;
                }
                else
                {
                    missing += "<li>" + HttpUtility.HtmlEncode(names[i]) + "</li>";
                }
            }

            int percent = (completed * 100) / fields.Length;

            pnlRing.Attributes["style"] = "--pct:" + percent;

            lblCompletion.Text = percent + "%";

            if (percent == 100)
            {
                lblCompletionTitle.Text = "All set!";
                lblCompletionHint.Text = "Your profile is complete.";
                litMissing.Text = "";
            }
            else
            {
                lblCompletionTitle.Text = "Almost there";
                lblCompletionHint.Text = "Complete these profile details:";
                litMissing.Text = "<ul class='pf-missing'>" + missing + "</ul>";
            }
        }

        // BUILD SKILL CHIPS
        string BuildChips(string value)
        {
            if (value.Trim() == "")
            {
                return "<span class='pf-empty'>Not added yet.</span>";
            }

            string[] items = value.Split(',', ';', '|');

            string result = "";

            foreach (string item in items)
            {
                if (item.Trim() != "")
                {
                    result += "<span class='pf-chip'>" +
                             HttpUtility.HtmlEncode(item.Trim()) +
                             "</span>";
                }
            }

            return result;
        }

        // SAVE PROFILE
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            Page.Validate("EditProfile");

            if (!Page.IsValid)
            {
                OpenEditModal();
                return;
            }

            string query =
                "UPDATE Mentor SET " +
                "FullName='" + txtFullName.Text.Trim().Replace("'", "''") + "'," +
                "ProfessionalTitle='" + txtTitle.Text.Trim().Replace("'", "''") + "'," +
                "Phone='" + txtPhone.Text.Trim().Replace("'", "''") + "'," +
                "Company='" + txtCompany.Text.Trim().Replace("'", "''") + "'," +
                "Experience='" + txtExperience.Text.Trim().Replace("'", "''") + "'," +
                "Expertise='" + txtExpertise.Text.Trim().Replace("'", "''") + "'," +
                "Skills='" + txtSkills.Text.Trim().Replace("'", "''") + "'," +
                "Availability='" + txtAvailability.Text.Trim().Replace("'", "''") + "'," +
                "Bio='" + txtBio.Text.Trim().Replace("'", "''") + "' " +
                "WHERE MentorID = " + mentorID;

            getcon();

            cmd = new SqlCommand(query, con);

            int result = cmd.ExecuteNonQuery();

            con.Close();

            if (result > 0)
            {
                LoadMentorData();

                ShowPageMessage("Profile updated successfully.", true);

                lblMessage.Text = "";
            }
            else
            {
                lblMessage.Text = "Profile not updated.";
            }

            OpenEditModal();
        }

        // UPLOAD PHOTO
        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            if (!fuProfilePhoto.HasFile)
            {
                ShowPageMessage("Please select a photo.", false);
                return;
            }

            string ext = Path.GetExtension(fuProfilePhoto.FileName).ToLower();

            // CHECK FILE TYPE
            if (ext != ".jpg" && ext != ".jpeg" &&
                ext != ".png" && ext != ".webp")
            {
                ShowPageMessage("Select a JPG, PNG or WEBP image.", false);
                return;
            }

            // CHECK FILE SIZE
            if (fuProfilePhoto.PostedFile.ContentLength > 2097152)
            {
                ShowPageMessage("Image must be smaller than 2 MB.", false);
                return;
            }

            try
            {
                string folder = Server.MapPath("~/ProfilePhotos/Mentor/");

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                // OLD PHOTO
                string oldPhoto = GetCurrentPhoto();

                // NEW PHOTO
                string fileName = Guid.NewGuid().ToString() + ext;

                string path = folder + fileName;

                fuProfilePhoto.SaveAs(path);

                string query =
                    "UPDATE Mentor SET ProfilePhoto='~/ProfilePhotos/Mentor/" +
                    fileName + "' WHERE MentorID = " + mentorID;

                getcon();

                cmd = new SqlCommand(query, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    DeletePhoto(oldPhoto);

                    LoadMentorData();

                    ShowPageMessage("Profile photo updated.", true);
                }
                else
                {
                    File.Delete(path);

                    ShowPageMessage("Photo could not be updated.", false);
                }
            }
            catch
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowPageMessage("Photo upload failed.", false);
            }
        }

        // GET CURRENT PHOTO
        string GetCurrentPhoto()
        {
            con = new SqlConnection(conStr);

            string query =
                "SELECT ProfilePhoto FROM Mentor WHERE MentorID = " + mentorID;

            da = new SqlDataAdapter(query, con);

            dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0]["ProfilePhoto"].ToString();
            }

            return "";
        }

        // REMOVE PHOTO
        protected void btnRemovePhoto_Click(object sender, EventArgs e)
        {
            try
            {
                string oldPhoto = GetCurrentPhoto();

                string query =
                    "UPDATE Mentor SET ProfilePhoto = NULL " +
                    "WHERE MentorID = " + mentorID;

                getcon();

                cmd = new SqlCommand(query, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    DeletePhoto(oldPhoto);

                    LoadMentorData();

                    ShowPageMessage("Profile photo removed.", true);
                }
            }
            catch
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowPageMessage("Unable to remove photo.", false);
            }
        }

        // DELETE PHOTO FILE
        void DeletePhoto(string photo)
        {
            if (photo == "")
                return;

            string path = Server.MapPath(photo);

            if (File.Exists(path))
            {
                File.Delete(path);
            }
        }

        // PROFILE VISIBILITY
        protected void chkProfileVisibility_CheckedChanged(object sender, EventArgs e)
        {
            bool visible = chkProfileVisibility.Checked;

            string value = visible ? "1" : "0";

            string query =
                "UPDATE Mentor SET ProfileVisibility = " + value +
                " WHERE MentorID = " + mentorID;

            getcon();

            cmd = new SqlCommand(query, con);

            int result = cmd.ExecuteNonQuery();

            con.Close();

            if (result > 0)
            {
                UpdateVisibilityBadge(visible);

                if (visible)
                {
                    ShowPageMessage("Profile is now visible.", true);
                }
                else
                {
                    ShowPageMessage("Profile is now hidden.", true);
                }
            }
            else
            {
                chkProfileVisibility.Checked = !visible;

                ShowPageMessage("Visibility could not be updated.", false);
            }
        }

        // SHOW MESSAGE
        void ShowPageMessage(string message, bool success)
        {
            pnlPageMessage.Visible = true;

            lblPageMessage.Text = HttpUtility.HtmlEncode(message);

            if (success)
            {
                pnlPageMessage.CssClass =
                    "alert alert-success profile-alert mb-4";
            }
            else
            {
                pnlPageMessage.CssClass =
                    "alert alert-danger profile-alert mb-4";
            }
        }

        // OPEN EDIT MODAL
        void OpenEditModal()
        {
            string script =
                "var m=document.getElementById('mpEditProfileModal');" +
                "if(m){bootstrap.Modal.getOrCreateInstance(m).show();}";

            Page.ClientScript.RegisterStartupScript(
                GetType(),
                "OpenModal",
                script,
                true
            );
        }

        // LOGOUT
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect("../Home/SignIn_up.aspx");
        }
    }
}
