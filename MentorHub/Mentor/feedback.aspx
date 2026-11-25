<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Feedback" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Feedback | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />

    <style>
        /* =====================================================
           FEEDBACK PAGE THEME
        ===================================================== */

        :root {
            --fb-primary: #5735e8;
            --fb-primary-2: #7c5cff;
            --fb-soft: #f2efff;
            --fb-border: #eceaf3;
            --fb-ink: #25213a;
            --fb-muted: #77758a;
            --fb-card: #ffffff;
            --fb-star: #f59e0b;
        }

        body.mentor-dark {
            --fb-soft: #2d2745;
            --fb-border: #39334e;
            --fb-ink: #f2efff;
            --fb-muted: #b7b1ca;
            --fb-card: #211d32;
        }

        /* =====================================================
           FEEDBACK SUMMARY CARD
        ===================================================== */

        .feedback-summary {
            position: relative;
            overflow: hidden;
            background: var(--fb-card);
            border: 1px solid var(--fb-border);
            border-radius: 20px;
            transition: transform .4s cubic-bezier(.16,1,.3,1),
                        box-shadow .4s ease;
        }

        .feedback-summary::before {
            content: "";
            position: absolute;
            top: -70px;
            right: -70px;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            background: radial-gradient(circle,
                rgba(124,92,255,.22), transparent 70%);
            pointer-events: none;
        }

        .feedback-summary:hover {
            transform: translateY(-4px);
            box-shadow: 0 24px 46px -22px rgba(87,53,232,.45);
        }

        .feedback-average {
            font-size: 58px;
            font-weight: 800;
            line-height: 1.1;
            letter-spacing: -2px;
            background: linear-gradient(135deg,#5735e8,#d946ef);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .feedback-stars {
            color: var(--fb-star);
            font-size: 19px;
            letter-spacing: 3px;
        }

        .feedback-summary h6 {
            color: var(--fb-ink);
        }

        .feedback-summary hr {
            border-color: var(--fb-border);
            opacity: 1;
        }

        .feedback-rating-row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 16px;
            font-size: 12px;
            color: var(--fb-muted);
        }

        .feedback-bar {
            flex: 1;
            height: 9px;
            overflow: hidden;
            border-radius: 30px;
            background: var(--fb-soft);
        }

        .feedback-bar-fill {
            height: 100%;
            border-radius: 30px;
            background: linear-gradient(90deg,#38bdf8,#6d4bff,#d946ef);
            transform-origin: left;
            animation: fbGrow 1.2s cubic-bezier(.16,1,.3,1) both;
        }

        @keyframes fbGrow {
            from { transform: scaleX(0); }
            to   { transform: scaleX(1); }
        }

        .feedback-rating-row:hover .feedback-bar {
            box-shadow: 0 0 0 3px rgba(109,75,255,.15);
        }

        .feedback-count {
            width: 25px;
            text-align: right;
            font-weight: 600;
        }

        /* =====================================================
           REVIEW ITEMS
        ===================================================== */

        .review-item {
            position: relative;
            padding: 20px;
            margin-bottom: 12px;
            border: 1px solid var(--fb-border);
            border-radius: 16px;
            background: var(--fb-card);
            transition: transform .35s cubic-bezier(.16,1,.3,1),
                        box-shadow .35s ease,
                        border-color .25s ease,
                        background .25s ease;
        }

        .review-item::before {
            content: "";
            position: absolute;
            left: 0;
            top: 14px;
            bottom: 14px;
            width: 4px;
            border-radius: 0 4px 4px 0;
            background: linear-gradient(180deg,#6d4bff,#d946ef);
            transform: scaleY(.3);
            opacity: 0;
            transition: transform .35s ease, opacity .25s ease;
        }

        .review-item:hover {
            background: rgba(87,53,232,.04);
            border-color: rgba(109,75,255,.35);
            transform: translateX(5px);
            box-shadow: 0 14px 28px -16px rgba(87,53,232,.4);
        }

        .review-item:hover::before {
            transform: scaleY(1);
            opacity: 1;
        }

        .review-item:last-child {
            margin-bottom: 0;
        }

        .review-avatar {
            width: 46px;
            height: 46px;
            min-width: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: linear-gradient(135deg,#6366f1,#a855f7);
            color: #fff;
            font-weight: 700;
            font-size: 14px;
            box-shadow: 0 8px 16px -8px rgba(87,53,232,.7);
            transition: transform .4s cubic-bezier(.16,1,.3,1);
        }

        .review-item:hover .review-avatar {
            transform: rotate(-8deg) scale(1.08);
        }

        .review-name {
            color: var(--fb-ink);
            font-size: 14px;
            font-weight: 700;
        }

        .review-date {
            padding: 4px 11px;
            border-radius: 20px;
            background: var(--fb-soft);
            color: var(--fb-muted);
            font-size: 11px;
            font-weight: 500;
        }

        .review-comment {
            margin-top: 12px;
            color: var(--fb-muted);
            font-size: 13px;
            line-height: 1.8;
            overflow-wrap: anywhere;
        }

        /* =====================================================
           EMPTY FEEDBACK
        ===================================================== */

        .empty-feedback {
            padding: 60px 20px;
            text-align: center;
            border: 1px dashed rgba(109,75,255,.35);
            border-radius: 16px;
            background: rgba(124,92,255,.05);
        }

        .empty-feedback i {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 76px;
            height: 76px;
            border-radius: 50%;
            background: rgba(124,92,255,.14);
            color: #7c5cff;
            font-size: 34px;
            animation: fbFloat 3.2s ease-in-out infinite;
        }

        @keyframes fbFloat {
            50% { transform: translateY(-6px); }
        }

        .empty-feedback h5 {
            margin-top: 15px;
            color: var(--fb-ink);
            font-weight: 600;
        }

        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width:767px) {
            .feedback-summary { height: auto; }
        }

        @media (max-width:576px) {
            .feedback-average { font-size: 42px; }
            .review-item { padding: 15px; }
            .review-comment { font-size: 12px; }
        }

        /* REDUCED MOTION */

        @media (prefers-reduced-motion:reduce) {
            .feedback-bar-fill,
            .empty-feedback i {
                animation: none !important;
            }

            .review-item,
            .feedback-summary,
            .review-avatar {
                transition: none !important;
            }
        }
    </style>
</head>

<body class="mentor-shell" data-page="feedback">

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

                    <a class="nav-link active" href="feedback.aspx" aria-current="page">
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

                <!-- SIDEBAR FOOTER -->
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

                        <button type="button"
                            class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle
                            aria-label="Toggle navigation menu">

                            <i class="bi bi-list"></i>
                        </button>

                        <div class="mp-search d-none d-md-block">
                            <i class="bi bi-search"></i>
                            <input type="text" placeholder="Feedback and reviews" disabled />
                        </div>

                    </div>

                    <div class="d-flex align-items-center gap-2">

                        <!-- DARK MODE -->
                        <label class="mp-icon-btn"
                            title="Toggle dark mode"
                            style="cursor:pointer;">

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

                    </div>

                </div>

                <!-- PAGE HEADING -->
                <div class="mb-4 fade-in">

                    <span class="mp-page-eyebrow">
                        <i class="bi bi-star"></i>
                        Feedback
                    </span>

                    <h2 class="fw-bold mt-3 mb-1">
                        What your mentees are saying
                    </h2>

                    <p class="text-muted mb-0">
                        View your ratings, feedback and reviews from mentees.
                    </p>

                </div>

                <!-- FEEDBACK MESSAGE -->
                <asp:Panel ID="pnlMessage"
                    runat="server"
                    Visible="false"
                    CssClass="alert rounded-3 mb-3">

                    <asp:Label ID="lblMessage" runat="server"></asp:Label>

                </asp:Panel>

                <!-- SUMMARY AND REVIEWS -->
                <div class="row g-4">

                    <!-- RATING SUMMARY -->
                    <div class="col-lg-4 fade-in">

                        <div class="mp-card feedback-summary p-4 h-100">

                            <div class="text-center">

                                <div class="feedback-average">
                                    <asp:Label ID="lblAverageRating"
                                        runat="server"
                                        Text="0.0">
                                    </asp:Label>
                                </div>

                                <div class="feedback-stars">
                                    <asp:Label ID="lblAverageStars" runat="server"></asp:Label>
                                </div>

                                <p class="text-muted small mb-4 mt-2">
                                    Based on
                                    <strong>
                                        <asp:Label ID="lblTotalReviews"
                                            runat="server"
                                            Text="0">
                                        </asp:Label>
                                    </strong>
                                    reviews
                                </p>

                            </div>

                            <hr />

                            <h6 class="fw-semibold mb-3">Rating Breakdown</h6>

                            <asp:Repeater ID="rptRatingBars" runat="server">

                                <ItemTemplate>

                                    <div class="feedback-rating-row">

                                        <span>
                                            <%# Eval("Rating") %>
                                            <i class="bi bi-star-fill text-warning"></i>
                                        </span>

                                        <div class="feedback-bar">

                                            <div class="feedback-bar-fill"
                                                style='width: <%# Eval("Percent") %>%'>
                                            </div>

                                        </div>

                                        <span class="feedback-count">
                                            <%# Eval("Total") %>
                                        </span>

                                    </div>

                                </ItemTemplate>

                            </asp:Repeater>

                        </div>

                    </div>

                    <!-- RECENT REVIEWS -->
                    <div class="col-lg-8 fade-in">

                        <div class="mp-card p-4 h-100">

                            <div class="d-flex justify-content-between align-items-center mb-3">

                                <div>
                                    <h5 class="fw-semibold mb-1">Recent Reviews</h5>

                                    <p class="text-muted small mb-0">
                                        Feedback shared by your mentees
                                    </p>
                                </div>

                            </div>

                            <!-- DYNAMIC REVIEWS -->
                            <asp:Repeater ID="rptReviews" runat="server">

                                <ItemTemplate>

                                    <div class="review-item">

                                        <div class="d-flex align-items-start gap-3">

                                            <div class="review-avatar">
                                                <%# Eval("Initials") %>
                                            </div>

                                            <div class="flex-grow-1">

                                                <div class="d-flex justify-content-between flex-wrap gap-2">

                                                    <div class="review-name">
                                                        <%# Eval("FullName") %>
                                                    </div>

                                                    <div class="review-date">
                                                        <i class="bi bi-calendar3 me-1"></i>
                                                        <%# Eval("CreatedAt", "{0:dd MMM yyyy}") %>
                                                    </div>

                                                </div>

                                                <div class="feedback-stars mt-1">
                                                    <%# GetStars(Convert.ToInt32(Eval("Rating"))) %>
                                                </div>

                                                <p class="review-comment mb-0">
                                                    <%#: Eval("Comment") %>
                                                </p>

                                            </div>

                                        </div>

                                    </div>

                                </ItemTemplate>

                            </asp:Repeater>

                            <!-- EMPTY REVIEWS -->
                            <asp:Panel ID="pnlNoReviews"
                                runat="server"
                                Visible="false">

                                <div class="empty-feedback">

                                    <i class="bi bi-chat-square-heart"></i>

                                    <h5>No reviews yet</h5>

                                    <p class="text-muted small mb-0">
                                        Your mentee feedback will appear here when it is submitted.
                                    </p>

                                </div>

                            </asp:Panel>

                        </div>

                    </div>

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