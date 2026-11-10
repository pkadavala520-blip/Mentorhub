<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Profile" %>
<<<<<<< HEAD

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Profile | MentorHub</title>

=======
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Profile | MentorHub</title>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=1" />
<<<<<<< HEAD
</head>

<body class="mentor-shell" data-page="profile">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="d-flex">

            <!-- Sidebar -->
            <aside class="sidebar mp-sidebar">

                <div class="mp-brand">
                    <div class="mp-brand-mark">
                        <i class="bi bi-mortarboard-fill"></i>
                    </div>

                    <div class="mp-brand-text">
                        <h4>MentorHub</h4>
                        <span>Mentor Panel</span>
                    </div>
                </div>

                <nav class="mp-nav nav flex-column">

                    <div class="mp-nav-section-label">Overview</div>

                    <a class="nav-link" href="index.aspx">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>

                    <a class="nav-link active" href="profile.aspx">
                        <i class="bi bi-person"></i>
                        <span>My Profile</span>
                    </a>

                    <a class="nav-link" href="my-skills.aspx">
                        <i class="bi bi-lightbulb"></i>
                        <span>My Skills</span>
                    </a>

                    <div class="mp-nav-section-label">Mentoring</div>

                    <a class="nav-link" href="availability.aspx">
                        <i class="bi bi-calendar2-week"></i>
                        <span>Availability</span>
                    </a>

                    <a class="nav-link" href="requests.aspx">
                        <i class="bi bi-ui-checks"></i>
                        <span>Matching Requests</span>
                        <span class="mp-nav-badge" data-badge="requests">0</span>
                    </a>

                    <a class="nav-link" href="mentees.aspx">
                        <i class="bi bi-people"></i>
                        <span>My Mentees</span>
                    </a>

                    <a class="nav-link" href="messages.aspx">
                        <i class="bi bi-chat-dots"></i>
                        <span>Messages</span>
                        <span class="mp-nav-badge" data-badge="messages">0</span>
                    </a>

                    <a class="nav-link" href="schedule.aspx">
                        <i class="bi bi-calendar2-event"></i>
                        <span>Schedule</span>
                    </a>

                    <div class="mp-nav-section-label">Insights</div>

                    <a class="nav-link" href="feedback.aspx">
                        <i class="bi bi-star"></i>
                        <span>Feedback</span>
                    </a>

                    <a class="nav-link" href="notifications.aspx">
                        <i class="bi bi-bell"></i>
                        <span>Notifications</span>
                    </a>

                    <a class="nav-link" href="settings.aspx">
                        <i class="bi bi-gear"></i>
                        <span>Settings</span>
                    </a>

                </nav>

                <div class="mp-sidebar-footer">

                    <div class="mp-mini-profile mb-2">

                        <span class="mp-avatar sm" data-mini-avatar>DR</span>

                        <div class="mp-mini-profile-text">
                            <strong data-mini-name>Daniel Ross</strong>
                            <span>
                                <span class="mp-status-dot d-inline-block me-1"></span>
                                Active now
                            </span>
                        </div>

                    </div>

                    <a class="nav-link mp-danger" href="../Home/SignIn_up.aspx">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>

                </div>

            </aside>

            <!-- Main Content -->
            <main class="flex-grow-1 content-area p-4">

                <!-- Topbar -->
                <div class="mp-topbar mb-4">

                    <div class="d-flex align-items-center gap-3">

                        <button type="button"
                            class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle
                            aria-label="Toggle navigation menu"
                            aria-expanded="false">

                            <i class="bi bi-list"></i>

                        </button>

                        <div class="mp-search d-none d-md-block">
                            <i class="bi bi-search"></i>
                            <input type="text"
                                placeholder="Search mentees, requests, sessions…" />
                        </div>

                    </div>

                    <div class="d-flex align-items-center gap-2">

                        <label class="mp-icon-btn"
                            title="Toggle dark mode"
                            style="cursor: pointer;">

                            <input type="checkbox"
                                data-dark-toggle
                                class="visually-hidden" />

                            <i class="bi bi-moon-stars"></i>

                        </label>

                        <div class="dropdown">

                            <button type="button"
                                class="mp-icon-btn"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <i class="bi bi-bell"></i>
                                <span class="mp-dot" data-notif-dot></span>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu">

                                <div class="d-flex justify-content-between align-items-center px-2 pb-2">
                                    <strong>Notifications</strong>
                                    <a href="notifications.aspx" class="small">View all</a>
                                </div>

                                <div data-notif-list></div>

                            </div>

                        </div>

                        <div class="dropdown">

                            <button type="button"
                                class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm" data-mini-avatar>DR</span>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu"
                                style="min-width: 190px;">

                                <a class="dropdown-item rounded-3" href="profile.aspx">
                                    <i class="bi bi-person me-2"></i>My Profile
                                </a>

                                <a class="dropdown-item rounded-3" href="settings.aspx">
                                    <i class="bi bi-gear me-2"></i>Settings
                                </a>

                                <hr class="my-1" />

                                <a class="dropdown-item rounded-3 text-danger"
                                    href="../Home/SignIn_up.aspx">

                                    <i class="bi bi-box-arrow-right me-2"></i>Logout

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- Page Heading -->
                <div class="d-flex justify-content-between align-items-start flex-wrap gap-3 mb-4 fade-in">

                    <div>

                        <span class="mp-page-eyebrow">
                            <i class="bi bi-person-lines-fill"></i>
                            My Profile
                        </span>

                        <h2 class="fw-bold mt-3 mb-1">Professional profile and experience summary
                        </h2>

                        <p class="text-muted mb-0">
                            Create a polished mentor identity with your background, focus areas, and availability.
                        </p>

                    </div>

                    <button type="button"
                        id="btnOpenEditProfile"
                        class="mp-btn mp-btn-primary">

                        <i class="bi bi-pencil-square"></i>
                        Edit Profile

                    </button>

                </div>

                <!-- Profile Card -->
                <div class="mp-card p-4 fade-in">

                    <div class="row g-4">

                        <!-- Profile Information -->
                        <div class="col-lg-4 text-center">

                            <div class="profile-photo-wrap mb-3"
                                data-photo-key="mentorProfilePhoto">

                                <asp:Image
                                    ID="imgProfilePhoto"
                                    runat="server"
                                    ImageUrl="data:image/svg+xml;utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'%3E%3Crect width='200' height='200' fill='%23eef0f3'/%3E%3Ccircle cx='100' cy='78' r='38' fill='%23a9b4c2'/%3E%3Cpath d='M28 192 C28 128 172 128 172 192 Z' fill='%23a9b4c2'/%3E%3C/svg%3E"
                                    CssClass="rounded-circle profile-photo profile-photo-empty"
                                    Style="width: 180px; height: 180px; object-fit: cover;"
                                    AlternateText="Mentor" />

                                <button type="button"
                                    class="photo-edit-btn"
                                    aria-label="Change profile photo"
                                    title="Change profile photo">
                                    +</button>

                            </div>

                            <h4 class="fw-bold mb-0">

                                <asp:Label
                                    ID="lblProfileName"
                                    runat="server"
                                    Text="Mentor Name" />

                            </h4>

                            <p class="text-muted">

                                <asp:Label
                                    ID="lblProfileTitle"
                                    runat="server"
                                    Text="Professional Title" />

                            </p>

                            <div class="text-warning mb-2">

                                <i class="bi bi-star-fill"></i>
                                <span data-profile-rating>4.8</span>
                                (<span data-profile-reviews>128</span> reviews)

                            </div>

                            <div class="d-flex justify-content-center gap-2 flex-wrap">

                                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm">
                                    <i class="bi bi-chat-dots"></i>
                                    Message a Mentee
                                </a>

                                <a href="settings.aspx" class="mp-btn mp-btn-outline btn-sm">
                                    <i class="bi bi-gear"></i>
                                    Account Settings
                                </a>

                            </div>

                        </div>

                        <!-- Professional Overview -->
                        <div class="col-lg-8">

                            <h5 class="fw-semibold mb-3">Professional Overview
                            </h5>

                            <p class="text-muted">

                                <asp:Label
                                    ID="lblProfileBio"
                                    runat="server"
                                    Text="Professional Overview" />

                            </p>

                            <div class="row g-3 mt-2">

                                <!-- Education -->
                                <div class="col-md-6">

                                    <div class="mp-panel p-3">

                                        <h6 class="fw-semibold">
                                            <i class="bi bi-mortarboard me-2 text-primary"></i>
                                            Education
                                        </h6>

                                        <p class="mb-0 text-muted"
                                            data-profile-education>
                                            <asp:Label
                                                ID="lblProfileeducation"
                                                runat="server"
                                                Text="Java, Python, System Design" />
                                        </p>

                                    </div>

                                </div>

                                <!-- Experience -->
                                <div class="col-md-6">

                                    <div class="mp-panel p-3">

                                        <h6 class="fw-semibold">
                                            <i class="bi bi-briefcase me-2 text-primary"></i>
                                            Experience
                                        </h6>

                                        <p class="mb-0 text-muted">

                                            <asp:Label
                                                ID="lblProfileExperience"
                                                runat="server"
                                                Text="10+ years at Microsoft &amp; Google" />

                                        </p>

                                    </div>

                                </div>

                                <!-- Top Skills -->
                                <div class="col-md-6">

                                    <div class="mp-panel p-3">

                                        <h6 class="fw-semibold">
                                            <i class="bi bi-lightbulb me-2 text-primary"></i>
                                            Top Skills
                                        </h6>

                                        <p class="mb-0 text-muted">

                                            <asp:Label
                                                ID="lblProfileSkills"
                                                runat="server"
                                                Text="Java, Python, System Design" />

                                        </p>

                                    </div>

                                </div>

                                <!-- Availability -->
                                <div class="col-md-6">

                                    <div class="mp-panel p-3">

                                        <h6 class="fw-semibold">
                                            <i class="bi bi-calendar2-week me-2 text-primary"></i>
                                            Availability
                                        </h6>

                                        <p class="mb-0 text-muted">

                                            <asp:Label
                                                ID="lblProfileAvailability"
                                                runat="server"
                                                Text="Mon-Fri, 7pm-10pm" />

                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- Edit Profile Modal -->
                <div class="modal fade"
                    id="mpEditProfileModal"
                    tabindex="-1"
                    aria-labelledby="mpEditProfileModalLabel"
                    aria-hidden="true">

                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">

                        <div class="modal-content"
                            style="border-radius: 1.1rem; border: none;">

                            <!-- Modal Header -->
                            <div class="modal-header">

                                <h5 class="modal-title fw-semibold"
                                    id="mpEditProfileModalLabel">

                                    <i class="bi bi-person-circle me-2"></i>
                                    Edit Profile

                                </h5>

                                <button type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close">
                                </button>

                            </div>

                            <!-- Modal Body -->
                            <div class="modal-body">

                                <!-- Full Name -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblFullNameTitle"
                                        runat="server"
                                        AssociatedControlID="txtFullName"
                                        CssClass="form-label"
                                        Text="Full Name" />

                                    <asp:TextBox
                                        ID="txtFullName"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="Enter your full name"
                                        MaxLength="100" />

                                    <asp:RequiredFieldValidator
                                        ID="rfvFullName"
                                        runat="server"
                                        ControlToValidate="txtFullName"
                                        ErrorMessage="Full name is required."
                                        CssClass="text-danger small"
                                        Display="Dynamic"
                                        ValidationGroup="EditProfile" />

                                </div>

                                <!-- Professional Title -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblProfessionalTitle"
                                        runat="server"
                                        AssociatedControlID="txtTitle"
                                        CssClass="form-label"
                                        Text="Professional Title" />

                                    <asp:TextBox
                                        ID="txtTitle"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="e.g. Software Engineer"
                                        MaxLength="150" />

                                </div>

                                <!-- Phone -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblPhone"
                                        runat="server"
                                        AssociatedControlID="txtPhone"
                                        CssClass="form-label"
                                        Text="Phone" />

                                    <asp:TextBox
                                        ID="txtPhone"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Phone"
                                        MaxLength="20"
                                        placeholder="Enter phone number" />

                                </div>

                                <!-- Company -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblCompany"
                                        runat="server"
                                        AssociatedControlID="txtCompany"
                                        CssClass="form-label"
                                        Text="Company" />

                                    <asp:TextBox
                                        ID="txtCompany"
                                        runat="server"
                                        CssClass="form-control"
                                        MaxLength="150"
                                        placeholder="Enter company name" />

                                </div>

                                <!-- Experience -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblExperience"
                                        runat="server"
                                        AssociatedControlID="txtExperience"
                                        CssClass="form-label"
                                        Text="Experience" />

                                    <asp:TextBox
                                        ID="txtExperience"
                                        runat="server"
                                        CssClass="form-control"
                                        MaxLength="50"
                                        placeholder="e.g. 5 years" />

                                </div>

                                <!-- Expertise -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblExpertise"
                                        runat="server"
                                        AssociatedControlID="txtExpertise"
                                        CssClass="form-label"
                                        Text="Expertise" />

                                    <asp:TextBox
                                        ID="txtExpertise"
                                        runat="server"
                                        CssClass="form-control"
                                        MaxLength="500"
                                        placeholder="e.g. Web Development, AI" />

                                </div>

                                <!-- Skills -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblSkills"
                                        runat="server"
                                        AssociatedControlID="txtSkills"
                                        CssClass="form-label"
                                        Text="Skills" />

                                    <asp:TextBox
                                        ID="txtSkills"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="MultiLine"
                                        Rows="2"
                                        MaxLength="1000"
                                        placeholder="e.g. C#, SQL, ASP.NET" />

                                </div>

                                <!-- Availability -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblAvailability"
                                        runat="server"
                                        AssociatedControlID="txtAvailability"
                                        CssClass="form-label"
                                        Text="Availability" />

                                    <asp:TextBox
                                        ID="txtAvailability"
                                        runat="server"
                                        CssClass="form-control"
                                        MaxLength="200"
                                        placeholder="e.g. Mon-Fri, 7 PM-10 PM" />

                                </div>

                                <!-- Professional Overview -->
                                <div class="mb-3">

                                    <asp:Label
                                        ID="lblBioTitle"
                                        runat="server"
                                        AssociatedControlID="txtBio"
                                        CssClass="form-label"
                                        Text="Professional Overview" />

                                    <asp:TextBox
                                        ID="txtBio"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="MultiLine"
                                        Rows="4"
                                        MaxLength="1000"
                                        placeholder="Tell us about your experience and skills" />

                                </div>

                                <!-- Message -->
                                <asp:Label
                                    ID="lblMessage"
                                    runat="server"
                                    CssClass="d-block mt-2" />

                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">

                                <button type="button"
                                    class="mp-btn mp-btn-outline"
                                    data-bs-dismiss="modal">
                                    Cancel
                                </button>

                                <asp:Button
                                    ID="btnSaveChanges"
                                    runat="server"
                                    Text="Save Changes"
                                    CssClass="mp-btn mp-btn-primary"
                                    OnClick="btnSaveChanges_Click"
                                    ValidationGroup="EditProfile" />

                            </div>

                        </div>

                    </div>

                </div>

            </main>

        </div>

        <!-- Scripts -->
        <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/mentor-app.js?v=1"></script>
        <script src="../assets/js/main.js?v=7"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {

                var editButton = document.getElementById("btnOpenEditProfile");
                var editModal = document.getElementById("mpEditProfileModal");

                if (editButton && editModal) {
                    editButton.addEventListener("click", function () {
                        var modal = bootstrap.Modal.getOrCreateInstance(editModal);
                        modal.show();
                    });
                }

            });
        </script>

    </form>

