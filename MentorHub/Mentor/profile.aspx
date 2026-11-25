<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Profile | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link rel="stylesheet" href="../assets/css/profile.css?v=7" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />

    <style>
        /* Keep only the main hero profile photo visible on this page. */
        body[data-page="profile"] .mp-mini-photo,
        body[data-page="profile"] .top-profile-photo {
            display: none !important;
        }

        /* Remove any extra outer photo ring or circular decoration. */
        body[data-page="profile"] .pf-avatar-wrap {
            width: 132px !important;
            height: 132px !important;
            padding: 0 !important;
            margin: 0 0 18px 0 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            border: 0 !important;
            outline: 0 !important;
            border-radius: 0 !important;
            background: transparent !important;
            box-shadow: none !important;
        }

        /* One single circular photo container. */
        body[data-page="profile"] .pf-avatar {
            width: 124px !important;
            height: 124px !important;
            min-width: 124px !important;
            min-height: 124px !important;
            padding: 0 !important;
            overflow: hidden !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            border-radius: 50% !important;
            border: 3px solid #ffffff !important;
            outline: 0 !important;
            background: #eee9ff !important;
            box-shadow: 0 5px 18px rgba(65, 45, 120, .16) !important;
        }

        body[data-page="profile"] .pf-avatar img,
        body[data-page="profile"] .pf-avatar .profile-photo {
            display: block !important;
            width: 100% !important;
            height: 100% !important;
            max-width: 100% !important;
            max-height: 100% !important;
            object-fit: cover !important;
            border: 0 !important;
            outline: 0 !important;
            border-radius: 50% !important;
            box-shadow: none !important;
        }

        body[data-page="profile"] .pf-avatar-fallback {
            width: 100% !important;
            height: 100% !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            border: 0 !important;
            border-radius: 50% !important;
            background: #eee9ff !important;
            color: #6841df !important;
            font-size: 36px !important;
            font-weight: 700 !important;
        }

        @media (max-width: 767px) {
            body[data-page="profile"] .pf-avatar-wrap {
                width: 112px !important;
                height: 112px !important;
            }

            body[data-page="profile"] .pf-avatar {
                width: 108px !important;
                height: 108px !important;
                min-width: 108px !important;
                min-height: 108px !important;
            }
        }
    </style>
</head>

