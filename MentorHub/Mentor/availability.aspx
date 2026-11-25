<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="availability.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Availability" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Availability | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link rel="stylesheet" href="../assets/css/notification-dropdown.css?v=2" />

    <style>
        /* AVAILABILITY ICON */
        .availability-icon {
            width: 48px;
            height: 48px;
            min-width: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #6046e8, #9638e8);
            color: #fff;
            border: 1px solid rgba(255,255,255,.25);
            border-radius: 12px;
            font-size: 21px;
            box-shadow: 0 5px 14px rgba(105,65,220,.22);
            transition: all .3s ease;
        }

            .availability-icon:hover {
                transform: translateY(-3px) scale(1.05);
                background: linear-gradient(135deg, #5035d5, #8128d6);
                box-shadow: 0 8px 20px rgba(105,65,220,.32);
            }

            .availability-icon i { color: #fff; }

        .availability-page-heading { margin-bottom: 28px; }

        /* AVAILABILITY CARD */
        .availability-card {
            height: 100%;
            min-height: 225px;
            padding: 22px;
            background: #fff;
            border: 1px solid #e8eaf0;
            border-radius: 16px;
            transition: all .3s ease;
        }

            .availability-card:hover {
                transform: translateY(-4px);
                border-color: #c9baf9;
                box-shadow: 0 10px 28px rgba(96,70,232,.10);
            }

        .availability-day { color: #20243a; font-size: 16px; font-weight: 700; margin-bottom: 4px; }
        .availability-time { color: #198754; font-size: 14px; font-weight: 600; }
        .availability-status { color: #198754; font-size: 12px; font-weight: 600; }

        .availability-count {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 10px 15px;
            background: #f0ecff;
            color: #6845dc;
            border: 1px solid #e1d8ff;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 600;
        }

        /* EDIT AND DELETE */
        .availability-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            padding-top: 15px;
            border-top: 1px solid #edf0f5;
        }

        .availability-edit-btn,
        .availability-delete-btn {
            flex: 1;
            min-height: 38px;
            padding: 8px 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            transition: all .25s ease;
            cursor: pointer;
        }

        .availability-edit-btn { color: #6845dc; background: #f4f0ff; border: 1px solid #dcd0ff; }

            .availability-edit-btn:hover {
                color: #fff;
                background: linear-gradient(135deg, #6046e8, #9638e8);
                border-color: #6046e8;
                box-shadow: 0 4px 12px rgba(96,70,232,.20);
                transform: translateY(-2px);
            }

        .availability-delete-btn { color: #dc3545; background: #fff5f5; border: 1px solid #f3d0d3; }

            .availability-delete-btn:hover {
                color: #fff;
                background: #dc3545;
                border-color: #dc3545;
                box-shadow: 0 4px 12px rgba(220,53,69,.15);
                transform: translateY(-2px);
            }

        /* EMPTY STATE */
        .availability-empty { padding: 55px 20px; text-align: center; }
        .availability-empty i { color: #9878ed; font-size: 52px; }

        /* SUCCESS MESSAGE */
        .availability-success {
            display: block;
            padding: 12px 16px;
            color: #146c43;
            background: #d1e7dd;
            border: 1px solid #badbcc;
            border-radius: 9px;
            font-size: 13px;
        }

        @media (max-width: 767px) {
            .availability-card { min-height: auto; padding: 18px; }
        }

        @media (max-width: 576px) {
            .availability-actions { gap: 8px; }
            .availability-edit-btn, .availability-delete-btn { font-size: 11px; padding: 8px; }
        }
    </style>

</head>

<body class="mentor-shell" data-page="availability">

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
                    <a class="nav-link" href="my-skills.aspx"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>

                    <div class="mp-nav-section-label">Mentoring</div>

                    <a class="nav-link active" href="availability.aspx" aria-current="page"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>

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

                    <a class="nav-link mp-danger" href="Logout.aspx">
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
                        <label class="mp-icon-btn" title="Toggle dark mode" style="cursor: pointer">
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

                        <!-- PROFILE DROPDOWN -->
                        <div class="dropdown">

                            <button type="button"
                                class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm" data-mini-avatar>DR</span>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu" style="min-width: 190px;">

                                <a class="dropdown-item rounded-3" href="profile.aspx">
                                    <i class="bi bi-person me-2"></i>
                                    My Profile
                                </a>

                                <a class="dropdown-item rounded-3" href="settings.aspx">
                                    <i class="bi bi-gear me-2"></i>
                                    Settings
                                </a>

                                <hr class="my-1" />

                                <a class="dropdown-item rounded-3 text-danger" href="Logout.aspx">
                                    <i class="bi bi-box-arrow-right me-2"></i>
                                    Logout
                                </a>

                            </div>
                        </div>

                    </div>
                </div>

                <!-- PAGE HEADING -->
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 availability-page-heading fade-in">

                    <div>
                        <span class="mp-page-eyebrow">
                            <i class="bi bi-calendar2-week"></i>
                            Availability
                        </span>

                        <h2 class="fw-bold mt-3 mb-1">Weekly availability calendar</h2>

                        <p class="text-muted mb-0">
                            Let mentees know exactly when you're free to connect.
                        </p>
                    </div>

                    <a href="add-slot.aspx" class="mp-btn mp-btn-primary">
                        <i class="bi bi-plus-lg"></i>
                        Add Slot
                    </a>

                </div>

                <!-- WEEKLY SCHEDULE -->
                <div class="mp-card p-4 fade-in">

                    <!-- SCHEDULE HEADER -->
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">

                        <div>
                            <h5 class="fw-semibold mb-1">Weekly Schedule</h5>
                            <p class="text-muted small mb-0">
                                Manage and view your saved mentoring availability.
                            </p>
                        </div>

                        <div class="availability-count">
                            <i class="bi bi-calendar-check me-1"></i>
                            <asp:Label ID="lblTotalSlots" runat="server" Text="0"></asp:Label>
                            Total Slots
                        </div>

                    </div>

                    <!-- STATUS MESSAGE -->
                    <asp:Label ID="lblStatus" runat="server" CssClass="d-block mb-3"></asp:Label>

                    <!-- EMPTY MESSAGE -->
                    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">

                        <div class="availability-empty">

                            <i class="bi bi-calendar-x"></i>

                            <h5 class="fw-semibold mt-3">No Availability Slots Yet</h5>

                            <p class="text-muted mb-4">
                                You haven't added any mentoring availability.
                                Add your available days and times to get started.
                            </p>

                            <a href="add-slot.aspx" class="mp-btn mp-btn-primary">
                                <i class="bi bi-plus-lg"></i>
                                Add Your First Slot
                            </a>

                        </div>

                    </asp:Panel>

                    <!-- DYNAMIC AVAILABILITY REPEATER -->
                    <asp:Repeater ID="rptAvailability"
                        runat="server"
                        OnItemCommand="rptAvailability_ItemCommand">

                        <HeaderTemplate>
                            <div class="row g-3">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <div class="col-md-6 col-lg-4">

                                <div class="availability-card">

                                    <!-- DAY -->
                                    <div class="d-flex align-items-center gap-3 mb-4">

                                        <div class="availability-icon">
                                            <i class="bi bi-calendar-check"></i>
                                        </div>

                                        <div>
                                            <div class="availability-day"><%#: Eval("DayName") %></div>
                                            <div class="small text-muted">Weekly Availability</div>
                                        </div>

                                    </div>

                                    <!-- TIME -->
                                    <div class="availability-time mb-3">
                                        <i class="bi bi-clock me-2"></i>
                                        <%# DateTime.Today.Add((TimeSpan)Eval("StartTime")).ToString("hh:mm tt") %>
                                        -
                                        <%# DateTime.Today.Add((TimeSpan)Eval("EndTime")).ToString("hh:mm tt") %>
                                    </div>

                                    <!-- STATUS -->
                                    <div class="availability-status mb-4">
                                        <i class="bi bi-check-circle-fill me-1"></i>
                                        Active
                                    </div>

                                    <!-- EDIT AND DELETE -->
                                    <div class="availability-actions">

                                        <a href='edit-slot.aspx?id=<%# Eval("AvailabilityID") %>'
                                            class="availability-edit-btn">
                                            <i class="bi bi-pencil-square"></i>
                                            Edit Slot
                                        </a>

                                        <asp:LinkButton
                                            ID="btnDelete"
                                            runat="server"
                                            CssClass="availability-delete-btn"
                                            CommandName="DeleteSlot"
                                            CommandArgument='<%# Eval("AvailabilityID") %>'
                                            OnClientClick="return confirm('Are you sure you want to delete this availability slot?');">
                                            <i class="bi bi-trash"></i>
                                            Delete
                                        </asp:LinkButton>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                        <FooterTemplate>
                            </div>
                        </FooterTemplate>

                    </asp:Repeater>

                </div>

                <!-- FOOTER -->
                <div class="text-center text-muted small mt-4">
                    MentorHub &copy; 2026 | Empowering Mentorship
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
