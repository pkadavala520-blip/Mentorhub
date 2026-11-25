
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace MentorHub.Mentor
{
    public partial class Mentor_Settings : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        SqlDataAdapter da;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        int mentorID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN
            if (Session["MentorID"] == null)
            {
                Response.Redirect("../Home/SignIn_up.aspx");
                return;
            }

            mentorID = Convert.ToInt32(Session["MentorID"]);

            // LOAD NOTIFICATIONS
            MentorNotificationsHelper.LoadNotifications(
                mentorID,
                rptTopNotifications,
                lblNotifDot,
                pnlTopEmpty
            );

            if (!IsPostBack)
            {
                // CREATE DEFAULT SETTINGS
                CreateSettingsRecord();

                // LOAD PROFILE
                LoadMentorDetails();

                // LOAD SETTINGS
                LoadSettings();

                // LOAD SIDEBAR COUNTS
                LoadSidebarCounts();
            }
            else
            {
                ApplyDarkMode();
            }
        }

        // CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // CREATE DEFAULT SETTINGS
        void CreateSettingsRecord()
        {
            getcon();

            string query =
                "IF NOT EXISTS (SELECT * FROM MentorSettings WHERE MentorID = " + mentorID + ") " +
                "INSERT INTO MentorSettings " +
                "(MentorID, EmailNotifications, SMSNotifications, DarkMode) " +
                "VALUES (" + mentorID + ", 1, 1, 0)";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        // LOAD PROFILE DETAILS
        void LoadMentorDetails()
        {
            getcon();

            string query =
                "SELECT FullName, Email, Phone, ProfilePhoto, Availability " +
                "FROM Mentor WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtDisplayName.Text = dr["FullName"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();

                string photoPath = dr["ProfilePhoto"].ToString();

                // LOAD PHOTO
                SetProfilePhoto(photoPath);

                // LOAD NAME
                SetMentorName(txtDisplayName.Text);

                // LOAD AVAILABILITY
                string availability = dr["Availability"].ToString().Trim();

                if (availability == "")
                {
                    lblAvailabilityDays.Text = "No availability added yet";
                }
                else
                {
                    lblAvailabilityDays.Text = Server.HtmlEncode(availability);
                }

                lblAvailabilityTime.Text =
                    "View saved time slots on Availability page";
            }

            dr.Close();
            con.Close();
        }

        // SET MENTOR NAME
        void SetMentorName(string name)
        {
            if (name == "")
            {
                name = "Mentor";
            }

            lblMiniName.Text = Server.HtmlEncode(name);

            string initials = GetInitials(name);

            lblPhotoFallback.Text = initials;
            lblSidebarFallback.Text = initials;
        }

        // GET INITIALS
        string GetInitials(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
            {
                return "M";
            }

            string[] parts = name.Trim().Split(
                new char[] { ' ' },
                StringSplitOptions.RemoveEmptyEntries
            );

            if (parts.Length == 1)
            {
                return parts[0].Substring(0, 1).ToUpper();
            }

            return (
                parts[0].Substring(0, 1) +
                parts[parts.Length - 1].Substring(0, 1)
            ).ToUpper();
        }

        // LOAD PROFILE PHOTO
        void SetProfilePhoto(string photoPath)
        {
            if (photoPath != "")
            {
                imgSettingsPhoto.ImageUrl = ResolvePhotoUrl(photoPath);
                imgSidebarAvatar.ImageUrl = ResolvePhotoUrl(photoPath);

                imgSettingsPhoto.Visible = true;
                imgSidebarAvatar.Visible = true;

                lblPhotoFallback.Visible = false;
                lblSidebarFallback.Visible = false;
            }
            else
            {
                imgSettingsPhoto.Visible = false;
                imgSidebarAvatar.Visible = false;

                lblPhotoFallback.Visible = true;
                lblSidebarFallback.Visible = true;
            }
        }

        // PHOTO URL
        string ResolvePhotoUrl(string photoPath)
        {
            if (photoPath.StartsWith("~/"))
            {
                return ResolveUrl(photoPath);
            }

            if (photoPath.StartsWith("../") || photoPath.StartsWith("/"))
            {
                return photoPath;
            }

            return ResolveUrl("~/ProfilePhotos/Mentor/" + photoPath);
        }

        // LOAD SETTINGS
        void LoadSettings()
        {
            getcon();

            string query =
                "SELECT EmailNotifications, SMSNotifications, DarkMode " +
                "FROM MentorSettings WHERE MentorID = " + mentorID;

            cmd = new SqlCommand(query, con);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                chkEmailNotifications.Checked =
                    Convert.ToBoolean(dr["EmailNotifications"]);

                chkSMSNotifications.Checked =
                    Convert.ToBoolean(dr["SMSNotifications"]);

                chkDarkMode.Checked =
                    Convert.ToBoolean(dr["DarkMode"]);
            }

            dr.Close();
            con.Close();

            ApplyDarkMode();
        }

        // APPLY DARK MODE
        void ApplyDarkMode()
        {
            if (chkDarkMode.Checked)
            {
                bodyMain.Attributes["class"] = "mentor-shell mentor-dark";
            }
            else
            {
                bodyMain.Attributes["class"] = "mentor-shell";
            }
        }

        // SAVE PROFILE
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            string name = txtDisplayName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();

            if (name == "" || email == "")
            {
                ShowMessage("Please enter your name and email address.", false);
                return;
            }

            if (!email.Contains("@") || !email.Contains("."))
            {
                ShowMessage("Please enter a valid email address.", false);
                return;
            }

            try
            {
                getcon();

                string query =
                    "UPDATE Mentor SET " +
                    "FullName = '" + Safe(name) + "', " +
                    "Email = '" + Safe(email) + "', " +
                    "Phone = '" + Safe(phone) + "' " +
                    "WHERE MentorID = " + mentorID;

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();

                // UPDATE NAME
                SetMentorName(name);

                Session["MentorEmail"] = email;

                ShowMessage("Profile details saved successfully.", true);
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowMessage("Unable to save profile details.", false);
            }
        }

        // SAVE NOTIFICATION SETTINGS
        protected void btnSaveNotifications_Click(object sender, EventArgs e)
        {
            try
            {
                int emailValue = chkEmailNotifications.Checked ? 1 : 0;
                int smsValue = chkSMSNotifications.Checked ? 1 : 0;

                getcon();

                string query =
                    "UPDATE MentorSettings SET " +
                    "EmailNotifications = " + emailValue + ", " +
                    "SMSNotifications = " + smsValue +
                    " WHERE MentorID = " + mentorID;

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();

                ShowMessage("Notification settings saved successfully.", true);
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowMessage("Unable to save notification settings.", false);
            }
        }

        // SAVE APPEARANCE
        protected void btnSaveAppearance_Click(object sender, EventArgs e)
        {
            try
            {
                int darkModeValue = chkDarkMode.Checked ? 1 : 0;

                getcon();

                string query =
                    "UPDATE MentorSettings SET DarkMode = " +
                    darkModeValue +
                    " WHERE MentorID = " + mentorID;

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();

                ApplyDarkMode();

                ShowMessage("Appearance settings saved successfully.", true);
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowMessage("Unable to save appearance settings.", false);
            }
        }

        // UPLOAD PROFILE PHOTO
        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            if (!fuProfilePhoto.HasFile)
            {
                ShowMessage("Please select a profile photo first.", false);
                return;
            }

            string extension = Path.GetExtension(fuProfilePhoto.FileName).ToLower();

            // CHECK FILE TYPE
            if (extension != ".jpg" &&
                extension != ".jpeg" &&
                extension != ".png")
            {
                ShowMessage("Only JPG, JPEG and PNG images are allowed.", false);
                return;
            }

            // CHECK FILE SIZE
            if (fuProfilePhoto.PostedFile.ContentLength <= 0 ||
                fuProfilePhoto.PostedFile.ContentLength > 2 * 1024 * 1024)
            {
                ShowMessage("Please select an image smaller than 2 MB.", false);
                return;
            }

            try
            {
                string folderPath = Server.MapPath("~/ProfilePhotos/Mentor/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName =
                    "Mentor_" + mentorID + "_" +
                    Guid.NewGuid().ToString("N") + extension;

                string fullPath = Path.Combine(folderPath, fileName);

                fuProfilePhoto.SaveAs(fullPath);

                string photoPath = "../ProfilePhotos/Mentor/" + fileName;

                getcon();

                string query =
                    "UPDATE Mentor SET ProfilePhoto = '" +
                    Safe(photoPath) +
                    "' WHERE MentorID = " + mentorID;

                cmd = new SqlCommand(query, con);

                int result = cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    SetProfilePhoto(photoPath);

                    ShowMessage("Profile photo updated successfully.", true);
                }
                else
                {
                    ShowMessage("Unable to update profile photo.", false);
                }
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowMessage("Unable to upload photo. Please try again.", false);
            }
        }

        // UPDATE PASSWORD
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            if (currentPassword == "" || newPassword == "")
            {
                ShowMessage("Please enter both current and new passwords.", false);
                return;
            }

            if (newPassword.Length < 6)
            {
                ShowMessage("New password must contain at least 6 characters.", false);
                return;
            }

            try
            {
                getcon();

                // CHECK CURRENT PASSWORD
                string checkQuery =
                    "SELECT Password FROM Mentor WHERE MentorID = " + mentorID;

                cmd = new SqlCommand(checkQuery, con);

                object result = cmd.ExecuteScalar();

                string savedPassword = "";

                if (result != null)
                {
                    savedPassword = result.ToString();
                }

                if (savedPassword != currentPassword)
                {
                    con.Close();

                    ShowMessage("Your current password is incorrect.", false);
                    return;
                }

                // UPDATE PASSWORD
                string updateQuery =
                    "UPDATE Mentor SET Password = '" +
                    Safe(newPassword) +
                    "' WHERE MentorID = " + mentorID;

                cmd = new SqlCommand(updateQuery, con);
                cmd.ExecuteNonQuery();

                con.Close();

                txtCurrentPassword.Text = "";
                txtNewPassword.Text = "";

                ShowMessage("Password updated successfully.", true);
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                ShowMessage("Unable to update password.", false);
            }
        }

        // LOAD SIDEBAR COUNTS
        void LoadSidebarCounts()
        {
            try
            {
                getcon();

                // PENDING REQUESTS
                string requestQuery =
                    "SELECT COUNT(*) FROM MentorRequests " +
                    "WHERE MentorID = " + mentorID +
                    " AND Status = 'Pending'";

                cmd = new SqlCommand(requestQuery, con);

                lblSidebarRequests.Text = cmd.ExecuteScalar().ToString();

                // UNREAD MESSAGES
                string messageQuery =
                    "SELECT COUNT(*) FROM MentorMessages " +
                    "WHERE MentorID = " + mentorID +
                    " AND SenderType = 'Mentee' AND IsRead = 0";

                cmd = new SqlCommand(messageQuery, con);

                lblSidebarMessages.Text = cmd.ExecuteScalar().ToString();

                // UNREAD NOTIFICATIONS
                string notificationQuery =
                    "SELECT COUNT(*) FROM MentorNotifications " +
                    "WHERE MentorID = " + mentorID +
                    " AND IsRead = 0";

                cmd = new SqlCommand(notificationQuery, con);

                lblSidebarNotifications.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }
            catch
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                lblSidebarRequests.Text = "0";
                lblSidebarMessages.Text = "0";
                lblSidebarNotifications.Text = "0";
            }
        }

        // ESCAPE QUOTES
        string Safe(string value)
        {
            return (value ?? "").Replace("'", "''");
        }

        // SHOW MESSAGE
        void ShowMessage(string message, bool success)
        {
            pnlMessage.Visible = true;

            if (success)
            {
                pnlMessage.CssClass = "alert alert-success mb-4";
            }
            else
            {
                pnlMessage.CssClass = "alert alert-danger mb-4";
            }

            lblMessage.Text = Server.HtmlEncode(message);
        }
    }
}
