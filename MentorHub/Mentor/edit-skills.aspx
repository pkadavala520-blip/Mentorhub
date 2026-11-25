<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit-skills.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Edit_Skills" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add / Edit Skill | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link rel="stylesheet" href="../assets/css/mentor-skills.css?v=1" />
    <link rel="stylesheet" href="../assets/css/notification-dropdown.css?v=2" />
</head>

<body class="mentor-shell" data-page="skills">

    <form id="form1" runat="server">

        <div class="d-flex">

            <!-- SIDEBAR -->
            <aside class="sidebar mp-sidebar">

                <div class="mp-brand">
                    <div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div>
                    <div class="mp-brand-text">
                        <h4>MentorHub</h4>
                        <span>Mentor Panel</span>
                    </div>
                </div>

                <nav class="mp-nav nav flex-column" aria-label="Mentor navigation">

                    <div class="mp-nav-section-label">Overview</div>

                    <a class="nav-link" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
                    <a class="nav-link" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
                    <a class="nav-link active" href="my-skills.aspx" aria-current="page"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>

                    <div class="mp-nav-section-label">Mentoring</div>

                    <a class="nav-link" href="availability.aspx"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>

                    <a class="nav-link" href="requests.aspx">
                        <i class="bi bi-ui-checks"></i>
                        <span>Matching Requests</span>
                        <span class="mp-nav-badge" data-badge="requests">0</span>
                    </a>

                    <a class="nav-link" href="mentees.aspx"><i class="bi bi-people"></i><span>My Mentees</span></a>

                    <a class="nav-link" href="messages.aspx">
                        <i class="bi bi-chat-dots"></i>
                        <span>Messages</span>
                        <span class="mp-nav-badge" data-badge="messages">0</span>
                    </a>

                    <a class="nav-link" href="schedule.aspx"><i class="bi bi-calendar2-event"></i><span>Schedule</span></a>

                    <div class="mp-nav-section-label">Insights</div>

                    <a class="nav-link" href="feedback.aspx"><i class="bi bi-star"></i><span>Feedback &amp; Reviews</span></a>
                    <a class="nav-link" href="notifications.aspx"><i class="bi bi-bell"></i><span>Notifications</span></a>

                    <div class="mp-nav-section-label">Account</div>

                    <a class="nav-link" href="settings.aspx"><i class="bi bi-gear"></i><span>Settings</span></a>

                </nav>

                <div class="mp-sidebar-footer">

                    <div class="mp-mini-profile mb-2">
                        <span class="mp-avatar sm" data-mini-avatar>DR</span>

                        <div class="mp-mini-profile-text">
                            <strong data-mini-name>Mentor</strong>
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

            <!-- MAIN CONTENT -->
            <main class="flex-grow-1 content-area p-4">

                <!-- TOPBAR -->
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
                            <input type="text" placeholder="Search mentees, requests, sessions..." />
                        </div>

                    </div>

                    <div class="d-flex align-items-center gap-2">

                        <!-- DARK MODE -->
                        <label class="mp-icon-btn" title="Toggle dark mode" style="cursor: pointer;">
                            <input type="checkbox" data-dark-toggle class="visually-hidden" />
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
                                    <a href="notifications.aspx" class="notification-view-all">View all</a>
                                </div>

                                <asp:Repeater ID="rptTopNotifications" runat="server">
                                    <ItemTemplate>

                                        <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "mp-notif-item" : "mp-notif-item unread" %>'
                                            data-type='<%#: Eval("NotificationType") %>'>

                                            <a href="notifications.aspx">
                                                <div class="mp-notif-body">
                                                    <div class="mp-notif-title"><%#: Eval("Title") %></div>
                                                    <div class="mp-notif-text"><%#: Eval("Message") %></div>
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

                        <!-- PROFILE MENU -->
                        <div class="dropdown">

                            <button type="button"
                                class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm" data-mini-avatar>DR</span>
                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu" style="min-width: 190px;">

                                <a class="dropdown-item rounded-3" href="profile.aspx">
                                    <i class="bi bi-person me-2"></i>My Profile
                                </a>

                                <a class="dropdown-item rounded-3" href="settings.aspx">
                                    <i class="bi bi-gear me-2"></i>Settings
                                </a>

                                <hr class="my-1" />

                                <a class="dropdown-item rounded-3 text-danger" href="../Home/SignIn_up.aspx">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout
                                </a>

                            </div>
                        </div>

                    </div>

                </div>

                <!-- PAGE CONTENT -->
                <div class="edit-skill-content">

                    <!-- PAGE HEADING -->
                    <div class="edit-page-heading fade-in">

                        <span class="edit-eyebrow">
                            <i class="bi bi-lightbulb"></i>
                            MY SKILLS
                        </span>

                        <h2>
                            <asp:Label ID="lblPageTitle" runat="server" Text="Add New Skill" />
                        </h2>

                        <p>
                            Showcase your professional expertise and help mentees
                            discover your skills and experience.
                        </p>

                    </div>

                    <!-- SKILL FORM CARD -->
                    <div class="edit-skill-card">

                        <div class="edit-card-heading">

                            <div class="edit-heading-icon">
                                <i class="bi bi-pencil-square"></i>
                            </div>

                            <div>
                                <h4>Skill Information</h4>
                                <p>Complete the details below to manage your professional expertise.</p>
                            </div>

                        </div>

                        <!-- MESSAGE -->
                        <asp:Label ID="lblMessage" runat="server" CssClass="edit-message" />

                        <!-- SELECT SKILL -->
                        <div class="edit-form-group">

                            <label>Select Skill <span class="required">*</span></label>

                            <asp:DropDownList ID="ddlSkill" runat="server"
                                CssClass="edit-input"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlSkill_SelectedIndexChanged">
                            </asp:DropDownList>

                        </div>

                        <!-- CATEGORY -->
                        <div class="edit-form-group">

                            <label>Skill Category</label>

                            <asp:TextBox ID="txtCategory" runat="server"
                                CssClass="edit-input"
                                ReadOnly="true"
                                placeholder="Category will appear automatically">
                            </asp:TextBox>

                            <div class="edit-form-note">
                                Category is automatically fetched from the skill database.
                            </div>

                        </div>

                        <!-- SKILL LEVEL AND EXPERIENCE -->
                        <div class="edit-form-row">

                            <div class="edit-form-group">

                                <label>Skill Level <span class="required">*</span></label>

                                <asp:DropDownList ID="ddlSkillLevel" runat="server" CssClass="edit-input">

                                    <asp:ListItem Text="Select Skill Level" Value="" />
                                    <asp:ListItem Text="Beginner" Value="Beginner" />
                                    <asp:ListItem Text="Intermediate" Value="Intermediate" />
                                    <asp:ListItem Text="Advanced" Value="Advanced" />
                                    <asp:ListItem Text="Expert" Value="Expert" />

                                </asp:DropDownList>

                            </div>

                            <div class="edit-form-group">

                                <label>Years of Experience <span class="required">*</span></label>

                                <asp:TextBox ID="txtExperience" runat="server"
                                    CssClass="edit-input"
                                    TextMode="Number"
                                    min="0"
                                    placeholder="Example: 2">
                                </asp:TextBox>

                            </div>

                        </div>

                        <!-- DESCRIPTION -->
                        <div class="edit-form-group">

                            <label>Description</label>

                            <asp:TextBox ID="txtDescription" runat="server"
                                CssClass="edit-input edit-description"
                                TextMode="MultiLine"
                                Rows="5"
                                MaxLength="500"
                                placeholder="Describe your experience with this skill...">
                            </asp:TextBox>

                            <div class="edit-form-note">Maximum 500 characters.</div>

                        </div>

                        <!-- INFORMATION -->
                        <div class="edit-info-card">
                            <i class="bi bi-info-circle-fill"></i>

                            <p>
                                Add accurate information about your expertise.
                                Your skills help mentees understand your strengths
                                and choose the right mentor.
                            </p>
                        </div>

                        <!-- BUTTONS -->
                        <div class="edit-form-actions">

                            <asp:LinkButton ID="btnBack" runat="server"
                                CssClass="edit-back-btn"
                                CausesValidation="false"
                                OnClick="btnBack_Click">
                                <i class="bi bi-arrow-left"></i> Back to My Skills
                            </asp:LinkButton>

                            <asp:Button ID="btnCancel" runat="server"
                                Text="Cancel"
                                CssClass="edit-cancel-btn"
                                CausesValidation="false"
                                OnClick="btnBack_Click" />

                            <asp:Button ID="btnSave" runat="server"
                                Text="Save Skill"
                                CssClass="edit-save-btn"
                                OnClick="btnSave_Click" />

                        </div>

                    </div>

                </div>

            </main>

        </div>

    </form>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/mentor-app.js?v=1"></script>
    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>

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
