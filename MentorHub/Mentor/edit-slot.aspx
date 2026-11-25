<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit-slot.aspx.cs" Inherits="MentorHub.Mentor.edit_slot" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Edit Availability | MentorHub</title>

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=8" />
    <link rel="stylesheet" href="../assets/css/notification-dropdown.css?v=2" />

    <style>

        /* =========================================
           EDIT SLOT CARD
        ========================================= */

        .edit-slot-card {
            width: 100%;
            max-width: 650px;
            margin: 30px auto;
            padding: 35px;
            background: #ffffff;
            border: 1px solid #e8eee9;
            border-radius: 18px;
            box-shadow: 0 8px 28px rgba(30, 60, 45, 0.07);
            transition: all .3s ease;
        }

        .edit-slot-card:hover {
            box-shadow: 0 12px 32px rgba(30, 60, 45, 0.10);
        }


        /* =========================================
           ICON
        ========================================= */

        .edit-slot-icon {
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            border-radius: 14px;
            background: linear-gradient(135deg, #6046e8, #9638e8);
            color: #ffffff;
            font-size: 25px;
            box-shadow: 0 5px 14px rgba(105, 65, 220, .22);
            transition: all .3s ease;
        }

        .edit-slot-icon:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 20px rgba(105, 65, 220, .30);
        }


        /* =========================================
           HEADING
        ========================================= */

        .edit-slot-title {
            margin-bottom: 8px;
            color: #173b2a;
            font-size: 25px;
            font-weight: 700;
        }

        .edit-slot-subtitle {
            margin-bottom: 28px;
            color: #7b8b80;
            font-size: 14px;
            line-height: 1.6;
        }


        /* =========================================
           LABELS
        ========================================= */

        .edit-label {
            display: block;
            margin-bottom: 9px;
            color: #344b3c;
            font-size: 13px;
            font-weight: 600;
        }


        /* =========================================
           INPUTS
        ========================================= */

        .edit-input {
            display: block;
            width: 100%;
            height: 49px;
            padding: 10px 14px;
            border: 1px solid #dce7df;
            border-radius: 10px;
            outline: none;
            background: #ffffff;
            color: #263b30;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            transition: all .25s ease;
        }

        .edit-input:hover {
            border-color: #a9cdb5;
        }

        .edit-input:focus {
            border-color: #198754;
            box-shadow: 0 0 0 3px rgba(25, 135, 84, .10);
        }


        /* =========================================
           FORM SPACING
        ========================================= */

        .edit-form-group {
            margin-bottom: 22px;
        }


        /* =========================================
           BUTTONS
        ========================================= */

        .edit-buttons {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 28px;
        }

        .edit-btn {
            min-height: 46px;
            padding: 11px 22px;
            border: none;
            border-radius: 9px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all .3s ease;
        }


        /* =========================================
           UPDATE BUTTON
        ========================================= */

        .edit-btn-primary {
            background: linear-gradient(135deg, #6046e8, #9638e8);
            color: #ffffff;
            box-shadow: 0 5px 13px rgba(105, 65, 220, .20);
        }

        .edit-btn-primary:hover {
            background: linear-gradient(135deg, #5035d5, #8128d6);
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 18px rgba(105, 65, 220, .28);
        }


        /* =========================================
           CANCEL BUTTON
        ========================================= */

        .edit-btn-secondary {
            background: #f1f5f2;
            color: #53665a;
            border: 1px solid #e1e9e3;
        }

        .edit-btn-secondary:hover {
            background: #e3ebe5;
            color: #173b2a;
            transform: translateY(-2px);
        }


        /* =========================================
           MESSAGE
        ========================================= */

        .edit-message {
            display: block;
            margin-bottom: 18px;
            font-size: 13px;
            font-weight: 500;
        }


        /* =========================================
           SIDEBAR PROFILE - NO ROUND PHOTO
        ========================================= */

        .mp-mini-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .mp-mini-profile-text {
            min-width: 0;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 576px) {

            .edit-slot-card {
                padding: 22px;
                margin: 15px auto;
            }

            .edit-slot-title {
                font-size: 21px;
            }

            .edit-buttons {
                flex-direction: column;
                align-items: stretch;
            }

            .edit-btn {
                width: 100%;
            }

        }

    </style>

</head>

<body class="mentor-shell" data-page="availability">

    <form id="form2" runat="server">

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


                <!-- NAVIGATION -->

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


                <!-- SIDEBAR PROFILE -->

                <div class="mp-sidebar-footer">

                    <div class="mp-mini-profile mb-2">

                        <div class="mp-mini-profile-text">

                            <strong data-mini-name>Mentor</strong>

                            <span>
                                <span class="mp-status-dot d-inline-block me-1"></span>
                                Active now
                            </span>

                        </div>

                    </div>


                    <!-- LOGOUT -->

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

                        <!-- SIDEBAR TOGGLE -->

                        <button type="button"
                            class="btn btn-outline-secondary sidebar-toggle-btn"
                            data-sidebar-toggle
                            aria-label="Toggle navigation menu"
                            aria-expanded="false">

                            <i class="bi bi-list"></i>

                        </button>


                        <!-- SEARCH -->

                        <div class="mp-search d-none d-md-block">

                            <i class="bi bi-search"></i>

                            <input type="text"
                                placeholder="Search mentees, requests, sessions..." />

                        </div>

                    </div>


                    <!-- TOPBAR ACTIONS -->

                    <div class="d-flex align-items-center gap-2">


                        <!-- DARK MODE -->

                        <label class="mp-icon-btn"
                            title="Toggle dark mode"
                            style="cursor: pointer;">

                            <input type="checkbox"
                                data-dark-toggle
                                class="visually-hidden" />

                            <i class="bi bi-moon-stars"></i>

                        </label>


                        <!-- NOTIFICATION BELL -->

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


                            <!-- NOTIFICATION DROPDOWN -->

                            <div class="dropdown-menu dropdown-menu-end mp-notification-dropdown"
                                aria-labelledby="notificationBell">

                                <div class="d-flex">

                                    <span class="notification-heading">
                                        <i class="bi bi-bell"></i>
                                        Notifications
                                    </span>

                                    <a href="notifications.aspx"
                                        class="notification-view-all">
                                        View all
                                    </a>

                                </div>


                                <!-- DYNAMIC NOTIFICATIONS -->

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


                                <!-- EMPTY NOTIFICATIONS -->

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

                            <button type="button"
                                class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                                <span class="mp-avatar sm" data-mini-avatar>DR</span>

                            </button>


                            <!-- PROFILE DROPDOWN -->

                            <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu"
                                style="min-width: 190px;">

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


                <!-- EDIT FORM -->


                <div class="edit-slot-card fade-in">

                    <div class="edit-slot-icon">
                        <i class="bi bi-calendar-check"></i>
                    </div>

                    <h3 class="edit-slot-title">Update Availability</h3>

                    <p class="edit-slot-subtitle">
                        Change your existing availability details below.
                    </p>


                    <!-- MESSAGE -->

                    <asp:Label ID="lblMessage"
                        runat="server"
                        CssClass="edit-message">
                    </asp:Label>


                    <!-- DAY -->

                    <div class="edit-form-group">

                        <label class="edit-label">Available Day</label>

                        <asp:DropDownList ID="ddlDayName"
                            runat="server"
                            CssClass="edit-input">

                            <asp:ListItem Text="Select Day" Value=""></asp:ListItem>
                            <asp:ListItem Text="Monday" Value="Monday"></asp:ListItem>
                            <asp:ListItem Text="Tuesday" Value="Tuesday"></asp:ListItem>
                            <asp:ListItem Text="Wednesday" Value="Wednesday"></asp:ListItem>
                            <asp:ListItem Text="Thursday" Value="Thursday"></asp:ListItem>
                            <asp:ListItem Text="Friday" Value="Friday"></asp:ListItem>
                            <asp:ListItem Text="Saturday" Value="Saturday"></asp:ListItem>
                            <asp:ListItem Text="Sunday" Value="Sunday"></asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <!-- START TIME -->

                    <div class="edit-form-group">

                        <label class="edit-label">Start Time</label>

                        <asp:TextBox ID="txtStartTime"
                            runat="server"
                            TextMode="Time"
                            CssClass="edit-input">
                        </asp:TextBox>

                    </div>


                    <!-- END TIME -->

                    <div class="edit-form-group">

                        <label class="edit-label">End Time</label>

                        <asp:TextBox ID="txtEndTime"
                            runat="server"
                            TextMode="Time"
                            CssClass="edit-input">
                        </asp:TextBox>

                    </div>


                    <!-- BUTTONS -->

                    <div class="d-flex gap-3 edit-buttons">

                        <asp:Button ID="btnUpdate"
                            runat="server"
                            Text="Update Slot"
                            CssClass="edit-btn edit-btn-primary"
                            OnClick="btnUpdate_Click" />

                        <a href="availability.aspx"
                            class="edit-btn edit-btn-secondary">

                            <i class="bi bi-arrow-left"></i>
                            Cancel

                        </a>

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

    <script src="../assets/js/mentor-profile-sync.js?v=2"></script>


    <!-- NOTIFICATION DROPDOWN INITIALIZATION -->

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