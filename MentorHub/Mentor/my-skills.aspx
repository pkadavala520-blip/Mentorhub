<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my-skills.aspx.cs" Inherits="MentorHub.Mentor.Mentor_My_Skills" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Skills | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link rel="stylesheet" href="../assets/css/mentor-skills.css?v=1" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />
</head>

<body class="mentor-shell" data-page="skills">

    <form id="form1" runat="server">

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

                    <a class="nav-link" href="profile.aspx">
                        <i class="bi bi-person"></i>
                        <span>My Profile</span>
                    </a>

                    <a class="nav-link active" href="my-skills.aspx" aria-current="page">
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
                                            data-type='<%# Eval("NotificationType") %>'>

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

                <!-- PAGE HEADING -->
                <div class="d-flex justify-content-between align-items-start flex-wrap gap-3 mb-4 fade-in">

                    <div>
                        <span class="mp-page-eyebrow">
                            <i class="bi bi-lightbulb"></i>
                            My Skills
                </span>

                        <h2 class="fw-bold mt-3 mb-1">Core expertise and learning focus areas
                </h2>

                        <p class="text-muted mb-0">
                            Showcase the capabilities your mentees can rely on for practical guidance and growth.
               
                       
                        </p>
                    </div>

                    <a href="edit-skills.aspx" class="mp-btn mp-btn-primary">
                        <i class="bi bi-plus-lg"></i>
                        Add New Skill
            </a>

                </div>

                <!-- STATISTICS -->
                <div class="row g-3 mb-4 skills-stat-row">

                    <div class="col-md-4">
                        <div class="skills-stat-card">
                            <div class="skills-stat-icon green">
                                <i class="bi bi-lightbulb"></i>
                            </div>

                            <div>
                                <span>Total Skills</span>
                                <h3>
                                    <asp:Label ID="lblTotalSkills" runat="server" Text="0" />
                                </h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="skills-stat-card">
                            <div class="skills-stat-icon blue">
                                <i class="bi bi-grid"></i>
                            </div>

                            <div>
                                <span>Categories</span>
                                <h3>
                                    <asp:Label ID="lblTotalCategories" runat="server" Text="0" />
                                </h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="skills-stat-card">
                            <div class="skills-stat-icon orange">
                                <i class="bi bi-award"></i>
                            </div>

                            <div>
                                <span>Expert Skills</span>
                                <h3>
                                    <asp:Label ID="lblExpertSkills" runat="server" Text="0" />
                                </h3>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- SKILLS SECTION -->
                <div class="skills-main-card">

                    <div class="skills-section-heading">

                        <div>
                            <h4>My Professional Skills</h4>
                            <p>Manage your skills, expertise and experience.</p>
                        </div>

                        <span class="skills-live-badge">
                            <i class="bi bi-check-circle-fill"></i>
                            Database Connected
                </span>

                    </div>

                    <!-- MESSAGE -->
                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="skills-message" />

                    <!-- EMPTY STATE -->
                    <asp:Panel ID="pnlNoSkills" runat="server"
                        Visible="false"
                        CssClass="skills-empty-state">

                        <div class="empty-skill-icon">
                            <i class="bi bi-lightbulb"></i>
                        </div>

                        <h4>No Skills Added Yet</h4>

                        <p>
                            Start adding your professional skills to showcase your expertise.
               
                       
                        </p>

                        <a href="edit-skills.aspx" class="mp-btn mp-btn-primary">
                            <i class="bi bi-plus-lg"></i>
                            Add Your First Skill
                </a>

                    </asp:Panel>

                    <!-- DYNAMIC SKILLS -->
                    <asp:Repeater ID="rptSkills" runat="server"
                        OnItemCommand="rptSkills_ItemCommand">

                        <HeaderTemplate>
                            <div class="skills-dynamic-list">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <div class="dynamic-skill-card">

                                <div class="dynamic-skill-icon">
                                    <i class="bi bi-lightbulb-fill"></i>
                                </div>

                                <div class="dynamic-skill-content">

                                    <div class="dynamic-skill-title-row">

                                        <h5><%#: Eval("Skill_Nm") %></h5>

                                        <span class="skill-level-badge">
                                            <%#: Eval("SkillLevel") %>
                                </span>

                                    </div>

                                    <span class="dynamic-skill-category">
                                        <i class="bi bi-grid"></i>
                                        <%#: Eval("Categories") %>
                            </span>

                                    <div class="dynamic-skill-meta">

                                        <span>
                                            <i class="bi bi-clock"></i>
                                            <%#: Eval("YearsExperience") %> years experience
                                </span>

                                    </div>

                                    <p class="dynamic-skill-description">
                                        <%#: Eval("Description") %>
                                    </p>

                                </div>

                                <div class="dynamic-skill-actions">

                                    <asp:LinkButton ID="btnEdit" runat="server"
                                        CssClass="skill-action-btn edit"
                                        CommandName="EditSkill"
                                        CommandArgument='<%# Eval("MentorSkillID") %>'
                                        CausesValidation="false">

                                <i class="bi bi-pencil-square"></i>
                                Edit

                            </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete" runat="server"
                                        CssClass="skill-action-btn delete"
                                        CommandName="DeleteSkill"
                                        CommandArgument='<%# Eval("MentorSkillID") %>'
                                        CausesValidation="false"
                                        OnClientClick="return confirm('Are you sure you want to delete this skill?');">

                                <i class="bi bi-trash"></i>
                                Delete

                            </asp:LinkButton>

                                </div>

                            </div>

                        </ItemTemplate>

                        <FooterTemplate>
                            </div>
               
                       
                        </FooterTemplate>

                    </asp:Repeater>

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