</body>
</html>
y
=======
  </head>
  <body class="mentor-shell" data-page="profile">
    <div class="d-flex">
      <aside class="sidebar mp-sidebar">
        <div class="mp-brand">
          <div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div>
          <div class="mp-brand-text"><h4>MentorHub</h4><span>Mentor Panel</span></div>
        </div>
        <nav class="mp-nav nav flex-column">
          <div class="mp-nav-section-label">Overview</div>
          <a class="nav-link" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
          <a class="nav-link active" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
          <a class="nav-link" href="my-skills.aspx"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>
          <div class="mp-nav-section-label">Mentoring</div>
          <a class="nav-link" href="availability.aspx"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>
          <a class="nav-link" href="requests.aspx"><i class="bi bi-ui-checks"></i><span>Matching Requests</span><span class="mp-nav-badge" data-badge="requests">0</span></a>
          <a class="nav-link" href="mentees.aspx"><i class="bi bi-people"></i><span>My Mentees</span></a>
          <a class="nav-link" href="messages.aspx"><i class="bi bi-chat-dots"></i><span>Messages</span><span class="mp-nav-badge" data-badge="messages">0</span></a>
          <a class="nav-link" href="schedule.aspx"><i class="bi bi-calendar2-event"></i><span>Schedule</span></a>
          <div class="mp-nav-section-label">Insights</div>
          <a class="nav-link" href="feedback.aspx"><i class="bi bi-star"></i><span>Feedback</span></a>
          <a class="nav-link" href="notifications.aspx"><i class="bi bi-bell"></i><span>Notifications</span></a>
          <a class="nav-link" href="settings.aspx"><i class="bi bi-gear"></i><span>Settings</span></a>
        </nav>
        <div class="mp-sidebar-footer">
          <div class="mp-mini-profile mb-2">
            <span class="mp-avatar sm" data-mini-avatar>DR</span>
            <div class="mp-mini-profile-text"><strong data-mini-name>Daniel Ross</strong><span><span class="mp-status-dot d-inline-block me-1"></span>Active now</span></div>
          </div>
          <a class="nav-link mp-danger" href="../Home/SignIn_up.aspx"><i class="bi bi-box-arrow-right"></i><span>Logout</span></a>
        </div>
      </aside>

      <main class="flex-grow-1 content-area p-4">
        <div class="mp-topbar mb-4">
          <div class="d-flex align-items-center gap-3">
            <button class="btn btn-outline-secondary sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button>
            <div class="mp-search d-none d-md-block">
              <i class="bi bi-search"></i>
              <input type="text" placeholder="Search mentees, requests, sessions…" />
            </div>
          </div>
          <div class="d-flex align-items-center gap-2">
            <label class="mp-icon-btn" title="Toggle dark mode" style="cursor:pointer;">
              <input type="checkbox" data-dark-toggle class="visually-hidden" />
              <i class="bi bi-moon-stars"></i>
            </label>
            <div class="dropdown">
              <button class="mp-icon-btn" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-bell"></i><span class="mp-dot" data-notif-dot></span></button>
              <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu">
                <div class="d-flex justify-content-between align-items-center px-2 pb-2"><strong>Notifications</strong><a href="notifications.aspx" class="small">View all</a></div>
                <div data-notif-list></div>
              </div>
            </div>
            <div class="dropdown">
              <button class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="mp-avatar sm" data-mini-avatar>DR</span>
              </button>
              <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu" style="min-width:190px;">
                <a class="dropdown-item rounded-3" href="profile.aspx"><i class="bi bi-person me-2"></i>My Profile</a>
                <a class="dropdown-item rounded-3" href="settings.aspx"><i class="bi bi-gear me-2"></i>Settings</a>
                <hr class="my-1" />
                <a class="dropdown-item rounded-3 text-danger" href="../Home/SignIn_up.aspx"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
              </div>
            </div>
          </div>
        </div>

        <div class="d-flex justify-content-between align-items-start flex-wrap gap-3 mb-4 fade-in">
          <div>
            <span class="mp-page-eyebrow"><i class="bi bi-person-lines-fill"></i>My Profile</span>
            <h2 class="fw-bold mt-3 mb-1">Professional profile and experience summary</h2>
            <p class="text-muted mb-0">Create a polished mentor identity with your background, focus areas, and availability.</p>
          </div>
          <button type="button" class="mp-btn mp-btn-primary" data-edit-profile-btn><i class="bi bi-pencil-square"></i>Edit Profile</button>
        </div>

        <div class="mp-card p-4 fade-in">
          <div class="row g-4">
            <div class="col-lg-4 text-center">
              <div class="profile-photo-wrap mb-3" data-photo-key="mentorProfilePhoto">
                <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'><rect width='200' height='200' fill='%23eef0f3'/><circle cx='100' cy='78' r='38' fill='%23a9b4c2'/><path d='M28 192 C28 128 172 128 172 192 Z' fill='%23a9b4c2'/></svg>" class="rounded-circle profile-photo profile-photo-empty" style="width: 180px; height: 180px; object-fit: cover;" alt="Mentor" />
                <button type="button" class="photo-edit-btn" aria-label="Change profile photo" title="Change profile photo">+</button>
              </div>
              <h4 class="fw-bold mb-0" data-profile-name>Daniel Ross</h4>
              <p class="text-muted" data-profile-title>Lead Software Engineer | 10+ Years Experience</p>
              <div class="text-warning mb-2"><i class="bi bi-star-fill"></i> <span data-profile-rating>4.8</span> (<span data-profile-reviews>128</span> reviews)</div>
              <div class="d-flex justify-content-center gap-2 flex-wrap">
                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm"><i class="bi bi-chat-dots"></i>Message a Mentee</a>
                <a href="settings.aspx" class="mp-btn mp-btn-outline btn-sm"><i class="bi bi-gear"></i>Account Settings</a>
              </div>
            </div>
            <div class="col-lg-8">
              <h5 class="fw-semibold mb-3">Professional Overview</h5>
              <p class="text-muted" data-profile-bio>I help students and professionals improve their software engineering skills through hands-on mentorship, interview prep, and career strategy.</p>
              <div class="row g-3 mt-2">
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-mortarboard me-2 text-primary"></i>Education</h6>
                    <p class="mb-0 text-muted" data-profile-education>M.Tech in Computer Science</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-briefcase me-2 text-primary"></i>Experience</h6>
                    <p class="mb-0 text-muted" data-profile-experience>10+ years at Microsoft & Google</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-lightbulb me-2 text-primary"></i>Top Skills</h6>
                    <p class="mb-0 text-muted" data-profile-skills>Java, Python, System Design</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-calendar2-week me-2 text-primary"></i>Availability</h6>
                    <p class="mb-0 text-muted" data-profile-availability>Mon-Fri, 7pm-10pm</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Edit Profile Modal -->
        <div class="modal fade" id="mpEditProfileModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius:1.1rem; border:none;">
              <form>
                <div class="modal-header">
                  <h5 class="modal-title fw-semibold">Edit Profile</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="mb-3"><label class="form-label">Full Name</label><input class="form-control" name="name" /></div>
                  <div class="mb-3"><label class="form-label">Title</label><input class="form-control" name="title" /></div>
                  <div class="mb-0"><label class="form-label">Professional Overview</label><textarea class="form-control" name="bio" rows="4"></textarea></div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="mp-btn mp-btn-outline" data-bs-dismiss="modal">Cancel</button>
                  <button type="submit" class="mp-btn mp-btn-primary"><i class="bi bi-check2-circle"></i>Save Changes</button>
                </div>
              </form>
            </div>
          </div>
        </div>

      </main>
    </div>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/mentor-app.js?v=1"></script>
  </body>
</html>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
