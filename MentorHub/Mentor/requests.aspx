<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requests.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Requests" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Matching Requests | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link href="../assets/css/styles.css?v=6" rel="stylesheet" />
    <link href="../assets/css/mentor-panel.css?v=8" rel="stylesheet" />
    <link href="../assets/css/notification-dropdown.css?v=2" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f7faf7;
        }

        .page-heading h2 {
            color: #173b35;
            font-size: 24px;
            font-weight: 700;
        }

        .page-heading p {
            color: #829087;
            font-size: 13px;
        }

        .mentor-welcome {
            color: #147d64;
            font-weight: 600;
        }

        .request-panel {
            background: #fff;
            border: 1px solid #e5ece6;
            border-radius: 14px;
            padding: 22px;
            box-shadow: 0 4px 18px rgba(23,59,53,.04);
        }

        .request-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 14px;
            margin-bottom: 20px;
        }

        .mp-tabs {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .mp-tab {
            display: inline-block;
            padding: 8px 15px;
            border: 1px solid #e1eae2;
            border-radius: 8px;
            background: #f8fbf8;
            color: #61766a;
            text-decoration: none;
            font-size: 12px;
            font-weight: 500;
        }

            .mp-tab:hover {
                color: #2e7d32;
                background: #edf7ee;
            }

            .mp-tab.active {
                color: #fff;
                background: #2e7d32;
                border-color: #2e7d32;
            }

        .search-box {
            width: 270px;
            height: 41px;
            display: flex;
            align-items: center;
            gap: 9px;
            padding: 0 12px;
            border: 1px solid #dce7de;
            border-radius: 8px;
            background: #fff;
        }

            .search-box i {
                color: #84968a;
            }

            .search-box input {
                width: 100%;
                border: 0 !important;
                outline: 0 !important;
                box-shadow: none !important;
                font-family: 'Poppins', sans-serif;
                font-size: 12px;
            }

        .table-responsive {
            border: 1px solid #e8eee9;
            border-radius: 10px;
        }

        .request-table {
            min-width: 1100px;
            margin-bottom: 0;
            vertical-align: middle;
        }

            .request-table thead th {
                padding: 14px 13px;
                background: #f3f8f3;
                color: #526b5b;
                border-bottom: 1px solid #e3ece4;
                font-size: 11px;
                font-weight: 600;
                white-space: nowrap;
            }

            .request-table tbody td {
                padding: 15px 13px;
                color: #596b60;
                border-bottom: 1px solid #edf1ed;
                font-size: 11px;
                vertical-align: middle;
            }

            .request-table tbody tr:last-child td {
                border-bottom: 0;
            }

            .request-table tbody tr:hover {
                background: #fbfdfb;
            }

        .mentee-name {
            color: #173b35;
            font-size: 12px;
            font-weight: 600;
        }

        .mentee-email {
            display: block;
            margin-top: 4px;
            color: #87958b;
            font-size: 10px;
        }

        .mentee-id {
            display: block;
            margin-top: 3px;
            color: #9aa69e;
            font-size: 9px;
        }

        .mentee-avatar {
            width: 36px;
            height: 36px;
            min-width: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #ddf3df;
            color: #2e7d32;
            font-size: 11px;
            font-weight: 700;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 10px;
            font-weight: 600;
            white-space: nowrap;
        }

        .status-pending {
            color: #946200;
            background: #fff3cd;
        }

        .status-accepted {
            color: #176b37;
            background: #dff3e5;
        }

        .status-rejected {
            color: #a52d2d;
            background: #fce5e5;
        }

        .action-btn {
            padding: 6px 10px;
            border-radius: 6px;
            font-size: 10px;
            font-weight: 500;
            white-space: nowrap;
        }

        .btn-accept {
            color: #fff;
            background: #2e7d32;
            border: 1px solid #2e7d32;
        }

            .btn-accept:hover {
                color: #fff;
                background: #075b3a;
            }

        .btn-reject {
            color: #c65349;
            background: #fff;
            border: 1px solid #e6b9b5;
        }

            .btn-reject:hover {
                color: #fff;
                background: #c65349;
            }

        .empty-state {
            padding: 45px 15px;
            text-align: center;
            color: #84958a;
        }

            .empty-state i {
                display: block;
                margin-bottom: 12px;
                color: #9dbda0;
                font-size: 38px;
            }

            .empty-state h5 {
                color: #173b35;
                font-size: 15px;
                font-weight: 600;
            }

            .empty-state p {
                font-size: 12px;
            }

        /* Completed request action icons */
        .request-result-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.2s ease;
        }

            .request-result-icon.accepted {
                color: #198754;
                background: #e5f5eb;
            }

            .request-result-icon.rejected {
                color: #dc3545;
                background: #fdeaea;
            }

            .request-result-icon:hover {
                transform: scale(1.08);
            }

        @media (max-width: 768px) {
            .request-panel {
                padding: 14px;
            }

            .request-toolbar,
            .mp-tabs {
                width: 100%;
            }

            .search-box {
                width: 100%;
            }

            .page-heading h2 {
                font-size: 20px;
            }
        }
    </style>
