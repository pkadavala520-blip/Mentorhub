<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mentee-profile.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Mentee_Profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentee Profile | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />
</head>

<body class="mentor-shell" data-page="mentee-profile">

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

                <nav class="mp-nav nav flex-column">

                    <div class="mp-nav-section-label">Overview</div>

                    <a class="nav-link" href="index.aspx">
                        <i class="bi bi-speedometer2"></i><span>Dashboard</span>
                    </a>

                    <a class="nav-link" href="profile.aspx">
                        <i class="bi bi-person"></i><span>My Profile</span>
                    </a>

                    <a class="nav-link" href="my-skills.aspx">
                        <i class="bi bi-lightbulb"></i><span>My Skills</span>
                    </a>

                    <div class="mp-nav-section-label">Mentoring</div>

                    <a class="nav-link" href="availability.aspx">
                        <i class="bi bi-calendar2-week"></i><span>Availability</span>
                    </a>

                    <a class="nav-link" href="requests.aspx">
                        <i class="bi bi-ui-checks"></i><span>Matching Requests</span>
                    </a>

                    <a class="nav-link active" href="mentees.aspx">
                        <i class="bi bi-people"></i><span>My Mentees</span>
                    </a>

                    <a class="nav-link" href="messages.aspx">
                        <i class="bi bi-chat-dots"></i><span>Messages</span>
                    </a>

                    <a class="nav-link" href="schedule.aspx">
                        <i class="bi bi-calendar2-event"></i><span>Schedule</span>
                    </a>

                    <div class="mp-nav-section-label">Insights</div>

                    <a class="nav-link" href="feedback.aspx">
                        <i class="bi bi-star"></i><span>Feedback &amp; Reviews</span>
                    </a>

                    <a class="nav-link" href="notifications.aspx">
                        <i class="bi bi-bell"></i><span>Notifications</span>
                    </a>

                    <div class="mp-nav-section-label">Account</div>

                    <a class="nav-link" href="settings.aspx">
                        <i class="bi bi-gear"></i><span>Settings</span>
                    </a>

                </nav>

                <div class="mp-sidebar-footer">
                    <div class="mp-mini-profile mb-2">
                        <span class="mp-avatar sm">
                            <asp:Label ID="lblSidebarInitials" runat="server" Text="MH" />
                        </span>

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

                    <a class="nav-link mp-danger" href="../Home/SignIn_up.aspx">
                        <i class="bi bi-box-arrow-right"></i><span>Logout</span>
                    </a>
                </div>

            </aside>

            <!-- MAIN CONTENT -->
            <main class="flex-grow-1 content-area p-4">

                <div class="mp-topbar mb-4">

                    <div class="d-flex align-items-center gap-3">
                        <button type="button" class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle>
                            <i class="bi bi-list"></i>
                        </button>

                        <div class="mp-search d-none d-md-block">
                            <i class="bi bi-search"></i>
                            <input type="text" placeholder="Search mentees, requests, sessions…" />
                        </div>
                    </div>

                    <div class="d-flex align-items-center gap-2">
                        <label class="mp-icon-btn" title="Toggle dark mode" style="cursor: pointer;">
                            <input type="checkbox" data-dark-toggle class="visually-hidden" />
                            <i class="bi bi-moon-stars"></i>
                        </label>
                    </div>

                </div>

                <!-- HEADING -->
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4 fade-in">

                    <div>
                        <span class="mp-page-eyebrow">
                            <i class="bi bi-person-badge"></i>Mentee Profile
                </span>

                        <h2 class="fw-bold mt-3 mb-1">Mentoring relationship overview</h2>
                    </div>

                    <a href="mentees.aspx" class="mp-btn mp-btn-outline">
                        <i class="bi bi-arrow-left"></i>Back
            </a>

                </div>

                <!-- PROFILE CARD -->
                <div class="mp-card p-4 fade-in">

                    <div class="row g-4 align-items-center">

                        <div class="col-lg-3 text-center">

                            <span class="mp-avatar lg mx-auto">
                                <asp:Label ID="lblMenteeInitials" runat="server" Text="M" />
                            </span>

                            <h5 class="fw-bold mt-3 mb-1">
                                <asp:Label ID="lblMenteeName" runat="server" />
                            </h5>

                            <p class="text-muted small">
                                <asp:Label ID="lblMenteeGoal" runat="server" />
                            </p>

                            <div class="d-flex justify-content-center gap-2">

                                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm">
                                    <i class="bi bi-chat-dots"></i>Message
                        </a>

                                <a href="schedule.aspx" class="mp-btn mp-btn-outline btn-sm">
                                    <i class="bi bi-calendar2-plus"></i>Schedule
                        </a>

                            </div>

                        </div>

                        <div class="col-lg-9">

                            <div class="row g-3">

                                <div class="col-md-6">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-envelope me-2 text-primary"></i>Email
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblEmail" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-telephone me-2 text-primary"></i>Phone
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblPhone" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-bullseye me-2 text-primary"></i>Career Goal
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblCareerGoal" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-book me-2 text-primary"></i>Education
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblEducation" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-building me-2 text-primary"></i>College
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblCollege" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-lightbulb me-2 text-primary"></i>Preferred Domain
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblDomain" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-journal-text me-2 text-primary"></i>Learning Goal
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblLearningGoal" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-person-lines-fill me-2 text-primary"></i>About Mentee
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblBio" runat="server" />
                                        </p>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mp-panel p-3">
                                        <h6 class="fw-semibold">
                                            <i class="bi bi-calendar-check me-2 text-primary"></i>Request Date
                                </h6>
                                        <p class="mb-0 text-muted">
                                            <asp:Label ID="lblRequestDate" runat="server" />
                                        </p>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <asp:Panel ID="pnlMessage" runat="server" Visible="false"
                    CssClass="alert alert-warning mt-3">
                    <asp:Label ID="lblMessage" runat="server" />
                </asp:Panel>

            </main>

        </div>

    </form>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/mentor-app.js?v=1"></script>

    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>
</body>
</html>