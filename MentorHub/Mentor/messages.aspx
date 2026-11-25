
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Messages" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Messages | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="../assets/css/styles.css?v=6" rel="stylesheet" />
    <link href="../assets/css/mentor-panel.css?v=8" rel="stylesheet" />
    <link href="../assets/css/notification-dropdown.css?v=2" rel="stylesheet" />

    <style>
        :root {
            --ms-primary: #5735e8;
            --ms-primary-2: #7c5cff;
            --ms-soft: #f2efff;
            --ms-border: #eceaf3;
            --ms-ink: #25213a;
            --ms-muted: #77758a;
            --ms-card: #ffffff;
            --ms-field: #faf9ff;
            --ms-shadow: 0 8px 30px rgba(45,35,100,.07);
        }

        body[data-page="messages"] {
            font-family: 'Poppins', sans-serif;
        }

        body[data-page="messages"] .content-area {
            min-width: 0;
            min-height: 100vh;
            background:
                radial-gradient(ellipse at 10% 10%, rgba(151,113,255,.16), transparent 38%),
                radial-gradient(ellipse at 90% 90%, rgba(101,153,255,.12), transparent 38%);
        }

        body.mentor-dark {
            --ms-soft: #2d2745;
            --ms-border: #39334e;
            --ms-ink: #f2efff;
            --ms-muted: #b7b1ca;
            --ms-card: #211d32;
            --ms-field: #29243d;
        }

        /* TOPBAR */
        .ms-top-left, .ms-top-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .ms-top-left {
            min-width: 0;
            flex: 1;
        }

        .ms-top-right {
            flex-shrink: 0;
        }

        .sidebar-toggle-btn {
            width: 42px;
            height: 42px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            flex-shrink: 0;
        }

        /* HERO */
        .ms-hero {
            position: relative;
            overflow: hidden;
            margin-bottom: 24px;
            padding: 26px 32px;
            color: #fff;
            border-radius: 22px;
            background:
                radial-gradient(420px 220px at 95% 0%, rgba(240,171,252,.45), transparent 65%),
                radial-gradient(360px 220px at 0% 100%, rgba(56,189,248,.28), transparent 65%),
                linear-gradient(120deg,#4526c9,#6d4bff 55%,#a855f7);
            box-shadow: 0 26px 50px -26px rgba(87,53,232,.8);
        }

        .ms-hero::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -40%;
            width: 40%;
            height: 200%;
            background: linear-gradient(100deg,transparent,rgba(255,255,255,.16),transparent);
            transform: rotate(18deg);
            animation: msSweep 8s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes msSweep {
            0% { left: -40%; }
            55%,100% { left: 130%; }
        }

        .ms-eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 6px 13px;
            border-radius: 30px;
            background: rgba(255,255,255,.18);
            font-size: 12px;
            font-weight: 700;
        }

        .ms-hero h2 {
            margin: 14px 0 4px;
            color: white;
            font-size: 28px;
            font-weight: 800;
        }

        .ms-hero p {
            margin: 0;
            opacity: .9;
            font-size: 13px;
        }

        /* CHAT LAYOUT */
        .ms-layout {
            display: grid;
            grid-template-columns: 340px minmax(0,1fr);
            gap: 24px;
            height: calc(100vh - 285px);
            min-height: 550px;
            max-height: 900px;
        }

        .ms-panel {
            display: flex;
            flex-direction: column;
            min-width: 0;
            min-height: 0;
            overflow: hidden;
            background: var(--ms-card);
            border: 1px solid var(--ms-border);
            border-radius: 20px;
            box-shadow: var(--ms-shadow);
        }

        /* CONVERSATION PANEL */
        .ms-panel-head {
            padding: 18px;
            border-bottom: 1px solid var(--ms-border);
        }

        .ms-panel-head h6 {
            margin-bottom: 14px;
            color: var(--ms-ink);
            font-size: 15px;
            font-weight: 700;
        }

        .ms-search {
            position: relative;
        }

        .ms-search i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--ms-muted);
        }

        .ms-search input {
            width: 100%;
            padding: 11px 14px 11px 40px;
            color: var(--ms-ink);
            background: var(--ms-field);
            border: 1px solid var(--ms-border);
            border-radius: 12px;
            font: 400 13px 'Poppins',sans-serif;
            transition: .2s;
        }

        .ms-search input:focus {
            outline: none;
            border-color: var(--ms-primary);
            box-shadow: 0 0 0 4px rgba(87,53,232,.12);
        }

        /* CORRECT CONVERSATION LIST CONTAINER */
        [data-conv-list] {
            flex: 1;
            min-height: 0;
            padding: 10px;
            overflow-y: auto;
            overflow-x: hidden;
        }

        .mp-conv-item {
            position: relative;
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px;
            margin-bottom: 5px;
            border-radius: 14px;
            cursor: pointer;
            transition: all .2s ease;
            border: 1px solid transparent;
        }

        .mp-conv-item:hover {
            background: rgba(87,53,232,.07);
        }

        .mp-conv-item.active {
            background: rgba(87,53,232,.10);
            border-color: rgba(87,53,232,.10);
        }

        .mp-conv-item.active::before {
            content: "";
            position: absolute;
            left: 0;
            top: 18%;
            bottom: 18%;
            width: 4px;
            border-radius: 0 4px 4px 0;
            background: linear-gradient(180deg,#6d4bff,#d946ef);
        }

        .mp-conv-text {
            flex: 1;
            min-width: 0;
        }

        .mp-conv-name {
            color: var(--ms-ink);
            font-size: 13px;
            font-weight: 600;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .mp-conv-preview {
            max-width: 190px;
            color: var(--ms-muted);
            font-size: 11.5px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .mp-conv-time {
            color: var(--ms-muted);
            font-size: 10px;
            white-space: nowrap;
        }

        .mp-conv-unread {
            min-width: 21px;
            height: 21px;
            padding: 0 6px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg,#6d4bff,#d946ef);
            color: #fff;
            font-size: 11px;
            font-weight: 700;
        }

        /* AVATARS */
        .mp-avatar.sm {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            border-radius: 50%;
            background: linear-gradient(135deg,#5735e8,#9239e9);
            color: white;
            font-weight: 600;
            overflow: hidden;
        }

        .mp-avatar.sm img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        /* CHAT PANEL */
        .mp-chat-window {
            display: flex;
            flex-direction: column;
            flex: 1;
            min-width: 0;
            min-height: 0;
        }

        .ms-chat-head {
            padding: 17px 20px;
            border-bottom: 1px solid var(--ms-border);
            background: var(--ms-card);
        }

        .ms-chat-head h6 {
            margin: 0;
            color: var(--ms-ink);
            font-size: 15px;
            font-weight: 700;
        }

        [data-chat-status] {
            display: block;
            margin-top: 4px;
            font-size: 11px;
            color: var(--ms-muted);
        }

        /* ONLY THE RIGHT PANEL USES DATA-CHAT-WINDOW */
        [data-chat-window] {
            flex: 1;
            min-height: 0;
            overflow-y: auto;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
            gap: 12px;
            padding: 22px;
            background:
                radial-gradient(circle at 0 0, rgba(111,76,255,.04), transparent 45%),
                var(--ms-field);
        }

        .mp-chat-bubble {
            max-width: 75%;
            width: fit-content;
            padding: 11px 15px;
            border-radius: 17px;
            font-size: 13px;
            line-height: 1.65;
            overflow-wrap: anywhere;
            animation: messageFade .2s ease;
        }

        @keyframes messageFade {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .mp-chat-bubble.sent {
            align-self: flex-end;
            margin-left: auto;
            color: #fff;
            background: linear-gradient(135deg,#5735e8,#9239e9);
            border-bottom-right-radius: 5px;
            box-shadow: 0 4px 12px rgba(87,53,232,.15);
        }

        .mp-chat-bubble.received {
            align-self: flex-start;
            margin-right: auto;
            background: #e9e5f8;
            color: #25213a;
            border-bottom-left-radius: 5px;
        }

        .mp-chat-time {
            display: block;
            margin-top: 5px;
            font-size: 10px;
            opacity: .75;
        }

        /* EMPTY STATES */
        .mp-conv-empty,
        .mp-chat-empty {
            padding: 30px 18px;
            text-align: center;
            color: var(--ms-muted);
            font-size: 12px;
        }

        .mp-conv-empty i,
        .mp-chat-empty i {
            display: block;
            font-size: 28px;
            margin-bottom: 10px;
            color: var(--ms-primary);
            opacity: .65;
        }

        .mp-conv-empty strong,
        .mp-chat-empty strong {
            display: block;
            color: var(--ms-ink);
            font-size: 13px;
            margin-bottom: 5px;
        }

        /* COMPOSER */
        .ms-composer {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 15px 18px;
            border-top: 1px solid var(--ms-border);
            background: var(--ms-card);
        }

        .ms-composer input[data-chat-input] {
            flex: 1;
            min-width: 0;
            padding: 12px 18px;
            color: var(--ms-ink);
            background: var(--ms-field);
            border: 1px solid var(--ms-border);
            border-radius: 999px;
            font: 400 13px 'Poppins',sans-serif;
            transition: .2s;
        }

        .ms-composer input[data-chat-input]:focus {
            outline: none;
            border-color: var(--ms-primary);
            box-shadow: 0 0 0 4px rgba(87,53,232,.12);
        }

        .ms-send {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 22px;
            color: white;
            border: 0;
            border-radius: 999px;
            background: linear-gradient(120deg,#5735e8,#9239e9);
            box-shadow: 0 4px 12px rgba(87,53,232,.2);
            font: 700 13px 'Poppins',sans-serif;
            cursor: pointer;
            transition: .2s;
            white-space: nowrap;
        }

        .ms-send:hover {
            transform: translateY(-1px);
            box-shadow: 0 7px 18px rgba(87,53,232,.3);
        }

        .ms-send:disabled {
            opacity: .55;
            cursor: not-allowed;
            transform: none;
        }

        /* SCROLLBAR */
        .mp-scroll-thin::-webkit-scrollbar,
        [data-conv-list]::-webkit-scrollbar,
        [data-chat-window]::-webkit-scrollbar {
            width: 6px;
        }

        .mp-scroll-thin::-webkit-scrollbar-thumb,
        [data-conv-list]::-webkit-scrollbar-thumb,
        [data-chat-window]::-webkit-scrollbar-thumb {
            background: rgba(87,53,232,.28);
            border-radius: 999px;
        }

        /* DARK MODE */
        body.mentor-dark [data-chat-window] {
            background: var(--ms-field);
        }

        body.mentor-dark .mp-chat-bubble.received {
            background: #38314e;
            color: #f3efff;
        }

        body.mentor-dark .mp-conv-item.active {
            background: rgba(124,92,255,.18);
        }

        /* RESPONSIVE */
        @media(max-width:1200px) {
            .ms-layout {
                grid-template-columns: 300px minmax(0,1fr);
                gap: 18px;
            }
        }

        @media(max-width:991px) {
            .ms-layout {
                grid-template-columns: 1fr;
                height: auto;
                max-height: none;
                min-height: 0;
            }

            .ms-panel:first-child {
                height: 350px;
                min-height: 350px;
            }

            .ms-panel:last-child {
                height: 600px;
                min-height: 500px;
            }
        }

        @media(max-width:767px) {
            main.content-area {
                padding: 15px !important;
            }

            .ms-hero {
                padding: 22px 20px;
                border-radius: 18px;
            }

            .ms-hero h2 {
                font-size: 22px;
            }

            .ms-hero p {
                font-size: 12px;
            }

            .ms-layout {
                gap: 15px;
            }

            .mp-chat-bubble {
                max-width: 88%;
            }

            .ms-composer {
                padding: 12px;
                gap: 7px;
            }

            .ms-composer input[data-chat-input] {
                padding: 11px 14px;
                font-size: 12px;
            }

            .ms-send {
                padding: 11px 15px;
            }

            .ms-send i {
                font-size: 12px;
            }

            .mp-conv-preview {
                max-width: 150px;
            }
        }

        @media(max-width:420px) {
            .ms-send {
                padding: 11px 12px;
                font-size: 12px;
            }

            .ms-send i {
                margin: 0;
            }

            .ms-chat-head {
                padding: 14px;
            }

            [data-chat-window] {
                padding: 15px;
            }
        }
    </style>
</head>

<body class="mentor-shell"
      data-page="messages"
      data-chat-role="mentor"
      data-chat-live="true">
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
                    <span class="mp-nav-badge" data-badge="requests">0</span>
                </a>

                <a class="nav-link" href="mentees.aspx">
                    <i class="bi bi-people"></i>
                    <span>My Mentees</span>
                </a>

                <a class="nav-link active" href="messages.aspx" aria-current="page">
                    <i class="bi bi-chat-dots"></i>
                    <span>Messages</span>

                    <asp:Label ID="lblUnreadMessages"
                        runat="server"
                        CssClass="mp-nav-badge"
                        Visible="false"></asp:Label>
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
                    <span class="mp-avatar sm" data-mini-avatar></span>

                    <div class="mp-mini-profile-text">
                        <strong data-mini-name></strong>
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

                <div class="ms-top-left">

                    <button type="button"
                        class="btn btn-outline-secondary sidebar-toggle-btn"
                        data-sidebar-toggle
                        aria-label="Toggle navigation menu">

                        <i class="bi bi-list"></i>
                    </button>

                    <div class="mp-search d-none d-md-block">
                        <i class="bi bi-search"></i>
                        <input type="text"
                            placeholder="Search mentees, requests, sessions..." />
                    </div>

                </div>

                <div class="ms-top-right">

                    <!-- DARK MODE -->
                    <label class="mp-icon-btn" title="Toggle dark mode">
                        <input type="checkbox"
                            data-dark-toggle
                            class="visually-hidden" />
                        <i class="bi bi-moon-stars"></i>
                    </label>

                    <!-- NOTIFICATIONS -->
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
                                Visible="false"></asp:Label>
                        </button>

                        <div class="dropdown-menu dropdown-menu-end mp-notification-dropdown"
                            aria-labelledby="notificationBell">

                            <div class="d-flex">
                                <span class="notification-heading">
                                    <i class="bi bi-bell"></i>
                                    Notifications
                                </span>

                                <a href="notifications.aspx"
                                    class="notification-view-all">View all</a>
                            </div>

                            <asp:Repeater ID="rptTopNotifications" runat="server">
                                <ItemTemplate>

                                    <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "mp-notif-item" : "mp-notif-item unread" %>'
                                        data-type='<%#: Eval("NotificationType") %>'>

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

                    <!-- PROFILE DROPDOWN -->
                    <div class="dropdown">

                        <button type="button"
                            class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                            data-bs-toggle="dropdown">

                            <span class="mp-avatar sm" data-mini-avatar></span>
                        </button>

                        <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu">

                            <a class="dropdown-item" href="profile.aspx">
                                <i class="bi bi-person me-2"></i>
                                My Profile
                            </a>

                            <a class="dropdown-item" href="settings.aspx">
                                <i class="bi bi-gear me-2"></i>
                                Settings
                            </a>

                            <hr />

                            <a class="dropdown-item text-danger" href="../Home/SignIn_up.aspx">
                                <i class="bi bi-box-arrow-right me-2"></i>
                                Logout
                            </a>

                        </div>

                    </div>

                </div>
            </div>

            <!-- HERO -->
            <div class="ms-hero">

                <span class="ms-eyebrow">
                    <i class="bi bi-chat-dots-fill"></i>
                    Messages
                </span>

                <h2>Your Messages</h2>

                <p>Connect and communicate with your mentoring connections.</p>

            </div>

            <!-- MESSAGES LAYOUT -->
            <div class="ms-layout">

                <!-- LEFT: CONVERSATIONS -->
                <section class="ms-panel">

                    <div class="ms-panel-head">

                        <h6>Conversations</h6>

                        <div class="ms-search">
                            <i class="bi bi-search"></i>

                            <input type="text"
                                id="msFilter"
                                placeholder="Search conversations..."
                                autocomplete="off" />
                        </div>

                    </div>

                    <!-- IMPORTANT: JS LOADS CONVERSATIONS HERE -->
                    <div class="mp-scroll-thin" data-conv-list>
</div>

                </section>

                <!-- RIGHT: CHAT -->
                <section class="ms-panel">

                    <div class="mp-chat-window">

                        <!-- CHAT HEADER -->
                        <div class="ms-chat-head">

    <h6 data-chat-name></h6>

    <span data-chat-status></span>

</div>
                        <!-- IMPORTANT: JS LOADS ACTUAL CHAT MESSAGES HERE -->
                       <div class="mp-scroll-thin" data-chat-window>
</div>

                        <!-- MESSAGE INPUT -->
                        <div class="ms-composer">

    <input type="text"
           placeholder="Type a message..."
           data-chat-input
           autocomplete="off"
           maxlength="2000"
           disabled />

    <button type="button"
            class="ms-send"
            data-chat-send
            disabled>

        <i class="bi bi-send-fill"></i>
        <span>Send</span>

    </button>

</div>

                    </div>

                </section>

            </div>

        </main>

    </div>

</form>

<!-- JAVASCRIPT -->

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../assets/js/mentor-app.js?v=2"></script>

<script src="../assets/js/mentor-profile-sync.js?v=2"></script>

<script src="../assets/js/real-chat.js?v=21"></script>
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
