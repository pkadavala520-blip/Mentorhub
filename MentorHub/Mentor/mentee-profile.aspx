<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mentee-profile.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Mentee_Profile" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentee Profile | MentorHub</title>
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=1" />
  </head>
  <body class="mentor-shell" data-page="mentee-profile">
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
          <a class="nav-link" href="requests.aspx"><i class="bi bi-ui-checks"></i><span>Matching Requests</span><span class="mp-nav-badge" data-badge="requests">0</span></a>
          <a class="nav-link active" href="mentees.aspx"><i class="bi bi-people"></i><span>My Mentees</span></a>
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

        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4 fade-in">
          <div>
            <span class="mp-page-eyebrow"><i class="bi bi-person-badge"></i>Mentee Profile</span>
            <h2 class="fw-bold mt-3 mb-1">Mentoring relationship overview</h2>
          </div>
          <a href="mentees.aspx" class="mp-btn mp-btn-outline"><i class="bi bi-arrow-left"></i>Back</a>
        </div>

        <div class="mp-card p-4 fade-in">
          <div class="row g-4 align-items-center">
            <div class="col-lg-3 text-center">
              <span class="mp-avatar lg mx-auto" data-mentee-avatar>NS</span>
              <h5 class="fw-bold mt-3 mb-0" data-mentee-name>Naina Shah</h5>
              <p class="text-muted small" data-mentee-goal>Career transition into product management</p>
              <div class="d-flex justify-content-center gap-2">
                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm"><i class="bi bi-chat-dots"></i>Message</a>
                <a href="schedule.aspx" class="mp-btn mp-btn-outline btn-sm"><i class="bi bi-calendar2-plus"></i>Schedule</a>
              </div>
            </div>
            <div class="col-lg-9">
              <div class="row g-3">
                <div class="col-md-6"><div class="mp-panel p-3"><h6 class="fw-semibold"><i class="bi bi-bullseye me-2 text-primary"></i>Focus Area</h6><p class="mb-0 text-muted" data-mentee-focus>Product Management</p></div></div>
                <div class="col-md-6"><div class="mp-panel p-3"><h6 class="fw-semibold"><i class="bi bi-clock-history me-2 text-primary"></i>Last Session</h6><p class="mb-0 text-muted" data-mentee-last>2 days ago</p></div></div>
                <div class="col-md-6"><div class="mp-panel p-3"><h6 class="fw-semibold"><i class="bi bi-check2-circle me-2 text-primary"></i>Sessions Completed</h6><p class="mb-0 text-muted" data-mentee-sessions>8</p></div></div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-graph-up-arrow me-2 text-primary"></i>Progress <span class="float-end text-primary" data-mentee-progress>72%</span></h6>
                    <div class="mp-skill-bar mt-2"><div data-mentee-progress-bar></div></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </main>
    </div>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/mentor-app.js?v=1"></script>
  </body>
</html>
