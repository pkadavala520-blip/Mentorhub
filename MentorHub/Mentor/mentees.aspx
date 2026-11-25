<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mentees.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Mentees" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Mentees | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />
</head>

<body class="mentor-shell" data-page="mentees">

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
                        <i class="bi bi-ui-checks"></i>
                        <span>Matching Requests</span>
                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarRequests" runat="server" Text="0" /></span>
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
                                <asp:Label ID="lblSidebarName" runat="server" Text="Mentor" /></strong>
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

                <!-- TOPBAR -->
                <div class="mp-topbar mb-4">

                    <div class="d-flex align-items-center gap-3">

                        <button type="button" class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle aria-label="Toggle navigation menu">
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

                    </div>
                </div>

                <!-- PAGE HEADING -->
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4 fade-in">

                    <div>
                        <span class="mp-page-eyebrow">
                            <i class="bi bi-people"></i>My Mentees
                </span>

                        <h2 class="fw-bold mt-3 mb-1">Your mentoring relationships</h2>

                        <p class="text-muted mb-0">
                            Track progress and jump back into any conversation.
               
                        </p>
                    </div>

                    <!-- DATABASE SEARCH -->
                    <div class="mp-search">
                        <i class="bi bi-search"></i>

                        <asp:TextBox ID="txtMenteeSearch" runat="server"
                            placeholder="Search mentees..."
                            AutoPostBack="true"
                            OnTextChanged="txtMenteeSearch_TextChanged"
                            CssClass="form-control">
                </asp:TextBox>
                    </div>

                </div>

                <!-- SUCCESS / ERROR MESSAGE -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false"
                    CssClass="alert alert-info rounded-3">
                    <asp:Label ID="lblMessage" runat="server" />
                </asp:Panel>

                <!-- DYNAMIC MENTEE CARDS -->
                <div class="row g-4 mp-stagger">

                    <asp:Repeater ID="rptMentees" runat="server" OnItemCommand="rptMentees_ItemCommand">

                        <ItemTemplate>

                            <div class="col-lg-4 col-md-6">

                                <div class="mp-mentee-card h-100">

                                    <div class="d-flex align-items-center gap-3 mb-3">

                                        <span class="mp-avatar md">
                                            <%# Eval("Initials") %>
                                </span>

                                        <div class="flex-grow-1">

                                            <h6 class="fw-bold mb-1">
                                                <%# Server.HtmlEncode(Convert.ToString(Eval("FullName"))) %>
                                    </h6>

                                            <span class="text-muted small">
                                                <%# Server.HtmlEncode(Convert.ToString(Eval("PreferredDomain"))) %>
                                    </span>

                                        </div>

                                        <span class="badge bg-success">Accepted</span>

                                    </div>

                                    <p class="text-muted small mb-3">
                                        <strong>Mentoring Goal:</strong><br />

                                        <%# Server.HtmlEncode(Convert.ToString(Eval("Goal"))) %>
                                    </p>

                                    <div class="small text-muted mb-2">
                                        <i class="bi bi-envelope me-2"></i>
                                        <%# Server.HtmlEncode(Convert.ToString(Eval("Email"))) %>
                                    </div>

                                    <div class="small text-muted mb-3">
                                        <i class="bi bi-calendar3 me-2"></i>
                                        Joined:
                               
                                        <%# Eval("CreatedAt", "{0:dd MMM yyyy}") %>
                                    </div>

                                    <div class="d-flex gap-2 mt-auto">

                                        <a href='mentee-profile.aspx?id=<%# Eval("RequestID") %>'
                                            class="mp-btn mp-btn-soft btn-sm flex-grow-1 justify-content-center">

                                            <i class="bi bi-person-lines-fill"></i>
                                            View Profile

                                </a>

                                        <a href="messages.aspx"
                                            class="mp-btn mp-btn-outline btn-sm mp-btn-icon">

                                            <i class="bi bi-chat-dots"></i>

                                        </a>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

                <!-- EMPTY STATE -->
                <asp:Panel ID="pnlNoMentees" runat="server" Visible="false">

                    <div class="mp-card text-center p-5 mt-3">

                        <i class="bi bi-people fs-1 text-muted"></i>

                        <h5 class="fw-bold mt-3">No mentees found</h5>

                        <p class="text-muted mb-0">
                            Accepted mentee requests will appear here.
               
                        </p>

                    </div>

                </asp:Panel>

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