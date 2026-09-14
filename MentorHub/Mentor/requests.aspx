<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requests.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Requests" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Matching Requests | MentorHub</title>
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=1" />
  </head>
  <body class="mentor-shell" data-page="requests">
    <div class="d-flex">
      <aside class="sidebar mp-sidebar">
        <div class="mp-brand">
          <div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div>
          <div class="mp-brand-text"><h4>MentorHub</h4><span>Mentor Panel</span></div>
        </div>
        <nav class="mp-nav nav flex-column">
          <div class="mp-nav-section-label">Overview</div>
          <a class="nav-link" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
          <a class="nav-link" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
          <a class="nav-link" href="my-skills.aspx"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>
          <div class="mp-nav-section-label">Mentoring</div>
          <a class="nav-link" href="availability.aspx"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>
          <a class="nav-link active" href="requests.aspx"><i class="bi bi-ui-checks"></i><span>Matching Requests</span><span class="mp-nav-badge" data-badge="requests">0</span></a>
          <a class="nav-link" href="mentees.aspx"><i class="bi bi-people"></i><span>My Mentees</span></a>
          <a class="nav-link" href="messages.aspx"><i class="bi bi-chat-dots"></i><span>Messages</span><span class="mp-nav-badge" data-badge="messages">0</span></a>
          <a class="nav-link" href="schedule.aspx"><i class="bi bi-calendar2-event"></i><span>Schedule</span></a>
          <div class="mp-nav-section-label">Insights</div>
          <a class="nav-link" href="feedback.aspx"><i class="bi bi-star"></i><span>Feedback</span></a>
          <a class="nav-link" href="notifications.aspx"><i class="bi bi-bell"></i><span>Notifications</span></a>
          <a class="nav-link" href="settings.aspx"><i class="bi bi-gear"></i><span>Settings</span></a>
        </nav>
        <div class="mp-sidebar-footer">
          <div class="mp-mini-profile mb-2">
            <span class="mp-avatar sm" data-mini-avatar>DR</span>
            <div class="mp-mini-profile-text"><strong data-mini-name>Daniel Ross</strong><span><span class="mp-status-dot d-inline-block me-1"></span>Active now</span></div>
          </div>
          <a class="nav-link mp-danger" href="../Home/SignIn_up.aspx"><i class="bi bi-box-arrow-right"></i><span>Logout</span></a>
        </div>
      </aside>

      <main class="flex-grow-1 content-area p-4">
        <div class="mp-topbar mb-4">
          <div class="d-flex align-items-center gap-3">
            <button class="btn btn-outline-secondary sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button>
            <div class="mp-search d-none d-md-block">
              <i class="bi bi-search"></i>
              <input type="text" placeholder="Search mentees, requests, sessions…" />
            </div>
          </div>
          <div class="d-flex align-items-center gap-2">
            <label class="mp-icon-btn" title="Toggle dark mode" style="cursor:pointer;">
              <input type="checkbox" data-dark-toggle class="visually-hidden" />
              <i class="bi bi-moon-stars"></i>
            </label>
            <div class="dropdown">
              <button class="mp-icon-btn" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-bell"></i><span class="mp-dot" data-notif-dot></span></button>
              <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu">
                <div class="d-flex justify-content-between align-items-center px-2 pb-2"><strong>Notifications</strong><a href="notifications.aspx" class="small">View all</a></div>
                <div data-notif-list></div>
              </div>
            </div>
            <div class="dropdown">
              <button class="d-flex align-items-center gap-2 btn p-0 border-0 bg-transparent" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="mp-avatar sm" data-mini-avatar>DR</span>
              </button>
              <div class="dropdown-menu dropdown-menu-end mp-dropdown-menu" style="min-width:190px;">
                <a class="dropdown-item rounded-3" href="profile.aspx"><i class="bi bi-person me-2"></i>My Profile</a>
                <a class="dropdown-item rounded-3" href="settings.aspx"><i class="bi bi-gear me-2"></i>Settings</a>
                <hr class="my-1" />
                <a class="dropdown-item rounded-3 text-danger" href="../Home/SignIn_up.aspx"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
              </div>
            </div>
          </div>
        </div>

        <div class="mb-4 fade-in">
          <span class="mp-page-eyebrow"><i class="bi bi-ui-checks"></i>Matching Requests</span>
          <h2 class="fw-bold mt-3 mb-1">Review mentee matching requests</h2>
          <p class="text-muted mb-0">Accept requests to start mentoring, or decline when it's not the right fit.</p>
        </div>

        <div class="mp-card p-4 fade-in">
          <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-3">
            <div class="mp-tabs">
              <span class="mp-tab active" data-request-tab="all">All</span>
              <span class="mp-tab" data-request-tab="pending">Pending</span>
              <span class="mp-tab" data-request-tab="accepted">Accepted</span>
              <span class="mp-tab" data-request-tab="rejected">Rejected</span>
            </div>
            <div class="mp-search" style="max-width:260px;">
              <i class="bi bi-search"></i>
              <input type="text" placeholder="Search requests…" data-request-search />
            </div>
          </div>
          <div class="d-flex flex-column gap-3" data-request-list></div>
        </div>

      </main>
    </div>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/mentor-app.js?v=1"></script>
  </body>
</html>
