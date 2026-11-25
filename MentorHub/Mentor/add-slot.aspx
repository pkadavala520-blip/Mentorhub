<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-slot.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Add_Slot" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Availability Slot | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link href="../assets/css/notification-dropdown.css?v=1"rel="stylesheet" />

    <style>
        .slot-form-card {
            max-width: 720px;
            border-radius: 18px;
        }

            .slot-form-card .form-label {
                font-weight: 600;
                margin-bottom: 8px;
            }

            .slot-form-card .form-control,
            .slot-form-card .form-select {
                min-height: 48px;
                border-radius: 10px;
            }

        .slot-info {
            background: #f0f8f2;
            border: 1px solid #d8eddd;
            border-radius: 12px;
            padding: 15px;
        }

        .slot-help {
            font-size: 12px;
            color: #758477;
            margin-top: 6px;
        }

        .required-star {
            color: #dc3545;
        }

        .slot-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .slot-message {
            display: block;
            margin-top: 12px;
            padding: 12px;
            border-radius: 10px;
        }

            .slot-message:empty {
                display: none;
            }

            .slot-message.success {
                color: #146c43;
                background: #d1e7dd;
            }

            .slot-message.error {
                color: #842029;
                background: #f8d7da;
            }

        @media (max-width: 576px) {
            .slot-actions .mp-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>

<body class="mentor-shell" data-page="add-slot">

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

                    <a class="nav-link active" href="availability.aspx" aria-current="page">
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
                        <span class="mp-avatar sm" data-mini-avatar>MH</span>
                        <div class="mp-mini-profile-text">
                            <strong data-mini-name>Mentor</strong>
                            <span>
                                <span class="mp-status-dot d-inline-block me-1"></span>
                                Mentor Account
                        </span>
                        </div>
                    </div>

                    <a class="nav-link mp-danger" href="logout.aspx">
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
                            <input type="text"
                                placeholder="Search mentees, requests, sessions..." />
                        </div>

                    </div>

                    <!-- RIGHT -->
                    <div class="d-flex align-items-center gap-2">

                        <!-- DARK MODE -->
                        <label class="mp-icon-btn"
                            title="Toggle dark mode"
                            style="cursor: pointer">

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

                        <!-- PROFILE DROPDOWN -->
                        <div class="dropdown">

                            <button type="button"
                                class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm" data-mini-avatar>MH</span>

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

                                <a class="dropdown-item rounded-3 text-danger" href="logout.aspx">
                                    <i class="bi bi-box-arrow-right me-2"></i>
                                    Logout
                            </a>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- PAGE HEADING -->
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4 fade-in">

                    <div>
                        <span class="mp-page-eyebrow">
                            <i class="bi bi-calendar-plus"></i>
                            Availability Management
                    </span>

                        <h2 class="fw-bold mt-3 mb-1">Create a New Availability Slot
                    </h2>

                        <p class="text-muted mb-0">
                            Set your available mentoring days and preferred time.
                   
                        </p>
                    </div>

                    <a href="availability.aspx" class="mp-btn mp-btn-outline">
                        <i class="bi bi-arrow-left"></i>
                        Back to Availability
                </a>

                </div>

                <!-- INFORMATION -->
                <div class="slot-info mb-4 fade-in">
                    <div class="d-flex gap-3 align-items-center">
                        <i class="bi bi-info-circle-fill fs-4 text-success"></i>
                        <div>
                            <strong>Manage your mentoring availability</strong>
                            <p class="mb-0 small text-muted">
                                Add your preferred days and time ranges so that
                            mentees can request suitable mentoring sessions.
                       
                            </p>
                        </div>
                    </div>
                </div>

                <!-- ADD SLOT FORM -->
                <div class="mp-card slot-form-card p-4 fade-in">

                    <div class="d-flex align-items-center gap-3 mb-4">
                        <div class="mp-brand-mark">
                            <i class="bi bi-calendar2-plus"></i>
                        </div>

                        <div>
                            <h5 class="fw-semibold mb-1">New Availability Slot</h5>
                            <p class="text-muted small mb-0">
                                Complete the information below.
                       
                            </p>
                        </div>
                    </div>

                    <div class="row g-3">

                        <!-- DAY -->
                        <div class="col-md-6">
                            <label class="form-label" for="<%= ddlDayName.ClientID %>">
                                Available Day <span class="required-star">*</span>
                            </label>

                            <asp:DropDownList ID="ddlDayName"
                                runat="server"
                                CssClass="form-select">

                                <asp:ListItem Value="">Select a day</asp:ListItem>
                                <asp:ListItem Value="Monday">Monday</asp:ListItem>
                                <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                                <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                                <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                                <asp:ListItem Value="Friday">Friday</asp:ListItem>
                                <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                                <asp:ListItem Value="Sunday">Sunday</asp:ListItem>

                            </asp:DropDownList>

                            <div class="slot-help">
                                Select the day you are available.
                       
                            </div>
                        </div>

                        <!-- START TIME -->
                        <div class="col-md-6">
                            <label class="form-label" for="<%= txtStartTime.ClientID %>">
                                Start Time <span class="required-star">*</span>
                            </label>

                            <asp:TextBox ID="txtStartTime"
                                runat="server"
                                TextMode="Time"
                                CssClass="form-control">
                        </asp:TextBox>

                            <div class="slot-help">
                                Choose when your availability begins.
                       
                            </div>
                        </div>

                        <!-- END TIME -->
                        <div class="col-md-6">
                            <label class="form-label" for="<%= txtEndTime.ClientID %>">
                                End Time <span class="required-star">*</span>
                            </label>

                            <asp:TextBox ID="txtEndTime"
                                runat="server"
                                TextMode="Time"
                                CssClass="form-control">
                        </asp:TextBox>

                            <div class="slot-help">
                                End time must be later than start time.
                       
                            </div>
                        </div>

                        <!-- DURATION -->
                        <div class="col-md-6">
                            <label class="form-label">Availability Duration</label>

                            <div class="form-control bg-light d-flex align-items-center gap-2">
                                <i class="bi bi-clock text-success"></i>
                                <span id="durationPreview">Not selected</span>
                            </div>
                        </div>

                        <!-- MESSAGE -->
                        <div class="col-12">
                            <asp:Label ID="lblMessage"
                                runat="server"
                                EnableViewState="false">
                        </asp:Label>
                        </div>

                        <!-- BUTTONS -->
                        <div class="col-12">
                            <div class="slot-actions">

                                <asp:Button ID="LinkButton1"
                                    runat="server"
                                    Text="Add Availability Slot"
                                    CssClass="mp-btn mp-btn-primary"
                                    OnClick="LinkButton1_Click"
                                    OnClientClick="return validateSlotForm();"
                                    CausesValidation="false" />

                                <a href="availability.aspx" class="mp-btn mp-btn-outline">
                                    <i class="bi bi-x-circle"></i>
                                    Cancel
                            </a>

                            </div>
                        </div>

                    </div>

                </div>

                <!-- FOOTER -->
                <div class="text-center text-muted small mt-4">
                    MentorHub &copy; 2026 | Empowering Mentorship
           
                </div>

            </main>

        </div>

    </form>

    <!-- SCRIPTS -->
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/mentor-app.js?v=1"></script>

    <script>
        // Validate availability form
        function validateSlotForm() {

            var day = document.getElementById('<%= ddlDayName.ClientID %>').value;
            var start = document.getElementById('<%= txtStartTime.ClientID %>').value;
            var end = document.getElementById('<%= txtEndTime.ClientID %>').value;

            if (!day || !start || !end) {
                alert("Please complete all required fields.");
                return false;
            }

            if (start >= end) {
                alert("End time must be later than start time.");
                return false;
            }

            return true;
        }

        // Calculate availability duration
        function updateDuration() {

            var start = document.getElementById('<%= txtStartTime.ClientID %>');
            var end = document.getElementById('<%= txtEndTime.ClientID %>');
            var preview = document.getElementById("durationPreview");

            if (!start.value || !end.value) {
                preview.textContent = "Not selected";
                return;
            }

            var a = start.value.split(":");
            var b = end.value.split(":");

            var startMinutes = parseInt(a[0]) * 60 + parseInt(a[1]);
            var endMinutes = parseInt(b[0]) * 60 + parseInt(b[1]);

            if (endMinutes <= startMinutes) {
                preview.textContent = "Invalid duration";
                return;
            }

            var minutes = endMinutes - startMinutes;
            var hours = Math.floor(minutes / 60);
            var remaining = minutes % 60;

            preview.textContent =
                hours + " hour(s)" +
                (remaining ? " " + remaining + " minutes" : "");
        }

        document.addEventListener("DOMContentLoaded", function () {

            var start = document.getElementById('<%= txtStartTime.ClientID %>');
            var end = document.getElementById('<%= txtEndTime.ClientID %>');

            if (start) {
                start.addEventListener("change", updateDuration);
            }

            if (end) {
                end.addEventListener("change", updateDuration);
            }

            updateDuration();

            // Ensure notification dropdown opens and remains above page content.
            var bell = document.getElementById("notificationBell");

            if (bell && window.bootstrap) {
                bootstrap.Dropdown.getOrCreateInstance(bell);
            }

        });
</script>

    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>

</body>
</html>