<body class="mentor-shell" data-page="profile">
    <form id="form1" runat="server" enctype="multipart/form-data">

        <div class="d-flex">

            <!-- SIDEBAR -->
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

                <nav class="mp-nav nav flex-column" aria-label="Mentor navigation">

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
                    </a>

                    <a class="nav-link" href="mentees.aspx">
                        <i class="bi bi-people"></i>
                        <span>My Mentees</span>
                    </a>

                    <a class="nav-link" href="messages.aspx">
                        <i class="bi bi-chat-dots"></i>
                        <span>Messages</span>
                    </a>

                    <a class="nav-link" href="schedule.aspx">
                        <i class="bi bi-calendar2-event"></i>
                        <span>Schedule</span>
                    </a>

                    <div class="mp-nav-section-label">Insights</div>

                    <a class="nav-link" href="feedback.aspx">
                        <i class="bi bi-star"></i>
                        <span>Feedback &amp; Reviews</span>
                    </a>

                    <a class="nav-link" href="notifications.aspx">
                        <i class="bi bi-bell"></i>
                        <span>Notifications</span>
                    </a>

                    <div class="mp-nav-section-label">Account</div>

                    <a class="nav-link" href="settings.aspx">
                        <i class="bi bi-gear"></i>
                        <span>Settings</span>
                    </a>

                </nav>

                <!-- SIDEBAR PROFILE -->
                <div class="mp-sidebar-footer">

                    <div class="mp-mini-profile mb-2">

                        <div class="mp-mini-photo">
                            <asp:Image ID="imgSidebarPhoto" runat="server"
                                AlternateText="Mentor photo" Visible="false" />

                            <asp:Label ID="lblSidebarInitial" runat="server"
                                CssClass="mp-avatar sm" Text="M" />
                        </div>

                        <div class="mp-mini-profile-text">
                            <strong>
                                <asp:Label ID="lblSidebarName" runat="server" Text="Mentor" />
                            </strong>

                            <span>
                                <span class="mp-status-dot d-inline-block me-1"></span>
                                Active now
                            </span>
                        </div>

                    </div>

                    <asp:LinkButton ID="btnLogout" runat="server"
                        CssClass="nav-link mp-danger"
                        OnClick="btnLogout_Click"
                        CausesValidation="false">

                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>

                    </asp:LinkButton>

                </div>

            </aside>

            <!-- MAIN CONTENT -->
            <main class="flex-grow-1 content-area p-4">

                <!-- TOPBAR -->
                <div class="mp-topbar mb-4">

                    <div class="d-flex align-items-center gap-3">

                        <button type="button"
                            class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle>

                            <i class="bi bi-list"></i>

                        </button>

                        <div>
                            <span class="pf-eyebrow">MENTOR ACCOUNT</span>
                            <h5 class="mb-0 fw-bold">My Profile</h5>
                        </div>

                    </div>

                    <div class="d-flex align-items-center gap-2">

                        <!-- DARK MODE TOGGLE ADDED -->
                        <label class="mp-icon-btn"
                            title="Toggle dark mode"
                            style="cursor: pointer;">

                            <input type="checkbox"
                                data-dark-toggle
                                class="visually-hidden" />

                            <i class="bi bi-moon-stars"></i>

                        </label>


                        <!-- SINGLE DYNAMIC NOTIFICATION BELL -->
                        <div class="dropdown">

                            <button class="mp-icon-btn"
                                id="notificationBell"
                                type="button"
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="true"
                                aria-expanded="false"
                                aria-label="Open notifications">

                                <i class="bi bi-bell"></i>

                                <asp:Label ID="lblNotifDot"
                                    runat="server"
                                    CssClass="mp-dot"
                                    Text=" "
                                    Visible="false">
                                </asp:Label>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-notification-dropdown"
                                aria-labelledby="notificationBell">

                                <div class="d-flex">

                                    <span class="notification-heading">
                                        <i class="bi bi-bell"></i>
                                        Notifications
                                    </span>

                                    <a href="notifications.aspx"
                                        class="notification-view-all">
                                        View all
                                    </a>

                                </div>

                                <asp:Repeater ID="rptTopNotifications" runat="server">

                                    <ItemTemplate>

                                        <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "mp-notif-item" : "mp-notif-item unread" %>'
                                            data-type='<%# Eval("NotificationType") %>'>

                                            <a href="notifications.aspx">

                                                <div class="mp-notif-body">

                                                    <div class="mp-notif-title">
                                                        <%#: Eval("Title") %>
                                                    </div>

                                                    <div class="mp-notif-text">
                                                        <%#: Eval("Message") %>
                                                    </div>

                                                    <div class="mp-notif-time">
                                                        <%# Eval("CreatedAt", "{0:dd MMM yyyy, hh:mm tt}") %>
                                                    </div>

                                                </div>

                                            </a>

                                        </div>

                                    </ItemTemplate>

                                </asp:Repeater>

                                <asp:Panel ID="pnlTopEmpty"
                                    runat="server"
                                    Visible="false"
                                    CssClass="notification-empty">

                                    <i class="bi bi-bell-slash"></i>
                                    <p>No notifications yet.</p>

                                </asp:Panel>

                            </div>

                        </div>


                        <!-- TOP PROFILE PHOTO -->
                        <div class="top-profile-photo">

                            <asp:Image ID="imgTopPhoto" runat="server"
                                AlternateText="Mentor photo" Visible="false" />

                            <asp:Label ID="lblTopAvatar" runat="server"
                                CssClass="mp-avatar sm" Text="M" />

                        </div>

                    </div>

                </div>


                <!-- PAGE MESSAGE -->
                <asp:Panel ID="pnlPageMessage" runat="server"
                    Visible="false" CssClass="alert profile-alert mb-4">

                    <asp:Label ID="lblPageMessage" runat="server" />

                </asp:Panel>


                <!-- PHOTO UPLOAD CONTROLS -->
                <asp:FileUpload ID="fuProfilePhoto" runat="server"
                    CssClass="d-none" />

                <asp:Button ID="btnUploadPhoto" runat="server"
                    Text="Upload Photo"
                    CssClass="d-none"
                    OnClick="btnUploadPhoto_Click"
                    CausesValidation="false"
                    UseSubmitBehavior="false" />

                <asp:Button ID="btnRemovePhoto" runat="server"
                    Text="Remove Photo"
                    CssClass="d-none"
                    OnClick="btnRemovePhoto_Click"
                    CausesValidation="false"
                    UseSubmitBehavior="false" />


                <!-- PROFILE HERO -->
                <section class="pf-hero">

                    <div class="pf-cover"></div>

                    <div class="pf-hero-body">

                        <!-- ONLY ONE VISIBLE ROUND PROFILE PHOTO -->
                        <div class="pf-avatar-wrap">

                            <div class="pf-avatar">

                                <asp:Image ID="imgProfilePhoto" runat="server"
                                    CssClass="profile-photo"
                                    AlternateText="Mentor profile photo"
                                    Visible="false" />

                                <asp:Label ID="lblProfilePhotoFallback" runat="server"
                                    Text="M"
                                    CssClass="pf-avatar-fallback" />

                            </div>

                        </div>

                        <div class="pf-hero-info">

                            <h2 class="pf-name">
                                <asp:Label ID="lblProfileName" runat="server"
                                    Text="Mentor Name" />
                            </h2>

                            <p class="pf-title">
                                <asp:Label ID="lblProfileTitle" runat="server"
                                    Text="Professional Title" />
                            </p>

                            <div class="pf-meta">

                                <span class="pf-meta-item">
                                    <i class="bi bi-building"></i>

                                    <asp:Label ID="lblHeroCompany" runat="server"
                                        Text="Not added" />
                                </span>

                                <span class="pf-meta-item">
                                    <i class="bi bi-briefcase"></i>

                                    <asp:Label ID="lblHeroExperience" runat="server"
                                        Text="Not added" />
                                </span>

                                <asp:Label ID="lblStatusBadge" runat="server"
                                    CssClass="pf-badge pf-badge-on"
                                    Text="Visible to mentees" />

                            </div>

                        </div>

                        <div class="pf-hero-actions">

                            <button type="button"
                                id="btnOpenEditProfile"
                                class="pf-btn pf-btn-primary">

                                <i class="bi bi-pencil-square"></i>
                                Edit Profile

                            </button>

                            <button type="button"
                                class="pf-btn pf-btn-soft"
                                onclick="openPhotoPicker();">

                                <i class="bi bi-image"></i>
                                Change Photo

                            </button>

                            <button type="button"
                                id="btnRemoveUi"
                                runat="server"
                                class="pf-btn pf-btn-ghost"
                                onclick="removeProfilePhoto();">

                                <i class="bi bi-trash"></i>
                                Remove

                            </button>

                        </div>

                    </div>

                </section>


                <!-- PROFILE CONTENT -->
                <div class="row g-4">

                    <!-- MAIN COLUMN -->
                    <div class="col-xl-8">

                        <!-- ABOUT ME -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-person-lines-fill"></i>
                                </span>

                                <div>
                                    <h5>About Me</h5>
                                    <small>Your professional overview</small>
                                </div>

                            </div>

                            <p class="pf-bio">

                                <asp:Label ID="lblProfileBio" runat="server"
                                    Text="Add your professional overview." />

                            </p>

                        </div>


                        <!-- PROFESSIONAL DETAILS -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-grid"></i>
                                </span>

                                <div>
                                    <h5>Professional Details</h5>
                                    <small>Where you work and when you mentor</small>
                                </div>

                            </div>

                            <div class="row g-3">

                                <div class="col-md-6">

                                    <div class="pf-detail">

                                        <span class="pf-ico">
                                            <i class="bi bi-building"></i>
                                        </span>

                                        <div>
                                            <span class="lbl">Company</span>

                                            <strong>
                                                <asp:Label ID="lblProfileCompany"
                                                    runat="server" Text="Not added" />
                                            </strong>
                                        </div>

                                    </div>

                                </div>


                                <div class="col-md-6">

                                    <div class="pf-detail">

                                        <span class="pf-ico">
                                            <i class="bi bi-briefcase"></i>
                                        </span>

                                        <div>
                                            <span class="lbl">Experience</span>

                                            <strong>
                                                <asp:Label ID="lblProfileExperience"
                                                    runat="server" Text="Not added" />
                                            </strong>
                                        </div>

                                    </div>

                                </div>


                                <div class="col-12">

                                    <div class="pf-detail">

                                        <span class="pf-ico">
                                            <i class="bi bi-calendar-check"></i>
                                        </span>

                                        <div>
                                            <span class="lbl">Availability</span>

                                            <strong>
                                                <asp:Label ID="lblProfileAvailability"
                                                    runat="server" Text="Not added" />
                                            </strong>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- EXPERTISE -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-award"></i>
                                </span>

                                <div>
                                    <h5>Areas of Expertise</h5>
                                    <small>What mentees can learn from you</small>
                                </div>

                            </div>

                            <div class="pf-chips">
                                <asp:Literal ID="litExpertise" runat="server" />
                            </div>

                        </div>


                        <!-- PROFESSIONAL SKILLS -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-lightbulb"></i>
                                </span>

                                <div>
                                    <h5>Professional Skills</h5>
                                    <small>Tools and technologies you use</small>
                                </div>

                            </div>

                            <div class="pf-chips">
                                <asp:Literal ID="litSkills" runat="server" />
                            </div>

                        </div>

                    </div>


                    <!-- SIDE COLUMN -->
                    <div class="col-xl-4">


                        <!-- PROFILE COMPLETION -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-graph-up-arrow"></i>
                                </span>

                                <div>
                                    <h5>Profile Completion</h5>
                                </div>

                            </div>

                            <div class="pf-complete">

                                <asp:Panel ID="pnlRing" runat="server"
                                    CssClass="pf-ring">

                                    <asp:Label ID="lblCompletion" runat="server"
                                        Text="0%" />

                                </asp:Panel>

                                <p>

                                    <strong>
                                        <asp:Label ID="lblCompletionTitle" runat="server"
                                            Text="Keep going!" />
                                    </strong>

                                    <asp:Label ID="lblCompletionHint" runat="server"
                                        Text="" />

                                </p>

                            </div>

                            <asp:Literal ID="litMissing" runat="server" />

                        </div>


                        <!-- PROFILE VISIBILITY -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-eye"></i>
                                </span>

                                <div>
                                    <h5>Profile Visibility</h5>
                                </div>

                            </div>

                            <div class="pf-vis">

                                <p>
                                    Show your mentor profile to mentees.
                                    Changes save instantly.
                                </p>

                                <asp:CheckBox ID="chkProfileVisibility" runat="server"
                                    CssClass="form-check form-switch pf-switch"
                                    InputAttributes-class="form-check-input"
                                    AutoPostBack="true"
                                    OnCheckedChanged="chkProfileVisibility_CheckedChanged"
                                    CausesValidation="false" />

                            </div>

                        </div>


                        <!-- CONTACT -->
                        <div class="pf-card">

                            <div class="pf-card-head">

                                <span class="pf-ico">
                                    <i class="bi bi-person-vcard"></i>
                                </span>

                                <div>
                                    <h5>Contact</h5>
                                </div>

                            </div>

                            <ul class="pf-contact">

                                <li>

                                    <i class="bi bi-envelope"></i>

                                    <div>
                                        <span class="lbl">Email</span>

                                        <strong>
                                            <asp:Label ID="lblProfileEmail" runat="server"
                                                Text="Not added" />
                                        </strong>
                                    </div>

                                </li>

                                <li>

                                    <i class="bi bi-telephone"></i>

                                    <div>
                                        <span class="lbl">Phone</span>

                                        <strong>
                                            <asp:Label ID="lblProfilePhone" runat="server"
                                                Text="Not added" />
                                        </strong>
                                    </div>

                                </li>

                            </ul>

                        </div>

                    </div>

                </div>

            </main>

        </div>


        <!-- EDIT PROFILE MODAL -->
        <div class="modal fade" id="mpEditProfileModal"
            tabindex="-1"
            aria-labelledby="mpEditProfileModalLabel"
            aria-hidden="true">

            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">

                <div class="modal-content profile-modal-content">

                    <div class="modal-header profile-modal-header">

                        <div>

                            <span class="pf-eyebrow">ACCOUNT INFORMATION</span>

                            <h5 class="modal-title fw-bold"
                                id="mpEditProfileModalLabel">

                                <i class="bi bi-person-circle me-2"></i>
                                Edit Your Profile

                            </h5>

                        </div>

                        <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                        </button>

                    </div>


                    <div class="modal-body p-4">


                        <!-- FULL NAME -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtFullName.ClientID %>">

                                Full Name
                                <span class="text-danger">*</span>

                            </label>

                            <asp:TextBox ID="txtFullName" runat="server"
                                CssClass="form-control profile-input"
                                MaxLength="100"
                                placeholder="Enter your full name" />

                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                                ControlToValidate="txtFullName"
                                ErrorMessage="Please enter your full name."
                                CssClass="text-danger small"
                                Display="Dynamic"
                                ValidationGroup="EditProfile" />

                        </div>


                        <!-- PROFESSIONAL TITLE -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtTitle.ClientID %>">

                                Professional Title

                            </label>

                            <asp:TextBox ID="txtTitle" runat="server"
                                CssClass="form-control profile-input"
                                MaxLength="150"
                                placeholder="e.g. Software Engineer" />

                        </div>


                        <!-- PHONE AND EXPERIENCE -->
                        <div class="row g-3 mb-3">

                            <div class="col-md-6">

                                <label class="form-label"
                                    for="<%= txtPhone.ClientID %>">

                                    Phone Number

                                </label>

                                <asp:TextBox ID="txtPhone" runat="server"
                                    CssClass="form-control profile-input"
                                    TextMode="Phone"
                                    MaxLength="20"
                                    placeholder="+91 98765 43210" />

                                <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                    ControlToValidate="txtPhone"
                                    ValidationExpression="^[0-9+\-\s()]{7,20}$"
                                    ErrorMessage="Enter a valid phone number."
                                    CssClass="text-danger small"
                                    Display="Dynamic"
                                    ValidationGroup="EditProfile" />

                            </div>


                            <div class="col-md-6">

                                <label class="form-label"
                                    for="<%= txtExperience.ClientID %>">

                                    Experience

                                </label>

                                <asp:TextBox ID="txtExperience" runat="server"
                                    CssClass="form-control profile-input"
                                    MaxLength="50"
                                    placeholder="e.g. 5 years" />

                            </div>

                        </div>


                        <!-- COMPANY -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtCompany.ClientID %>">

                                Company

                            </label>

                            <asp:TextBox ID="txtCompany" runat="server"
                                CssClass="form-control profile-input"
                                MaxLength="150"
                                placeholder="Enter company name" />

                        </div>


                        <!-- EXPERTISE -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtExpertise.ClientID %>">

                                Areas of Expertise
                                <span class="pf-count">comma separated</span>

                            </label>

                            <asp:TextBox ID="txtExpertise" runat="server"
                                CssClass="form-control profile-input"
                                MaxLength="500"
                                placeholder="e.g. Web Development, AI, Cloud" />

                        </div>


                        <!-- SKILLS -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtSkills.ClientID %>">

                                Professional Skills
                                <span class="pf-count">comma separated</span>

                            </label>

                            <asp:TextBox ID="txtSkills" runat="server"
                                CssClass="form-control profile-input"
                                TextMode="MultiLine"
                                Rows="3"
                                MaxLength="1000"
                                placeholder="e.g. C#, SQL, ASP.NET" />

                        </div>


                        <!-- AVAILABILITY -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtAvailability.ClientID %>">

                                Availability

                            </label>

                            <asp:TextBox ID="txtAvailability" runat="server"
                                CssClass="form-control profile-input"
                                MaxLength="200"
                                placeholder="e.g. Monday-Friday, 7 PM-10 PM" />

                        </div>


                        <!-- BIO -->
                        <div class="mb-3">

                            <label class="form-label"
                                for="<%= txtBio.ClientID %>">

                                Professional Overview
                                <span class="pf-count" id="bioCount">0 / 1000</span>

                            </label>

                            <asp:TextBox ID="txtBio" runat="server"
                                CssClass="form-control profile-input"
                                TextMode="MultiLine"
                                Rows="4"
                                MaxLength="1000"
                                placeholder="Write about your professional background and experience." />

                        </div>

                        <asp:Label ID="lblMessage" runat="server"
                            CssClass="d-block mt-2 small" />

                    </div>


                    <!-- MODAL FOOTER -->
                    <div class="modal-footer profile-modal-footer">

                        <button type="button"
                            class="pf-btn pf-btn-ghost"
                            data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <asp:Button ID="btnSaveChanges" runat="server"
                            Text="Save Changes"
                            CssClass="pf-btn pf-btn-primary"
                            OnClick="btnSaveChanges_Click"
                            ValidationGroup="EditProfile"
                            CausesValidation="true" />

                    </div>

                </div>

            </div>

        </div>

    </form>


    <!-- SCRIPTS -->
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../assets/js/mentor-app.js?v=7"></script>


    <script>

        document.addEventListener("DOMContentLoaded", function () {

            // Open Edit Profile modal.
            var editButton = document.getElementById("btnOpenEditProfile");
            var editModal = document.getElementById("mpEditProfileModal");

            if (editButton && editModal) {

                editButton.addEventListener("click", function () {

                    bootstrap.Modal.getOrCreateInstance(editModal).show();

                });

            }


            // Upload selected profile photo.
            var photoInput = document.getElementById("<%= fuProfilePhoto.ClientID %>");
            var photoButton = document.getElementById("<%= btnUploadPhoto.ClientID %>");

            if (photoInput && photoButton) {

                photoInput.setAttribute("accept", ".jpg,.jpeg,.png");

                photoInput.addEventListener("change", function () {

                    var file = photoInput.files && photoInput.files[0];

                    if (!file) return;

                    var allowedTypes = ["image/jpeg", "image/png"];

                    if (allowedTypes.indexOf(file.type) === -1) {

                        alert("Please select a JPG, JPEG or PNG image.");
                        photoInput.value = "";
                        return;

                    }

                    if (file.size > 2 * 1024 * 1024) {

                        alert("Please select an image smaller than 2 MB.");
                        photoInput.value = "";
                        return;

                    }

                    // Submit the ASP.NET form to execute btnUploadPhoto_Click.
                    photoButton.click();

                });

            }


            // Bio character counter.
            var bio = document.getElementById("<%= txtBio.ClientID %>");
            var count = document.getElementById("bioCount");

            if (bio && count) {

                var updateBioCount = function () {

                    count.textContent = bio.value.length + " / 1000";

                };

                bio.addEventListener("input", updateBioCount);
                updateBioCount();

            }

        });


        // Open profile photo picker.
        function openPhotoPicker() {

            var input = document.getElementById("<%= fuProfilePhoto.ClientID %>");

            if (input) {
                input.click();
            }

        }


        // Remove profile photo.
        function removeProfilePhoto() {

            if (!confirm("Are you sure you want to remove your profile photo?")) {
                return;
            }

            var button = document.getElementById("<%= btnRemovePhoto.ClientID %>");

            if (button) {
                button.click();
            }

        }

    </script>


    <!-- PROFILE SYNC -->
    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>


    <!-- NOTIFICATION DROPDOWN -->
    <script>

        document.addEventListener("DOMContentLoaded", function () {

            var bell = document.getElementById("notificationBell");

            if (bell && window.bootstrap) {

                bootstrap.Dropdown.getOrCreateInstance(bell);

            }

        });

    </script>

</body>
</html>