<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="schedule.aspx.cs"
    Inherits="MentorHub.Mentor.Mentor_Schedule" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Schedule | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=7" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link href="../assets/css/notification-dropdown.css?v=1" rel="stylesheet" />
    <style>
        /* PAGE CONTENT ONLY */
        .schedule-page-head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 18px;
            margin-bottom: 25px;
        }

            .schedule-page-head h2 {
                color: #173b35;
                font-weight: 700;
                margin: 12px 0 6px;
            }

            .schedule-page-head p {
                color: #718078;
                margin: 0;
                font-size: 13px;
            }

        .schedule-calendar-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 22px;
        }

        .schedule-calendar-nav {
            display: flex;
            align-items: center;
            gap: 12px;
        }

            .schedule-calendar-nav h5 {
                margin: 0;
                min-width: 170px;
                text-align: center;
                color: #173b35;
                font-weight: 700;
            }

        .cal-nav-btn {
            width: 36px;
            height: 36px;
            border: 1px solid #e5ebe7;
            border-radius: 10px;
            background: #fff;
            color: #173b35;
            transition: .2s;
        }

            .cal-nav-btn:hover {
                background: #eaf5ef;
                color: #147d64;
                border-color: #b9dfc9;
            }

        .schedule-chip {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 7px 12px;
            border-radius: 30px;
            background: #eaf5ef;
            color: #147d64;
            font-size: 11px;
            font-weight: 600;
        }

            .schedule-chip i {
                font-size: 7px;
            }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7,minmax(0,1fr));
            gap: 8px;
        }

        .calendar-weekday {
            text-align: center;
            color: #829088;
            font-size: 11px;
            font-weight: 600;
            padding: 8px 2px;
        }

        .calendar-day {
            min-height: 88px;
            position: relative;
            border: 1px solid #edf1ee;
            border-radius: 12px;
            background: #fff;
            padding: 9px;
            cursor: pointer;
            transition: .2s;
        }

            .calendar-day:hover {
                border-color: #36a789;
                background: #f5fbf7;
                transform: translateY(-2px);
            }

            .calendar-day.empty {
                background: #fafcfb;
                cursor: default;
                border: 0;
            }

        .calendar-day-number {
            font-size: 12px;
            font-weight: 600;
            color: #173b35;
        }

        .calendar-day.today {
            border: 1px solid #36a789;
            background: #f0faf4;
        }

        .calendar-day.selected {
            border: 2px solid #147d64;
            background: #eaf5ef;
        }

        .calendar-day.has-sessions::after {
            content: "";
            position: absolute;
            bottom: 8px;
            left: 50%;
            transform: translateX(-50%);
            width: 7px;
            height: 7px;
            background: #147d64;
            border-radius: 50%;
        }

        .calendar-day.has-sessions .calendar-day-number {
            color: #147d64;
            font-weight: 800;
        }

        .calendar-day.other-month {
            opacity: .45;
        }

        .calendar-day-count {
            display: block;
            margin-top: 6px;
            color: #718078;
            font-size: 10px;
        }

        .upcoming-session-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .upcoming-session-item {
            display: flex;
            gap: 12px;
            padding: 14px 0;
            border-bottom: 1px solid #edf1ee;
        }

            .upcoming-session-item:last-child {
                border-bottom: 0;
            }

        .session-date-box {
            min-width: 52px;
            height: 58px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #eaf5ef;
            color: #147d64;
            border-radius: 12px;
        }

            .session-date-box strong {
                font-size: 19px;
                line-height: 1;
            }

            .session-date-box span {
                font-size: 10px;
                font-weight: 600;
                margin-top: 5px;
            }

        .upcoming-session-info {
            flex: 1;
            min-width: 0;
        }

            .upcoming-session-info h6 {
                color: #173b35;
                font-size: 13px;
                font-weight: 700;
                margin: 0 0 5px;
                overflow-wrap: anywhere;
            }

            .upcoming-session-info p {
                color: #718078;
                font-size: 11px;
                margin: 0 0 5px;
            }

        .session-status {
            display: inline-block;
            padding: 4px 9px;
            border-radius: 20px;
            background: #eaf5ef;
            color: #147d64;
            font-size: 10px;
            font-weight: 600;
        }

        .empty-sessions {
            text-align: center;
            padding: 28px 12px;
            color: #87968c;
            font-size: 13px;
        }

            .empty-sessions i {
                display: block;
                font-size: 30px;
                margin-bottom: 10px;
                color: #b8c8be;
            }

        .schedule-modal {
            border: 0;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 18px 50px rgba(23,59,53,.16);
        }

            .schedule-modal .modal-header {
                border-bottom: 1px solid #edf1ee;
                padding: 20px 22px;
            }

            .schedule-modal .modal-title {
                color: #173b35;
                font-weight: 700;
            }

            .schedule-modal .modal-body {
                padding: 22px;
            }

            .schedule-modal .modal-footer {
                border-top: 1px solid #edf1ee;
                padding: 16px 22px;
            }

            .schedule-modal .form-label {
                color: #52796f;
                font-size: 12px;
                font-weight: 600;
            }

            .schedule-modal .form-control,
            .schedule-modal .form-select {
                min-height: 44px;
                border-radius: 10px;
                border-color: #e1eae3;
                font-size: 13px;
            }

                .schedule-modal .form-control:focus,
                .schedule-modal .form-select:focus {
                    border-color: #36a789;
                    box-shadow: 0 0 0 3px rgba(54,167,137,.12);
                }

        .schedule-alert {
            border-radius: 12px;
            font-size: 13px;
        }

        @media(max-width:767px) {
            .schedule-page-head {
                align-items: flex-start;
            }

            .calendar-day {
                min-height: 58px;
                padding: 6px;
            }

            .calendar-day-count {
                display: none;
            }

            .calendar-grid {
                gap: 4px;
            }
        }

        @media(max-width:576px) {
            .schedule-page-head h2 {
                font-size: 22px;
            }

            .schedule-page-head > .d-flex {
                width: 100%;
                flex-wrap: wrap;
            }

            .schedule-calendar-nav {
                gap: 6px;
            }

                .schedule-calendar-nav h5 {
                    min-width: 135px;
                    font-size: 15px;
                }
        }
    </style>
