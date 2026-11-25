<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notifications.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Notifications" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Notifications | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <link href="../assets/css/styles.css?v=6" rel="stylesheet" />
    <link href="../assets/css/mentor-panel.css?v=8" rel="stylesheet" />
    <link href="../assets/css/notifications.css?v=3" rel="stylesheet" />

</head>

<body class="mentor-shell" data-page="notifications">

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

                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarRequests" runat="server" Text="0"></asp:Label>
                        </span>
                    </a>

                    <a class="nav-link" href="mentees.aspx">
                        <i class="bi bi-people"></i>
                        <span>My Mentees</span>
                    </a>

                    <a class="nav-link" href="messages.aspx">
                        <i class="bi bi-chat-dots"></i>
                        <span>Messages</span>

                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarMessages" runat="server" Text="0"></asp:Label>
                        </span>
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

                    <a class="nav-link active" href="notifications.aspx" aria-current="page">
                        <i class="bi bi-bell"></i>
                        <span>Notifications</span>

                        <span class="mp-nav-badge">
                            <asp:Label ID="lblSidebarNotifications" runat="server" Text="0"></asp:Label>
                        </span>
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

                        <span class="mp-avatar sm">
                            <asp:Label ID="lblMiniAvatar" runat="server" Text="MH"></asp:Label>
                        </span>

                        <div class="mp-mini-profile-text">

                            <strong>
                                <asp:Label ID="lblMiniName" runat="server" Text="Mentor"></asp:Label>
                            </strong>

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


                <!-- TOPBAR - KEEP EXISTING CSS -->

                <div class="mp-topbar mb-4">

                    <div class="d-flex align-items-center gap-3">

                        <button type="button"
                            class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle
                            aria-label="Toggle navigation menu">

                            <i class="bi bi-list"></i>

                        </button>

                        <div class="mp-search d-none d-md-block">

                            <i class="bi bi-search"></i>

                            <input type="text" placeholder="Notifications" disabled />

                        </div>

                    </div>


                    <div class="d-flex align-items-center gap-2">


                        <!-- DARK MODE -->

                        <label class="mp-icon-btn" title="Toggle dark mode">

                            <input type="checkbox"
                                data-dark-toggle
                                class="visually-hidden" />

                            <i class="bi bi-moon-stars"></i>

                        </label>


                        <!-- NOTIFICATION DROPDOWN - KEEP EXISTING -->

                        <div class="dropdown">

                            <button id="notificationBell"
                                class="mp-icon-btn"
                                type="button"
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="true"
                                aria-expanded="false"
                                aria-label="Notifications"
                                title="Notifications">

                                <i class="bi bi-bell"></i>

                                <asp:Label ID="lblNotifDot"
                                    runat="server"
                                    CssClass="mp-dot"
                                    Text=" "
                                    Visible="false">
                                </asp:Label>

                            </button>


                            <div class="dropdown-menu dropdown-menu-end mp-notification-dropdown">

                                <div class="d-flex justify-content-between align-items-center px-2 pb-2">

                                    <strong class="notification-heading">

                                        <i class="bi bi-bell me-1"></i>
                                        Notifications

                                    </strong>

                                    <a href="notifications.aspx"
                                        class="notification-view-all">

                                        View all

                                    </a>

                                </div>


                                <asp:Repeater ID="rptTopNotifications" runat="server">

                                    <ItemTemplate>

                                        <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "mp-notif-item" : "mp-notif-item unread" %>'
                                            data-type='<%#: Eval("NotificationType") %>'>

                                            <a href="notifications.aspx">

                                                <span class="mp-notif-body">

                                                    <div class="mp-notif-title">
                                                        <%#: Eval("Title") %>
                                                    </div>

                                                    <div class="mp-notif-text">
                                                        <%#: Eval("Message") %>
                                                    </div>

                                                    <div class="mp-notif-time">
                                                        <%# Eval("CreatedAt", "{0:dd MMM yyyy, hh:mm tt}") %>
                                                    </div>

                                                </span>

                                            </a>

                                        </div>

                                    </ItemTemplate>

                                </asp:Repeater>


                                <asp:Panel ID="pnlTopEmpty"
                                    runat="server"
                                    Visible="false"
                                    CssClass="notification-empty">

                                    <i class="bi bi-bell-slash"></i>

                                    <p class="small mb-0">No notifications yet.</p>

                                </asp:Panel>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- NOTIFICATIONS PAGE -->

                <section class="notifications-page">


                    <!-- PAGE HEADER -->

                    <div class="notifications-header">

                        <div class="notifications-title">

                            <div>

                                <h2>All Notifications</h2>

                                <p>Manage your latest updates and activities.</p>

                            </div>

                        </div>


                        <div class="notifications-header-actions">


                            <!-- UNREAD COUNTER -->

                            <div class="unread-counter">

                                <span>

                                    Unread:

                                    <asp:Label ID="lblUnreadCount"
                                        runat="server"
                                        Text="0">
                                    </asp:Label>

                                </span>

                            </div>


                            <!-- MARK ALL READ -->

                            <span class="mark-all-wrap">

                                <asp:Button ID="btnMarkAllRead"
                                    runat="server"
                                    Text="Mark all as read"
                                    CssClass="btn btn-primary"
                                    OnClick="btnMarkAllRead_Click" />

                            </span>

                        </div>

                    </div>


                    <!-- STATUS MESSAGE -->

                    <asp:Panel ID="pnlMessage"
                        runat="server"
                        Visible="false"
                        CssClass="alert alert-success">

                        <asp:Label ID="lblMessage" runat="server"></asp:Label>

                    </asp:Panel>


                    <!-- NOTIFICATION LIST -->

                    <div class="notification-list">


                        <asp:Repeater ID="rptNotifications"
                            runat="server"
                            OnItemCommand="rptNotifications_ItemCommand">

                            <ItemTemplate>


                                <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "notification-card read" : "notification-card unread" %>'
                                    data-type='<%#: Eval("NotificationType") %>'>


                                    <div class="notification-content">


                                        <!-- TITLE AND DATE -->

                                        <div class="notification-title-row">

                                            <h5>
                                                <%#: Eval("Title") %>
                                            </h5>

                                            <span class="notification-date">

                                                <%# Eval("CreatedAt", "{0:dd MMM yyyy, hh:mm tt}") %>

                                            </span>

                                        </div>


                                        <!-- MESSAGE -->

                                        <p>
                                            <%#: Eval("Message") %>
                                        </p>


                                        <!-- ACTION -->

                                        <div class="notification-actions">


                                            <asp:LinkButton ID="btnRead"
                                                runat="server"
                                                CommandName="Read"
                                                CommandArgument='<%# Eval("NotificationID") %>'
                                                Visible='<%# !Convert.ToBoolean(Eval("IsRead")) %>'
                                                CssClass="notification-read-btn">

                                                <i class="bi bi-check2"></i>
                                                Mark as read

                                            </asp:LinkButton>


                                            <!-- READ STATUS -->

                                            <asp:PlaceHolder ID="phReadStatus"
                                                runat="server"
                                                Visible='<%# Convert.ToBoolean(Eval("IsRead")) %>'>

                                                <span class="read-status">

                                                    <i class="bi bi-check-circle-fill"></i>
                                                    Read

                                                </span>

                                            </asp:PlaceHolder>


                                        </div>

                                    </div>

                                </div>


                            </ItemTemplate>

                        </asp:Repeater>


                        <!-- EMPTY STATE -->

                        <asp:Panel ID="pnlNoNotifications"
                            runat="server"
                            Visible="false"
                            CssClass="notification-empty-state">

                            <div class="empty-notification-icon">

                                <i class="bi bi-bell-slash"></i>

                            </div>

                            <h4>No notifications yet</h4>

                            <p>
                                You're all caught up! New updates will appear here.
                            </p>

                        </asp:Panel>


                    </div>

                </section>

            </main>

        </div>

    </form>


    <!-- SCRIPTS -->

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