</head>

<body class="mentor-shell" data-page="requests">

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

                    <a class="nav-link active" href="requests.aspx" aria-current="page">
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

                    <div class="mp-nav-section-label">Account</div>

                    <a class="nav-link" href="settings.aspx">
                        <i class="bi bi-gear"></i>
                        <span>Settings</span>
                    </a>

                </nav>

                <div class="mp-sidebar-footer">
                    <div class="mp-mini-profile mb-2">
                        <span class="mp-avatar sm">
                            <asp:Label ID="lblSidebarInitials" runat="server" Text="MH"></asp:Label>
                        </span>
                        <div class="mp-mini-profile-text">
                            <strong>
                                <asp:Label ID="lblSidebarName" runat="server" Text="Mentor"></asp:Label>
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

                <!-- TOPBAR -->
                <div class="mp-topbar mb-4">

                    <!-- LEFT -->
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

                    <!-- RIGHT -->
                    <div class="d-flex align-items-center gap-2">

                        <!-- DARK MODE -->
                        <label class="mp-icon-btn"
                            title="Toggle dark mode"
                            style="cursor: pointer">
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

                        <!-- PROFILE DROPDOWN -->
                        <div class="dropdown">

                            <button type="button"
                                class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm">
                                    <asp:Label ID="lblTopInitials" runat="server" Text="MH"></asp:Label>
                                </span>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu"
                                style="min-width: 190px">

                                <a class="dropdown-item rounded-3" href="profile.aspx">
                                    <i class="bi bi-person me-2"></i>
                                    My Profile
                                </a>

                                <a class="dropdown-item rounded-3" href="settings.aspx">
                                    <i class="bi bi-gear me-2"></i>
                                    Settings
                                </a>

                                <hr class="my-1" />

                                <a class="dropdown-item rounded-3 text-danger" href="../Home/SignIn_up.aspx">
                                    <i class="bi bi-box-arrow-right me-2"></i>
                                    Logout
                                </a>

                            </div>

                        </div>

                    </div>

                </div>
                <!-- /TOPBAR -->

                <!-- PAGE HEADING -->
                <div class="page-heading mb-4">
                    <span class="mp-page-eyebrow">
                        <i class="bi bi-ui-checks"></i>
                        Matching Requests
                    </span>
                    <h2 class="mt-3 mb-1">Mentee Matching Requests</h2>
                    <p class="mb-0">
                        Welcome,
                        <span class="mentor-welcome">
                            <asp:Label ID="lblMentorHeading" runat="server" Text="Mentor"></asp:Label>
                        </span>.
                        Review and manage requests submitted to you.
                    </p>
                </div>

                <!-- MESSAGE -->
                <asp:Panel ID="pnlMessage" runat="server"
                    Visible="false" CssClass="alert alert-info rounded-3 mb-3">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </asp:Panel>

                <!-- REQUEST TABLE -->
                <div class="request-panel">

                    <div class="request-toolbar">

                        <div class="mp-tabs">
                            <asp:LinkButton ID="btnAll" runat="server"
                                CssClass="mp-tab active" CommandArgument="All"
                                OnClick="Filter_Click" CausesValidation="false">All Requests</asp:LinkButton>

                            <asp:LinkButton ID="btnPending" runat="server"
                                CssClass="mp-tab" CommandArgument="Pending"
                                OnClick="Filter_Click" CausesValidation="false">Pending</asp:LinkButton>

                            <asp:LinkButton ID="btnAccepted" runat="server"
                                CssClass="mp-tab" CommandArgument="Accepted"
                                OnClick="Filter_Click" CausesValidation="false">Accepted</asp:LinkButton>

                            <asp:LinkButton ID="btnRejected" runat="server"
                                CssClass="mp-tab" CommandArgument="Rejected"
                                OnClick="Filter_Click" CausesValidation="false">Rejected</asp:LinkButton>
                        </div>

                        <div class="search-box">
                            <i class="bi bi-search"></i>
                            <asp:TextBox ID="txtRequestSearch" runat="server"
                                placeholder="Search mentee or goal..."
                                AutoPostBack="true"
                                OnTextChanged="txtRequestSearch_TextChanged"></asp:TextBox>
                        </div>

                    </div>

                    <div class="table-responsive">
                        <table class="table request-table">
                            <thead>
                                <tr>
                                    <th>Request ID</th>
                                    <th>Mentee Name</th>
                                    <th>Phone</th>
                                    <th>Education</th>
                                    <th>Preferred Domain</th>
                                    <th>Request Goal</th>
                                    <th>Request Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="rptRequests" runat="server"
                                    OnItemCommand="rptRequests_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <strong>REQ-<%#: Eval("RequestID") %></strong>
                                            </td>

                                            <td>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="mentee-avatar">
                                                        <%#: Eval("Initials") %>
                                                    </div>
                                                    <div>
                                                        <div class="mentee-name">
                                                            <%#: Eval("MenteeName") %>
                                                        </div>
                                                        <span class="mentee-email">
                                                            <%#: Eval("Email") %>
                                                        </span>
                                                        <span class="mentee-id">Mentee ID: <%#: Eval("MenteeID") %>
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>

                                            <td><%#: Eval("Phone") %></td>
                                            <td><%#: Eval("Education") %></td>
                                            <td><%#: Eval("PreferredDomain") %></td>

                                            <td style="max-width: 220px; white-space: normal;">
                                                <%#: Eval("Goal") %>
                                            </td>

                                            <td>
                                                <%# Eval("CreatedAt", "{0:dd MMM yyyy}") %>
                                            </td>

                                            <td>
                                                <span class='<%# GetStatusCss(Eval("Status")) %>'>
                                                    <%#: Eval("Status") %>
                                                </span>
                                            </td>

                                            <td>
                                                <asp:Panel ID="pnlActions" runat="server"
                                                    Visible='<%# Convert.ToString(Eval("Status")).Equals("Pending", StringComparison.OrdinalIgnoreCase) %>'>
                                                    <div class="d-flex gap-1">
                                                        <asp:LinkButton ID="btnAccept" runat="server"
                                                            CssClass="btn action-btn btn-accept"
                                                            CommandName="Accept"
                                                            CommandArgument='<%# Eval("RequestID") %>'
                                                            CausesValidation="false"
                                                            OnClientClick="return confirm('Accept this request?');">
                                                            <i class="bi bi-check-lg"></i> Accept
                                                        </asp:LinkButton>

                                                        <asp:LinkButton ID="btnReject" runat="server"
                                                            CssClass="btn action-btn btn-reject"
                                                            CommandName="Reject"
                                                            CommandArgument='<%# Eval("RequestID") %>'
                                                            CausesValidation="false"
                                                            OnClientClick="return confirm('Reject this request?');">
                                                            <i class="bi bi-x-lg"></i> Reject
                                                        </asp:LinkButton>
                                                    </div>
                                                </asp:Panel>

                                                <!-- Accepted request icon -->
                                                <asp:Panel ID="pnlAcceptedAction" runat="server"
                                                    Visible='<%# Convert.ToString(Eval("Status")).Equals("Accepted", StringComparison.OrdinalIgnoreCase) %>'>
                                                    <span class="request-result-icon accepted"
                                                        title="Request Accepted"
                                                        aria-label="Request Accepted">
                                                        <i class="bi bi-check-circle-fill"></i>
                                                    </span>
                                                </asp:Panel>

                                                <!-- Rejected request icon -->
                                                <asp:Panel ID="pnlRejectedAction" runat="server"
                                                    Visible='<%# Convert.ToString(Eval("Status")).Equals("Rejected", StringComparison.OrdinalIgnoreCase) %>'>
                                                    <span class="request-result-icon rejected"
                                                        title="Request Rejected"
                                                        aria-label="Request Rejected">
                                                        <i class="bi bi-x-circle-fill"></i>
                                                    </span>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                    <asp:Panel ID="pnlNoRequests" runat="server"
                        Visible="false" CssClass="empty-state">
                        <i class="bi bi-inbox"></i>
                        <h5>No matching requests found</h5>
                        <p class="mb-0">
                            There are no requests for the selected filter or search.
                        </p>
                    </asp:Panel>

                </div>

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