</head>

<body class="mentor-shell" data-page="schedule">

    <form id="form1" runat="server">

        <div class="d-flex mentor-layout">

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

                    <a class="nav-link active" href="schedule.aspx" aria-current="page">
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

                    <div class="d-flex align-items-center gap-3 flex-grow-1">

                        <button type="button"
                            class="mp-mobile-toggle"
                            data-sidebar-toggle
                            aria-label="Open navigation">
                            <i class="bi bi-list"></i>
                        </button>

                        <div class="mp-search d-none d-md-block">
                            <i class="bi bi-search"></i>
                            <input type="text"
                                placeholder="Search mentees, requests, sessions…"
                                disabled />
                        </div>

                    </div>

                    <div class="d-flex align-items-center gap-2">

                        <button class="mp-icon-btn"
                            type="button"
                            data-dark-toggle
                            title="Toggle dark mode"
                            aria-label="Toggle dark mode">
                            <i class="bi bi-moon-stars"></i>
                        </button>

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

                                    <a href="notifications.aspx"
                                        class="notification-view-all">View all
            </a>

                                </div>

                                <asp:Repeater ID="rptTopNotifications" runat="server">

                                    <ItemTemplate>

                                        <div class='<%# Convert.ToBoolean(Eval("IsRead")) ? "mp-notif-item" : "mp-notif-item unread" %>'
                                            data-type='<%# Eval("NotificationType") %>'>

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
                                class="btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm">
                                    <asp:Label ID="lblTopInitials" runat="server" Text="M"></asp:Label>
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

                                <a class="dropdown-item rounded-3 text-danger"
                                    href="../Home/SignIn_up.aspx">
                                    <i class="bi bi-box-arrow-right me-2"></i>
                                    Logout
                                </a>

                            </div>
                        </div>

                    </div>
                </div>

                <!-- PAGE CONTENT -->
                <div class="schedule-page-head">

                    <div>
                        <span class="mp-page-eyebrow">
                            <i class="bi bi-calendar2-event"></i>
                            Schedule
                        </span>

                        <h2>Session calendar</h2>

                        <p>
                            Manage your mentoring sessions, review your calendar,
                            and organize upcoming meetings.
                       
                        </p>
                    </div>

                    <div class="d-flex gap-2">

                        <button type="button"
                            class="mp-btn mp-btn-outline"
                            id="btnToday">

                            <i class="bi bi-calendar-check"></i>
                            Today

                       
                        </button>

                        <button type="button"
                            class="mp-btn mp-btn-primary"
                            id="btnAddSession">

                            <i class="bi bi-plus-lg"></i>
                            Add Session

                       
                        </button>

                    </div>
                </div>

                <asp:Panel ID="pnlMessage"
                    runat="server"
                    Visible="false"
                    CssClass="alert schedule-alert">

                    <asp:Label ID="lblMessage" runat="server"></asp:Label>

                </asp:Panel>

                <!-- CALENDAR + UPCOMING -->
                <div class="row g-4">

                    <!-- CALENDAR -->
                    <div class="col-xl-8">

                        <section class="mp-card p-4 h-100">

                            <div class="schedule-calendar-head">

                                <div class="schedule-calendar-nav">

                                    <button type="button"
                                        class="cal-nav-btn"
                                        id="btnPrevMonth"
                                        aria-label="Previous month">
                                        <i class="bi bi-chevron-left"></i>
                                    </button>

                                    <h5 id="calendarMonthLabel"></h5>

                                    <button type="button"
                                        class="cal-nav-btn"
                                        id="btnNextMonth"
                                        aria-label="Next month">
                                        <i class="bi bi-chevron-right"></i>
                                    </button>

                                </div>

                                <span class="schedule-chip">
                                    <i class="bi bi-circle-fill"></i>
                                    Session day
                                </span>

                            </div>

                            <div id="calendarGrid" class="calendar-grid"></div>

                        </section>

                    </div>

                    <!-- UPCOMING SESSIONS -->
                    <div class="col-xl-4">

                        <section class="mp-card p-4 h-100">

                            <div class="d-flex justify-content-between align-items-center mb-3">

                                <h5 class="fw-semibold mb-0">Upcoming Sessions</h5>

                                <span class="mp-mini-label">Upcoming</span>

                            </div>

                            <asp:Repeater ID="rptUpcomingSessions" runat="server">

                                <HeaderTemplate>
                                    <ul class="upcoming-session-list">
                                </HeaderTemplate>

                                <ItemTemplate>

                                    <li class="upcoming-session-item">

                                        <div class="session-date-box">

                                            <strong>
                                                <%# Eval("SessionDate", "{0:dd}") %>
                                            </strong>

                                            <span>
                                                <%# Eval("SessionDate", "{0:MMM}") %>
                                            </span>

                                        </div>

                                        <div class="upcoming-session-info">

                                            <h6>
                                                <%#: Eval("Topic") %>
                                            </h6>

                                            <p>
                                                <i class="bi bi-clock me-1"></i>
                                                <%#: Eval("SessionTime") %>
                                            </p>

                                            <p>
                                                <i class="bi bi-person me-1"></i>
                                                Mentee #<%#: Eval("MenteeID") %>
                                            </p>

                                            <span class="session-status">
                                                <%#: Eval("Status") %>
                                            </span>

                                        </div>

                                    </li>

                                </ItemTemplate>

                                <FooterTemplate>
                                    </ul>
                               
                                </FooterTemplate>

                            </asp:Repeater>

                            <asp:Panel ID="pnlUpcomingEmpty"
                                runat="server"
                                Visible="false"
                                CssClass="empty-sessions">

                                <i class="bi bi-calendar-x"></i>
                                No upcoming sessions yet.

                           
                            </asp:Panel>

                        </section>

                    </div>

                </div>

            </main>
        </div>

        <!-- DAY DETAILS MODAL -->
        <div class="modal fade" id="dayDetailsModal" tabindex="-1">

            <div class="modal-dialog modal-dialog-centered">

                <div class="modal-content schedule-modal">

                    <div class="modal-header">

                        <h5 class="modal-title" id="dayModalTitle">Sessions</h5>

                        <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal">
                        </button>

                    </div>

                    <div class="modal-body" id="dayModalBody"></div>

                    <div class="modal-footer">

                        <button type="button"
                            class="mp-btn mp-btn-outline"
                            data-bs-dismiss="modal">
                            Close
                       
                        </button>

                        <button type="button"
                            class="mp-btn mp-btn-primary"
                            id="btnAddForSelectedDate">

                            <i class="bi bi-plus-lg"></i>
                            Add Session

                       
                        </button>

                    </div>

                </div>
            </div>
        </div>

        <!-- ADD SESSION MODAL -->
        <div class="modal fade" id="addSessionModal" tabindex="-1">

            <div class="modal-dialog modal-dialog-centered">

                <div class="modal-content schedule-modal">

                    <div class="modal-header">

                        <h5 class="modal-title">Add mentoring session</h5>

                        <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal">
                        </button>

                    </div>

                    <div class="modal-body">

                        <div class="row g-3">

                            <div class="col-md-6">

                                <label class="form-label">Session date</label>

                                <asp:TextBox ID="txtSessionDate"
                                    runat="server"
                                    TextMode="Date"
                                    CssClass="form-control"
                                    required="required">
                                </asp:TextBox>

                            </div>

                            <div class="col-md-6">

                                <label class="form-label">Session time</label>

                                <asp:TextBox ID="txtSessionTime"
                                    runat="server"
                                    TextMode="Time"
                                    CssClass="form-control"
                                    required="required">
                                </asp:TextBox>

                            </div>

                            <div class="col-12">

                                <label class="form-label">Mentee</label>

                                <asp:DropDownList ID="ddlSessionMentee"
                                    runat="server"
                                    CssClass="form-select">
                                </asp:DropDownList>

                            </div>

                            <div class="col-12">

                                <label class="form-label">Session topic</label>

                                <asp:TextBox ID="txtSessionTopic"
                                    runat="server"
                                    CssClass="form-control"
                                    MaxLength="200"
                                    placeholder="e.g. ASP.NET Project Guidance">
                                </asp:TextBox>

                            </div>

                        </div>

                    </div>

                    <div class="modal-footer">

                        <button type="button"
                            class="mp-btn mp-btn-outline"
                            data-bs-dismiss="modal">
                            Cancel
                       
                        </button>

                        <asp:Button ID="btnSaveSession"
                            runat="server"
                            Text="Save Session"
                            CssClass="mp-btn mp-btn-primary"
                            OnClick="btnSaveSession_Click"
                            OnClientClick="return validateSessionForm();" />

                    </div>

                </div>

            </div>

        </div>

        <!-- Session data from SQL -->
        <asp:HiddenField ID="hfSessionsJson" runat="server" />

    </form>

    <!-- JAVASCRIPT FILES -->
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/mentor-app.js?v=7"></script>
    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {

            // =========================================
            // ELEMENTS
            // =========================================

            const grid = document.getElementById("calendarGrid");
            const monthLabel = document.getElementById("calendarMonthLabel");

            const sessionsField =
                document.getElementById("<%= hfSessionsJson.ClientID %>");

            const dateInput =
                document.getElementById("<%= txtSessionDate.ClientID %>");

            const timeInput =
                document.getElementById("<%= txtSessionTime.ClientID %>");

            const menteeInput =
                document.getElementById("<%= ddlSessionMentee.ClientID %>");

            const topicInput =
                document.getElementById("<%= txtSessionTopic.ClientID %>");

            const addSessionModalElement =
                document.getElementById("addSessionModal");

            const dayModalElement =
                document.getElementById("dayDetailsModal");

            // =========================================
            // LOAD SQL SESSION DATA
            // =========================================

            let sessions = [];

            try {
                sessions = JSON.parse(sessionsField.value || "[]");
            }
            catch (error) {
                console.error("Session JSON error:", error);
                sessions = [];
            }

            // =========================================
            // CALENDAR VARIABLES
            // =========================================

            const today = new Date();

            let currentDate = new Date(
                today.getFullYear(),
                today.getMonth(),
                1
            );

            let selectedDate = formatDateKey(today);

            const monthNames = [
                "January", "February", "March", "April",
                "May", "June", "July", "August",
                "September", "October", "November", "December"
            ];

            const weekdays = [
                "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
            ];

            // =========================================
            // DATE FORMAT
            // =========================================

            function formatDateKey(date) {

                return date.getFullYear() + "-" +
                    String(date.getMonth() + 1).padStart(2, "0") + "-" +
                    String(date.getDate()).padStart(2, "0");
            }

            function parseDateKey(key) {

                const parts = key.split("-");

                return new Date(
                    Number(parts[0]),
                    Number(parts[1]) - 1,
                    Number(parts[2])
                );
            }

            function formatDisplayDate(key) {

                const date = parseDateKey(key);

                return date.toLocaleDateString("en-IN", {
                    weekday: "long",
                    day: "numeric",
                    month: "long",
                    year: "numeric"
                });
            }

            // =========================================
            // GET SESSIONS FOR SELECTED DATE
            // =========================================

            function getSessionsForDate(key) {

                return sessions.filter(function (session) {

                    return session.date === key;
                });
            }

            // =========================================
            // RENDER CALENDAR
            // =========================================

            function renderCalendar() {

                grid.innerHTML = "";

                monthLabel.textContent =
                    monthNames[currentDate.getMonth()] +
                    " " +
                    currentDate.getFullYear();

                // Weekdays
                weekdays.forEach(function (day) {

                    const weekday = document.createElement("div");

                    weekday.className = "calendar-weekday";

                    weekday.textContent = day;

                    grid.appendChild(weekday);
                });

                const firstDay = new Date(
                    currentDate.getFullYear(),
                    currentDate.getMonth(),
                    1
                ).getDay();

                const totalDays = new Date(
                    currentDate.getFullYear(),
                    currentDate.getMonth() + 1,
                    0
                ).getDate();

                // Empty cells before first date
                for (let i = 0; i < firstDay; i++) {

                    const empty = document.createElement("div");

                    empty.className = "calendar-day empty";

                    grid.appendChild(empty);
                }

                // Month dates
                for (let day = 1; day <= totalDays; day++) {

                    const date = new Date(
                        currentDate.getFullYear(),
                        currentDate.getMonth(),
                        day
                    );

                    const key = formatDateKey(date);

                    const daySessions = getSessionsForDate(key);

                    const cell = document.createElement("div");

                    cell.className = "calendar-day";

                    // Today
                    if (key === formatDateKey(today)) {
                        cell.classList.add("today");
                    }

                    // Selected date
                    if (key === selectedDate) {
                        cell.classList.add("selected");
                    }

                    // Sessions exist
                    if (daySessions.length > 0) {
                        cell.classList.add("has-sessions");
                    }

                    // Date number
                    const number = document.createElement("div");

                    number.className = "calendar-day-number";

                    number.textContent = day;

                    cell.appendChild(number);

                    // Session count
                    if (daySessions.length > 0) {

                        const count = document.createElement("span");

                        count.className = "calendar-day-count";

                        count.textContent =
                            daySessions.length +
                            (daySessions.length === 1
                                ? " session"
                                : " sessions");

                        cell.appendChild(count);
                    }

                    // Click on date
                    cell.addEventListener("click", function () {

                        selectedDate = key;

                        renderCalendar();

                        showDaySessions(key);
                    });

                    grid.appendChild(cell);
                }
            }

            // =========================================
            // SHOW SELECTED DATE DETAILS
            // =========================================

            function showDaySessions(key) {

                const daySessions = getSessionsForDate(key);

                const title =
                    document.getElementById("dayModalTitle");

                const body =
                    document.getElementById("dayModalBody");

                title.textContent = formatDisplayDate(key);

                body.innerHTML = "";

                // No sessions
                if (daySessions.length === 0) {

                    const empty = document.createElement("div");

                    empty.className = "empty-sessions";

                    empty.innerHTML =
                        '<i class="bi bi-calendar-x"></i>' +
                        'No sessions scheduled for this date.';

                    body.appendChild(empty);
                }

                // Sessions available
                else {

                    daySessions.forEach(function (session) {

                        const card = document.createElement("div");

                        card.className =
                            "border rounded-3 p-3 mb-3";

                        const heading = document.createElement("h6");

                        heading.className = "fw-bold mb-2";

                        heading.textContent =
                            session.topic || "Mentoring Session";

                        const time = document.createElement("p");

                        time.className = "small text-muted mb-2";

                        time.innerHTML =
                            '<i class="bi bi-clock me-1"></i>';

                        time.appendChild(
                            document.createTextNode(session.time || "")
                        );

                        const mentee = document.createElement("p");

                        mentee.className = "small text-muted mb-2";

                        mentee.innerHTML =
                            '<i class="bi bi-person me-1"></i>';

                        mentee.appendChild(
                            document.createTextNode(
                                "Mentee #" + session.menteeID
                            )
                        );

                        const status = document.createElement("span");

                        status.className = "session-status";

                        status.textContent = session.status || "Upcoming";

                        card.appendChild(heading);
                        card.appendChild(time);
                        card.appendChild(mentee);
                        card.appendChild(status);

                        body.appendChild(card);
                    });
                }

                bootstrap.Modal.getOrCreateInstance(
                    dayModalElement
                ).show();
            }

            // =========================================
            // PREVIOUS MONTH
            // =========================================

            document.getElementById("btnPrevMonth")
                .addEventListener("click", function () {

                    currentDate = new Date(
                        currentDate.getFullYear(),
                        currentDate.getMonth() - 1,
                        1
                    );

                    renderCalendar();
                });

            // =========================================
            // NEXT MONTH
            // =========================================

            document.getElementById("btnNextMonth")
                .addEventListener("click", function () {

                    currentDate = new Date(
                        currentDate.getFullYear(),
                        currentDate.getMonth() + 1,
                        1
                    );

                    renderCalendar();
                });

            // =========================================
            // TODAY BUTTON
            // =========================================

            document.getElementById("btnToday")
                .addEventListener("click", function () {

                    currentDate = new Date(
                        today.getFullYear(),
                        today.getMonth(),
                        1
                    );

                    selectedDate = formatDateKey(today);

                    renderCalendar();
                });

            // =========================================
            // OPEN ADD SESSION MODAL
            // =========================================

            function openAddSession(dateValue) {

                dateInput.value =
                    dateValue || formatDateKey(new Date());

                timeInput.value = "19:00";

                topicInput.value = "";

                if (menteeInput.options.length > 0) {
                    menteeInput.selectedIndex = 0;
                }

                bootstrap.Modal.getOrCreateInstance(
                    addSessionModalElement
                ).show();
            }

            // =========================================
            // ADD SESSION BUTTON
            // =========================================

            document.getElementById("btnAddSession")
                .addEventListener("click", function () {

                    openAddSession(formatDateKey(new Date()));
                });

            // =========================================
            // ADD SESSION FROM SELECTED DAY
            // =========================================

            document.getElementById("btnAddForSelectedDate")
                .addEventListener("click", function () {

                    // Hide day details first
                    bootstrap.Modal.getOrCreateInstance(
                        dayModalElement
                    ).hide();

                    // Open add session modal after closing
                    setTimeout(function () {

                        openAddSession(selectedDate);

                    }, 350);
                });

            // =========================================
            // VALIDATE SESSION FORM
            // =========================================

            window.validateSessionForm = function () {

                const date = dateInput.value;

                const time = timeInput.value;

                const mentee = menteeInput.value;

                const topic = topicInput.value.trim();

                if (!date) {
                    alert("Please select a session date.");
                    dateInput.focus();
                    return false;
                }

                if (!time) {
                    alert("Please select a session time.");
                    timeInput.focus();
                    return false;
                }

                if (!mentee) {
                    alert("Please select a mentee.");
                    menteeInput.focus();
                    return false;
                }

                if (!topic) {
                    alert("Please enter the session topic.");
                    topicInput.focus();
                    return false;
                }

                if (topic.length > 200) {
                    alert("Session topic cannot exceed 200 characters.");
                    topicInput.focus();
                    return false;
                }

                return true;
            };

            // =========================================
            // NOTIFICATION DROPDOWN
            // =========================================

            const bell =
                document.getElementById("notificationBell");

            if (bell && window.bootstrap) {

                bootstrap.Dropdown.getOrCreateInstance(bell);
            }

            // =========================================
            // INITIAL RENDER
            // =========================================

            renderCalendar();

        });
    </script>

</body>
</html>
