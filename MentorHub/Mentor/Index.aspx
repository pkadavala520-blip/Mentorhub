<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Dashboard | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link rel="stylesheet" href="../assets/css/dashboard.css?v=1" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />

    <style>
        /* =========================================================
           MENTORHUB DASHBOARD - ADDITIONAL FIXES
           (notification dropdown CSS lives in notification-dropdown.css)
           ========================================================= */

        /* PROFILE MENU (not part of the shared notification file) */
        .mp-topbar .dropdown > .btn {
            border: 0;
            background: transparent;
            box-shadow: none;
            line-height: 0;
            padding: 0;
        }

            .mp-topbar .dropdown > .btn:focus,
            .mp-topbar .dropdown > .btn:focus-visible,
            .mp-topbar .dropdown > .btn.show {
                outline: none;
                box-shadow: none;
                border: 0;
                background: transparent;
            }

        .mp-topbar .mp-dropdown-menu {
            z-index: 1060;
            min-width: 210px;
            max-width: calc(100vw - 2rem);
            max-height: min(70vh, 440px);
            overflow-x: hidden;
            overflow-y: auto;
            padding: .6rem;
            background: var(--mp-surface, #ffffff);
            color: var(--mp-ink, #202235);
            border: 1px solid var(--mp-border, rgba(87, 53, 232, .10));
            border-radius: 1rem;
            box-shadow: 0 24px 60px -20px rgba(40, 20, 120, .45);
        }

            .mp-topbar .mp-dropdown-menu .dropdown-item {
                display: flex;
                align-items: center;
                gap: .15rem;
                padding: .6rem .8rem;
                border-radius: .7rem;
                color: var(--mp-ink, #202235);
                font-size: .9rem;
                font-weight: 500;
                white-space: nowrap;
                background: transparent;
            }

                .mp-topbar .mp-dropdown-menu .dropdown-item:hover,
                .mp-topbar .mp-dropdown-menu .dropdown-item:focus {
                    background: rgba(87, 53, 232, .10);
                    color: var(--mp-primary, #5735e8);
                }

                .mp-topbar .mp-dropdown-menu .dropdown-item.text-danger {
                    color: #dc2626 !important;
                }

                    .mp-topbar .mp-dropdown-menu .dropdown-item.text-danger:hover {
                        background: rgba(239, 68, 68, .12);
                    }

            .mp-topbar .mp-dropdown-menu hr {
                margin: .35rem 0;
                border-color: var(--mp-border, rgba(87, 53, 232, .12));
                opacity: 1;
            }

        /* DARK MODE PROFILE MENU */
        body.mentor-dark .mp-topbar .mp-dropdown-menu,
        html.mp-dark .mp-topbar .mp-dropdown-menu {
            background: #181a36;
            color: #eef0ff;
            border-color: #2b2e51;
        }

            body.mentor-dark .mp-topbar .mp-dropdown-menu .dropdown-item,
            html.mp-dark .mp-topbar .mp-dropdown-menu .dropdown-item {
                color: #eef0ff;
            }

                body.mentor-dark .mp-topbar .mp-dropdown-menu .dropdown-item:hover,
                html.mp-dark .mp-topbar .mp-dropdown-menu .dropdown-item:hover {
                    background: #24204a;
                    color: #cbbcff;
                }

        /* ONE ROUND PROFILE PHOTO */
        .mentor-shell .mp-avatar,
        .mentor-shell .mp-mini-profile .mp-avatar,
        .mentor-shell .mp-settings-avatar {
            box-shadow: none;
        }

        .mp-mini-photo,
        .top-profile-photo {
            position: relative;
            width: 42px;
            height: 42px;
            min-width: 42px;
            flex: 0 0 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
            border-radius: 50%;
            background: #eeeaff;
            box-shadow: none;
        }

            .mp-mini-photo > img,
            .top-profile-photo > img {
                position: absolute;
                inset: 0;
                z-index: 2;
                display: block;
                width: 100%;
                height: 100%;
                object-fit: cover;
                border: 0;
                border-radius: 50%;
                box-shadow: none;
            }

            .mp-mini-photo > .mp-avatar,
            .top-profile-photo > .mp-avatar {
                position: absolute;
                inset: 0;
                z-index: 1;
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
            }

        .mp-avatar img,
        img.mp-avatar.profile-photo {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border: 0;
            border-radius: 50%;
            box-shadow: none;
            display: block;
        }

        img.mp-avatar.profile-photo {
            width: 38px;
            height: 38px;
            padding: 0;
        }

        .mp-avatar {
            overflow: hidden;
        }

        /* DASHBOARD ADDITIONAL STYLES */
        .db-date {
            display: inline-block;
            margin-top: 12px;
            font-size: .9rem;
            opacity: .9;
        }

            .db-date i {
                margin-right: 6px;
            }

        .db-session-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 18px;
            font-size: .88rem;
        }

            .db-session-meta span {
                display: inline-flex;
                align-items: center;
                gap: 6px;
            }

        .db-countdown {
            margin-top: 16px;
            font-weight: 600;
        }

        .db-up-item {
            display: flex;
            align-items: center;
            gap: 13px;
            padding: 13px 0;
            border-bottom: 1px solid rgba(120, 120, 120, .12);
        }

            .db-up-item:last-child {
                border-bottom: 0;
            }

        .db-up-date {
            width: 52px;
            min-width: 52px;
            height: 56px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: rgba(109, 75, 255, .10);
            color: var(--mp-primary, #6046e8);
        }

            .db-up-date small {
                font-size: .7rem;
                text-transform: uppercase;
            }

            .db-up-date b {
                font-size: 1.2rem;
                line-height: 1.2;
            }

        .db-up-text {
            min-width: 0;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

            .db-up-text strong {
                overflow-wrap: anywhere;
            }

            .db-up-text span {
                color: var(--mp-muted, #7d829a);
                font-size: .8rem;
            }

        .db-empty {
            padding: 28px 12px;
            text-align: center;
            color: var(--mp-muted, #7d829a);
        }

            .db-empty > i {
                display: block;
                margin-bottom: 10px;
                font-size: 2rem;
            }

            .db-empty strong {
                display: block;
                margin-bottom: 5px;
            }

            .db-empty p {
                margin-bottom: 0;
                font-size: .85rem;
            }

        .db-req-item {
            padding: 13px 8px;
        }

        .db-timeline-item {
            position: relative;
            padding: 0 0 18px 22px;
            border-left: 2px solid rgba(109, 75, 255, .18);
        }

            .db-timeline-item:last-child {
                border-left-color: transparent;
                padding-bottom: 0;
            }

            .db-timeline-item:before {
                content: "";
                position: absolute;
                left: -6px;
                top: 4px;
                width: 10px;
                height: 10px;
                border-radius: 50%;
                background: #6d4bff;
            }

            .db-timeline-item p {
                font-size: .88rem;
            }

        @media (max-width: 767px) {
            .mp-topbar .mp-dropdown-menu {
                min-width: 200px;
            }

            .db-session-meta {
                flex-direction: column;
                gap: 9px;
            }

            .db-hero-btn {
                font-size: .82rem;
            }
        }
    </style>
</head>

<body class="mentor-shell" data-page="dashboard">

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

                    <a class="nav-link active" href="index.aspx">
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
                        <span class="mp-avatar sm">
                            <asp:Label ID="lblSidebarInitials" runat="server" Text="M"></asp:Label>
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

                    <div class="d-flex align-items-center gap-3">

                        <button class="btn btn-outline-secondary sidebar-toggle-btn"
                            type="button"
                            data-sidebar-toggle
                            aria-label="Toggle navigation menu"
                            aria-expanded="false">
                            <i class="bi bi-list"></i>
                        </button>

                        <div class="mp-search d-none d-md-block">
                            <i class="bi bi-search"></i>
                            <input type="text" placeholder="Search mentees, requests, sessions…" />
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


                        <!-- PROFILE MENU -->
                        <div class="dropdown">

                            <button class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                type="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                aria-label="Open profile menu">

                                <span class="mp-avatar sm">
                                    <asp:Label ID="lblTopInitials" runat="server" Text="M"></asp:Label>
                                </span>

                            </button>

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu mp-menu-sm">

                                <a class="dropdown-item" href="profile.aspx">
                                    <i class="bi bi-person me-2"></i>My Profile
                            </a>

                                <a class="dropdown-item" href="settings.aspx">
                                    <i class="bi bi-gear me-2"></i>Settings
                            </a>

                                <hr />

                                <a class="dropdown-item text-danger" href="../Home/SignIn_up.aspx">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout
                            </a>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- HERO -->
                <div class="mp-hero db-hero mb-4 fade-in">

                    <div class="mp-hero-content d-flex flex-wrap justify-content-between align-items-center gap-3">

                        <div>

                            <span class="mp-page-eyebrow"
                                style="background: rgba(255,255,255,0.18); color: #fff;">

                                <i class="bi bi-stars"></i>
                                Your mentor workspace

                        </span>

                            <h2 class="fw-bold mt-3 mb-1">

                                <asp:Label ID="Label1"
                                    runat="server"
                                    Text="Welcome back"
                                    data-mentor-welcome="true">
                            </asp:Label>

                            </h2>

                            <p class="mb-0" style="opacity: .9;">
                                Here's what's happening with your mentees today.
                       
                            </p>

                            <span class="db-date">
                                <i class="bi bi-calendar3"></i>
                                <asp:Label ID="lblToday" runat="server"></asp:Label>
                            </span>

                        </div>

                        <div class="d-flex gap-2 flex-wrap">

                            <a href="requests.aspx"
                                class="mp-btn db-hero-btn"
                                style="background: rgba(255,255,255,0.16); color: #fff;">

                                <i class="bi bi-ui-checks"></i>
                                Review Requests

                        </a>

                            <a href="schedule.aspx"
                                class="mp-btn db-hero-btn"
                                style="background: #fff; color: var(--mp-primary);">

                                <i class="bi bi-calendar2-plus"></i>
                                View Schedule

                        </a>

                        </div>

                    </div>

                </div>


                <!-- STATISTICS -->
                <div class="row g-4 mb-4 mp-stagger">

                    <div class="col-lg-4 col-md-6 fade-in">
                        <div class="mp-stat db-stat s-indigo">

                            <div class="mp-stat-icon mp-bg-indigo">
                                <i class="bi bi-people-fill"></i>
                            </div>

                            <div>
                                <div class="mp-stat-value">
                                    <asp:Label ID="lblMentees" runat="server" Text="0"></asp:Label>
                                </div>
                                <div class="mp-stat-label">My Mentees</div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 fade-in">
                        <div class="mp-stat db-stat s-sky">

                            <div class="mp-stat-icon mp-bg-sky">
                                <i class="bi bi-calendar2-event-fill"></i>
                            </div>

                            <div>
                                <div class="mp-stat-value">
                                    <asp:Label ID="lblUpcomingSessions" runat="server" Text="0"></asp:Label>
                                </div>
                                <div class="mp-stat-label">Upcoming Sessions</div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 fade-in">
                        <div class="mp-stat db-stat s-amber">

                            <div class="mp-stat-icon mp-bg-amber">
                                <i class="bi bi-hourglass-split"></i>
                            </div>

                            <div>
                                <div class="mp-stat-value">
                                    <asp:Label ID="lblPendingRequests" runat="server" Text="0"></asp:Label>
                                </div>
                                <div class="mp-stat-label">Pending Requests</div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 fade-in">
                        <div class="mp-stat db-stat s-green">

                            <div class="mp-stat-icon mp-bg-green">
                                <i class="bi bi-check2-circle"></i>
                            </div>

                            <div>
                                <div class="mp-stat-value">
                                    <asp:Label ID="lblCompletedSessions" runat="server" Text="0"></asp:Label>
                                </div>
                                <div class="mp-stat-label">Completed Sessions</div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 fade-in">
                        <div class="mp-stat db-stat s-pink">

                            <div class="mp-stat-icon mp-bg-pink">
                                <i class="bi bi-star-fill"></i>
                            </div>

                            <div>
                                <div class="mp-stat-value">
                                    <asp:Label ID="lblAverageRating" runat="server" Text="0.0"></asp:Label>
                                </div>
                                <div class="mp-stat-label">Average Rating</div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 fade-in">
                        <div class="mp-card db-card db-quick p-4 h-100 d-flex flex-column justify-content-center">

                            <span class="text-muted small mb-2">Quick actions</span>

                            <div class="d-flex flex-wrap gap-2">

                                <a href="add-slot.aspx" class="mp-btn mp-btn-soft btn-sm">
                                    <i class="bi bi-plus-lg"></i>
                                    Add Slot
                            </a>

                                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm">
                                    <i class="bi bi-chat-dots"></i>
                                    Messages
                            </a>

                            </div>

                        </div>
                    </div>

                </div>


                <!-- CURRENT SESSION AND UPCOMING SESSIONS -->
                <div class="row g-4 mb-4">

                    <!-- CURRENT SESSION -->
                    <div class="col-lg-7 fade-in">

                        <div class="mp-card db-session p-4 h-100">

                            <asp:Panel ID="pnlCurrentSession" runat="server" Visible="false">

                                <span class="db-live">Current session</span>

                                <div class="db-session-name">
                                    <asp:Label ID="lblCurSessionName" runat="server"></asp:Label>
                                </div>

                                <div style="opacity: .9; font-size: .9rem;">
                                    <asp:Label ID="lblCurSessionStatus" runat="server"></asp:Label>
                                </div>

                                <div class="db-session-meta">

                                    <span>
                                        <i class="bi bi-person-fill"></i>
                                        <asp:Label ID="lblCurSessionMentee" runat="server"></asp:Label>
                                    </span>

                                    <span>
                                        <i class="bi bi-calendar3"></i>
                                        <asp:Label ID="lblCurSessionDate" runat="server"></asp:Label>
                                    </span>

                                    <span>
                                        <i class="bi bi-clock"></i>
                                        <asp:Label ID="lblCurSessionTime" runat="server"></asp:Label>
                                    </span>

                                </div>

                                <div class="db-countdown">
                                    <i class="bi bi-hourglass-split"></i>
                                    <asp:Label ID="lblCurSessionCountdown" runat="server"></asp:Label>
                                </div>

                            </asp:Panel>


                            <asp:Panel ID="pnlNoSession"
                                runat="server"
                                Visible="true"
                                CssClass="text-center py-4">

                                <span class="db-live">Current session</span>

                                <div class="db-session-name">
                                    No session scheduled
                           
                                </div>

                                <p style="opacity: .85;" class="mb-3">
                                    Add a time slot so mentees can book you.
                           
                                </p>

                                <a href="add-slot.aspx"
                                    class="mp-btn db-hero-btn"
                                    style="background: #fff; color: var(--mp-primary);">

                                    <i class="bi bi-plus-lg"></i>
                                    Add Slot

                            </a>

                            </asp:Panel>

                        </div>

                    </div>


                    <!-- UPCOMING SESSIONS -->
                    <div class="col-lg-5 fade-in">

                        <div class="mp-card db-card p-4 h-100">

                            <div class="d-flex justify-content-between align-items-center mb-3">

                                <h5 class="db-card-title">
                                    <i class="bi bi-calendar2-week"></i>
                                    Upcoming Sessions
                            </h5>

                                <a href="schedule.aspx" class="small">View all</a>

                            </div>

                            <asp:Repeater ID="rptUpcoming" runat="server">

                                <ItemTemplate>

                                    <div class="db-up-item">

                                        <div class="db-up-date">
                                            <small><%#: Eval("Month") %></small>
                                            <b><%#: Eval("Day") %></b>
                                        </div>

                                        <div class="db-up-text">

                                            <strong>
                                                <%#: Eval("SessionName") %>
                                        </strong>

                                            <span>
                                                <%#: Eval("MenteeName") %>
                                            &bull;
                                           
                                                <%#: Eval("TimeText") %>
                                        </span>

                                        </div>

                                    </div>

                                </ItemTemplate>

                            </asp:Repeater>

                            <asp:Panel ID="pnlNoUpcoming"
                                runat="server"
                                Visible="false"
                                CssClass="db-empty">

                                <i class="bi bi-calendar-x"></i>

                                <strong>Nothing else coming up</strong>

                                <p>Your next sessions will appear here.</p>

                            </asp:Panel>

                        </div>

                    </div>

                </div>


                <!-- CHART AND RECENT REQUESTS -->
                <div class="row g-4">

                    <!-- SESSION SUMMARY CHART -->
                    <div class="col-lg-7 fade-in">

                        <div class="mp-card db-card p-4 h-100">

                            <div class="d-flex justify-content-between align-items-center mb-3">

                                <h5 class="db-card-title">
                                    <i class="bi bi-graph-up-arrow"></i>
                                    Session Summary
                            </h5>

                                <span class="mp-chip accepted">Last 6 months
                            </span>

                            </div>

                            <!-- Show chart only when backend finds session data -->
                            <asp:Panel ID="pnlChart" runat="server" Visible="false">

                                <div class="db-chart-stats">
                                    <div class="db-chart-stat" id="statTotal">
                                        <small>Total sessions</small>
                                        <b id="chartTotal">0</b>
                                        <em>Last 6 months</em>
                                    </div>
                                    <div class="db-chart-stat" id="statPeak">
                                        <small>Best month</small>
                                        <b id="chartPeak">-</b>
                                        <em id="chartPeakNote"></em>
                                    </div>
                                    <div class="db-chart-stat" id="statTrend">
                                        <small>This month</small>
                                        <b id="chartThis">0</b>
                                        <em id="chartTrend"></em>
                                    </div>
                                </div>

                                <div class="db-chart-wrap">
                                    <canvas id="mentorChart" height="180"></canvas>
                                </div>

                                <asp:HiddenField ID="hfChartLabels" runat="server" />
                                <asp:HiddenField ID="hfChartValues" runat="server" />

                            </asp:Panel>

                            <!-- Empty chart message -->
                            <asp:Panel ID="pnlNoChart"
                                runat="server"
                                Visible="true"
                                CssClass="db-empty">

                                <i class="bi bi-bar-chart-line"></i>

                                <strong>No session data yet</strong>

                                <p>
                                    The graph appears once you have sessions in the last 6 months.
                           
                                </p>

                            </asp:Panel>

                        </div>

                    </div>


                    <!-- RECENT REQUESTS -->
                    <div class="col-lg-5 fade-in">

                        <div class="mp-card db-card p-4 h-100">

                            <div class="d-flex justify-content-between align-items-center mb-3">

                                <h5 class="db-card-title">
                                    <i class="bi bi-inbox"></i>
                                    Recent Requests
                            </h5>

                                <a href="requests.aspx" class="small">View all</a>

                            </div>

                            <ul class="list-group list-group-flush">

                                <asp:Repeater ID="rptRecentRequests" runat="server">

                                    <ItemTemplate>

                                        <li class="list-group-item db-req-item">

                                            <div class="d-flex justify-content-between align-items-center">

                                                <strong>
                                                    <%#: Eval("FullName") %>
                                            </strong>

                                                <span class="badge bg-success">
                                                    <%#: Eval("Status") %>
                                            </span>

                                            </div>

                                            <small class="text-muted">
                                                <%#: Eval("RequestDate") %>
                                        </small>

                                        </li>

                                    </ItemTemplate>

                                </asp:Repeater>

                            </ul>

                            <asp:Panel ID="pnlNoRequests"
                                runat="server"
                                Visible="false"
                                CssClass="db-empty">

                                <i class="bi bi-inbox"></i>

                                <strong>No recent requests</strong>

                                <p>New mentee requests will show up here.</p>

                            </asp:Panel>

                        </div>

                    </div>

                </div>


                <!-- RECENT ACTIVITY -->
                <div class="row g-4 mt-1">

                    <div class="col-12 fade-in">

                        <div class="mp-card db-card p-4">

                            <h5 class="db-card-title mb-3">
                                <i class="bi bi-activity"></i>
                                Recent Activity
                        </h5>

                            <div class="mp-timeline">

                                <asp:Repeater ID="rptActivity" runat="server">

                                    <ItemTemplate>

                                        <div class="db-timeline-item">

                                            <strong>
                                                <%#: Eval("ActivityTitle") %>
                                        </strong>

                                            <p class="text-muted mb-1">
                                                <%#: Eval("ActivityDescription") %>
                                            </p>

                                            <small class="text-muted">
                                                <%#: Eval("ActivityDate") %>
                                        </small>

                                        </div>

                                    </ItemTemplate>

                                </asp:Repeater>

                            </div>

                            <asp:Panel ID="pnlNoActivity"
                                runat="server"
                                Visible="false"
                                CssClass="db-empty">

                                <i class="bi bi-activity"></i>

                                <strong>No recent activity</strong>

                                <p>Your latest actions will appear here.</p>

                            </asp:Panel>

                        </div>

                    </div>

                </div>

            </main>

        </div>

    </form>


    <!-- SCRIPTS -->
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/chartjs/chart.umd.js"></script>
    <script src="../assets/js/mentor-app.js?v=1"></script>


    <!-- DYNAMIC SESSION CHART -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            var chartElement = document.getElementById("mentorChart");

            // Chart canvas is not rendered when there is no session data.
            if (!chartElement || typeof Chart === "undefined") {
                return;
            }

            var labelsField = document.getElementById("<%= hfChartLabels.ClientID %>");
        var valuesField = document.getElementById("<%= hfChartValues.ClientID %>");

        if (!labelsField || !valuesField) {
            return;
        }

        var labels = [];
        var values = [];

        try {
            labels = JSON.parse(labelsField.value || "[]");
            values = JSON.parse(valuesField.value || "[]");
        }
        catch (e) {
            console.error("Unable to read session chart data.", e);
            return;
        }

        if (!labels.length || !values.length) {
            return;
        }

        var ctx = chartElement.getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 260);
        gradient.addColorStop(0, "rgba(99,102,241,0.35)");
        gradient.addColorStop(1, "rgba(168,85,247,0.02)");

        new Chart(chartElement, {

            type: "line",

            data: {
                labels: labels,

                datasets: [{
                    label: "Sessions",
                    data: values,
                    borderColor: "#6d4bff",
                    backgroundColor: gradient,
                    pointBackgroundColor: "#ffffff",
                    pointBorderColor: "#6d4bff",
                    pointBorderWidth: 3,
                    pointRadius: 5,
                    pointHoverRadius: 8,
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4
                }]
            },

            options: {

                responsive: true,

                interaction: {
                    intersect: false,
                    mode: "index"
                },

                animation: {
                    duration: 1200,
                    easing: "easeOutQuart"
                },

                plugins: {

                    legend: {
                        display: false
                    },

                    tooltip: {
                        backgroundColor: "#1f2340",
                        padding: 12,
                        cornerRadius: 10,
                        displayColors: false
                    }

                },

                scales: {

                    y: {
                        beginAtZero: true,
                        ticks: {
                            precision: 0
                        },
                        grid: {
                            color: "rgba(79,70,229,0.08)"
                        }
                    },

                    x: {
                        grid: {
                            display: false
                        }
                    }

                }

            }

        });

    });
</script>


        <!-- PROFILE PHOTO SYNC -->
    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>

    <!-- KEEP EXACTLY ONE PHOTO IN SIDEBAR AND TOPBAR -->
    <script>
        (function () {
            function keepOnePhoto() {
                var boxes = document.querySelectorAll(".mp-mini-profile, .mp-topbar .dropdown > button");
                boxes.forEach(function (box) {
                    var imgs = box.querySelectorAll("img");
                    for (var i = 1; i < imgs.length; i++) {
                        imgs[i].parentNode.removeChild(imgs[i]);
                    }
                    if (imgs.length > 0) {
                        box.querySelectorAll(".mp-avatar").forEach(function (avatar) {
                            if (avatar.tagName !== "IMG" && !avatar.contains(imgs[0])) {
                                avatar.style.display = "none";
                            }
                        });
                    }
                });
            }
            window.addEventListener("load", function () {
                keepOnePhoto();
                setTimeout(keepOnePhoto, 400);
                setTimeout(keepOnePhoto, 1200);
            });
        })();
    </script>

    <!-- SESSION SUMMARY CHART (the ONLY chart script) -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            var chartElement = document.getElementById("mentorChart");
            if (!chartElement || typeof Chart === "undefined") { return; }

            var labelsField = document.getElementById("<%= hfChartLabels.ClientID %>");
            var valuesField = document.getElementById("<%= hfChartValues.ClientID %>");
            if (!labelsField || !valuesField) { return; }

            var labels = [], values = [];
            try {
                labels = JSON.parse(labelsField.value || "[]");
                values = JSON.parse(valuesField.value || "[]");
            } catch (e) { return; }
            if (!labels.length || !values.length) { return; }

            var dark = document.body.classList.contains("mentor-dark");
            var reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

            /* ---------- summary numbers ---------- */
            var total = values.reduce(function (a, b) { return a + b; }, 0);
            var peakValue = Math.max.apply(null, values);
            var peakIndex = values.indexOf(peakValue);
            var lastIndex = values.length - 1;
            var thisVal = values[lastIndex];
            var prevVal = lastIndex > 0 ? values[lastIndex - 1] : 0;

            function countUp(el, to, ms) {
                if (!el) return;
                var start = null;
                function step(t) {
                    if (start === null) start = t;
                    var p = Math.min((t - start) / ms, 1);
                    el.textContent = Math.round(to * (1 - Math.pow(1 - p, 3)));
                    if (p < 1) requestAnimationFrame(step);
                }
                requestAnimationFrame(step);
            }

            countUp(document.getElementById("chartTotal"), total, 1000);
            countUp(document.getElementById("chartThis"), thisVal, 1000);

            var peakEl = document.getElementById("chartPeak");
            var peakNote = document.getElementById("chartPeakNote");
            if (peakEl) peakEl.textContent = labels[peakIndex];
            if (peakNote) peakNote.textContent = peakValue + (peakValue === 1 ? " session" : " sessions");

            var trendEl = document.getElementById("chartTrend");
            if (trendEl) {
                if (prevVal === 0 && thisVal === 0) {
                    trendEl.textContent = "No change";
                } else if (prevVal === 0) {
                    trendEl.innerHTML = '<span class="up">&#9650; New activity</span>';
                } else {
                    var pct = Math.round(((thisVal - prevVal) / prevVal) * 100);
                    if (pct > 0) trendEl.innerHTML = '<span class="up">&#9650; ' + pct + '% vs last month</span>';
                    else if (pct < 0) trendEl.innerHTML = '<span class="down">&#9660; ' + Math.abs(pct) + '% vs last month</span>';
                    else trendEl.textContent = "Same as last month";
                }
            }

            /* ---------- draw-in progress (0 -> 1) ---------- */
            var progress = reduceMotion ? 1 : 0;

            function easeOut(t) { return 1 - Math.pow(1 - t, 4); }

            /* ---------- gradients ---------- */
            function lineGradient(context) {
                var area = context.chart.chartArea;
                if (!area) return "#6d4bff";
                var g = context.chart.ctx.createLinearGradient(area.left, 0, area.right, 0);
                g.addColorStop(0, "#38bdf8");
                g.addColorStop(0.5, "#6d4bff");
                g.addColorStop(1, "#d946ef");
                return g;
            }

            function areaGradient(context) {
                var area = context.chart.chartArea;
                if (!area) return "rgba(109,75,255,0.15)";
                var g = context.chart.ctx.createLinearGradient(0, area.top, 0, area.bottom);
                g.addColorStop(0, "rgba(109,75,255,0.34)");
                g.addColorStop(0.55, "rgba(168,85,247,0.10)");
                g.addColorStop(1, "rgba(56,189,248,0.00)");
                return g;
            }

            /* ---------- plugins (order matters) ---------- */

            // 1) reveals the line from left to right
            var drawInPlugin = {
                id: "dbDrawIn",
                beforeDatasetsDraw: function (chart) {
                    var a = chart.chartArea, c = chart.ctx;
                    c.save();
                    c.beginPath();
                    c.rect(a.left - 12, a.top - 30, (a.right - a.left + 24) * progress, a.bottom - a.top + 60);
                    c.clip();
                },
                afterDatasetsDraw: function (chart) {
                    chart.ctx.restore();
                }
            };

            // 2) glow under the line
            var glowPlugin = {
                id: "dbGlow",
                beforeDatasetDraw: function (chart) {
                    chart.ctx.save();
                    chart.ctx.shadowColor = "rgba(109,75,255,0.55)";
                    chart.ctx.shadowBlur = 18;
                    chart.ctx.shadowOffsetY = 9;
                },
                afterDatasetDraw: function (chart) {
                    chart.ctx.restore();
                }
            };

            // 3) dashed crosshair on hover
            var crosshairPlugin = {
                id: "dbCrosshair",
                afterDatasetsDraw: function (chart) {
                    var tip = chart.tooltip;
                    if (!tip || !tip.getActiveElements().length) return;

                    var x = tip.getActiveElements()[0].element.x;
                    var a = chart.chartArea, c = chart.ctx;

                    var g = c.createLinearGradient(0, a.top, 0, a.bottom);
                    g.addColorStop(0, "rgba(109,75,255,0.9)");
                    g.addColorStop(1, "rgba(109,75,255,0)");

                    c.save();
                    c.beginPath();
                    c.setLineDash([5, 5]);
                    c.lineWidth = 1.5;
                    c.strokeStyle = g;
                    c.moveTo(x, a.top);
                    c.lineTo(x, a.bottom);
                    c.stroke();
                    c.restore();
                }
            };

            // 4) pulsing live dot on the latest month + gold peak badge
            var markerPlugin = {
                id: "dbMarkers",
                afterDatasetsDraw: function (chart) {
                    if (progress < 1) return;

                    var meta = chart.getDatasetMeta(0);
                    var c = chart.ctx;

                    // live dot
                    var last = meta.data[lastIndex];
                    if (last) {
                        var t = (Date.now() % 1800) / 1800;

                        c.save();
                        c.beginPath();
                        c.arc(last.x, last.y, 7 + t * 13, 0, Math.PI * 2);
                        c.fillStyle = "rgba(217,70,239," + (0.35 * (1 - t)) + ")";
                        c.fill();
                        c.restore();

                        c.save();
                        c.beginPath();
                        c.arc(last.x, last.y, 6, 0, Math.PI * 2);
                        c.fillStyle = "#d946ef";
                        c.fill();
                        c.lineWidth = 3;
                        c.strokeStyle = "#ffffff";
                        c.stroke();
                        c.restore();
                    }

                    // peak badge (skip if the peak is the live dot)
                    if (peakValue > 0 && peakIndex !== lastIndex) {
                        var pt = meta.data[peakIndex];
                        if (!pt) return;

                        c.save();
                        c.beginPath();
                        c.arc(pt.x, pt.y, 10, 0, Math.PI * 2);
                        c.strokeStyle = "rgba(245,158,11,0.95)";
                        c.lineWidth = 2.5;
                        c.stroke();
                        c.restore();

                        var text = "Peak " + peakValue;
                        c.save();
                        c.font = "700 11px Poppins, sans-serif";
                        var w = c.measureText(text).width + 18, h = 22;
                        var bx = Math.min(Math.max(pt.x - w / 2, chart.chartArea.left), chart.chartArea.right - w);
                        var by = Math.max(pt.y - 38, chart.chartArea.top - 6);

                        c.fillStyle = "#f59e0b";
                        c.beginPath();
                        if (c.roundRect) { c.roundRect(bx, by, w, h, 11); } else { c.rect(bx, by, w, h); }
                        c.fill();

                        c.fillStyle = "#ffffff";
                        c.textAlign = "center";
                        c.textBaseline = "middle";
                        c.fillText(text, bx + w / 2, by + h / 2 + 1);
                        c.restore();
                    }
                }
            };

            /* ---------- chart ---------- */
            var chart = new Chart(chartElement, {

                type: "line",

                data: {
                    labels: labels,
                    datasets: [{
                        label: "Sessions",
                        data: values,
                        borderColor: lineGradient,
                        backgroundColor: areaGradient,
                        borderWidth: 4.5,
                        borderCapStyle: "round",
                        borderJoinStyle: "round",
                        fill: true,
                        tension: 0.45,
                        pointRadius: 0,
                        pointHoverRadius: 9,
                        pointHoverBorderWidth: 5,
                        pointHoverBackgroundColor: "#ffffff",
                        pointHoverBorderColor: "#6d4bff"
                    }]
                },

                options: {
                    responsive: true,
                    animation: false,
                    layout: { padding: { top: 28, right: 14 } },
                    interaction: { intersect: false, mode: "index" },

                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: "#1f2340",
                            titleColor: "#c9c4ff",
                            bodyColor: "#ffffff",
                            titleFont: { family: "Poppins", size: 11, weight: "600" },
                            bodyFont: { family: "Poppins", size: 14, weight: "700" },
                            padding: { top: 10, bottom: 10, left: 14, right: 14 },
                            cornerRadius: 12,
                            displayColors: false,
                            caretSize: 7,
                            callbacks: {
                                label: function (item) {
                                    var v = item.parsed.y;
                                    return v + (v === 1 ? " session" : " sessions");
                                }
                            }
                        }
                    },

                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                precision: 0,
                                padding: 8,
                                color: dark ? "#a4a9c4" : "#7d829a",
                                font: { family: "Poppins", size: 11 }
                            },
                            border: { display: false },
                            grid: {
                                color: dark ? "rgba(148,138,255,0.12)" : "rgba(109,75,255,0.08)",
                                drawTicks: false
                            }
                        },
                        x: {
                            ticks: {
                                padding: 8,
                                color: dark ? "#a4a9c4" : "#7d829a",
                                font: { family: "Poppins", size: 11, weight: "500" }
                            },
                            border: { display: false },
                            grid: { display: false }
                        }
                    },

                    onHover: function (evt, active) {
                        evt.native.target.style.cursor = active.length ? "pointer" : "default";
                    }
                },

                plugins: [drawInPlugin, glowPlugin, crosshairPlugin, markerPlugin]
            });

            /* ---------- animation loop: draw-in, then the pulsing dot ---------- */
            var startTime = null;

            function frame(now) {
                if (startTime === null) startTime = now;

                if (progress < 1) {
                    progress = easeOut(Math.min((now - startTime) / 1700, 1));
                    if (progress > 0.999) progress = 1;
                }

                chart.draw();

                if (!reduceMotion) { requestAnimationFrame(frame); }
            }

            requestAnimationFrame(frame);

            /* ---------- summary cards highlight points ---------- */
            function focusPoint(index) {
                chart.setActiveElements([{ datasetIndex: 0, index: index }]);
                chart.tooltip.setActiveElements([{ datasetIndex: 0, index: index }], { x: 0, y: 0 });
                chart.update("none");
            }

            function clearPoint() {
                chart.setActiveElements([]);
                chart.tooltip.setActiveElements([], { x: 0, y: 0 });
                chart.update("none");
            }

            var statPeak = document.getElementById("statPeak");
            var statTrend = document.getElementById("statTrend");

            if (statPeak) {
                statPeak.addEventListener("mouseenter", function () { focusPoint(peakIndex); });
                statPeak.addEventListener("mouseleave", clearPoint);
            }

            if (statTrend) {
                statTrend.addEventListener("mouseenter", function () { focusPoint(lastIndex); });
                statTrend.addEventListener("mouseleave", clearPoint);
            }
        });
    </script>

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