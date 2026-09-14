<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Schedule" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Schedule | MentorHub</title>
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../assets/css/styles.css?v=7" />
  <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=7" />
</head>
<body class="mentor-shell" data-page="schedule">
<div class="d-flex mentor-layout">
  <aside class="sidebar mp-sidebar">
    <div class="mp-brand"><div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div><div class="mp-brand-text"><h4>MentorHub</h4><span>Mentor Panel</span></div></div>
    <nav class="mp-nav nav flex-column">
      <div class="mp-nav-section-label">Overview</div>
      <a class="nav-link" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
      <a class="nav-link" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
      <a class="nav-link" href="my-skills.aspx"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>
      <div class="mp-nav-section-label">Mentoring</div>
      <a class="nav-link" href="availability.aspx"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>
      <a class="nav-link" href="requests.aspx"><i class="bi bi-ui-checks"></i><span>Matching Requests</span><span class="mp-nav-badge" data-badge="requests">0</span></a>
      <a class="nav-link" href="mentees.aspx"><i class="bi bi-people"></i><span>My Mentees</span></a>
      <a class="nav-link" href="messages.aspx"><i class="bi bi-chat-dots"></i><span>Messages</span><span class="mp-nav-badge" data-badge="messages">0</span></a>
      <a class="nav-link active" href="schedule.aspx"><i class="bi bi-calendar2-event"></i><span>Schedule</span></a>
      <div class="mp-nav-section-label">Insights</div>
      <a class="nav-link" href="feedback.aspx"><i class="bi bi-star"></i><span>Feedback</span></a>
      <a class="nav-link" href="notifications.aspx"><i class="bi bi-bell"></i><span>Notifications</span></a>
      <a class="nav-link" href="settings.aspx"><i class="bi bi-gear"></i><span>Settings</span></a>
    </nav>
    <div class="mp-sidebar-footer"><div class="mp-mini-profile mb-2"><span class="mp-avatar sm" data-mini-avatar>DR</span><div class="mp-mini-profile-text"><strong data-mini-name>Daniel Ross</strong><span><span class="mp-status-dot d-inline-block me-1"></span>Active now</span></div></div><a class="nav-link mp-danger" href="../Home/SignIn_up.aspx"><i class="bi bi-box-arrow-right"></i><span>Logout</span></a></div>
  </aside>
  <main class="flex-grow-1 content-area p-4">
    <div class="mp-topbar mb-4">
      <div class="d-flex align-items-center gap-3 flex-grow-1"><button class="mp-mobile-toggle" data-sidebar-toggle aria-label="Open navigation"><i class="bi bi-list"></i></button><div class="mp-search d-none d-md-block"><i class="bi bi-search"></i><input type="text" placeholder="Search mentees, requests, sessions…" /></div></div>
      <div class="d-flex align-items-center gap-2"><button class="mp-icon-btn" type="button" data-dark-toggle title="Toggle dark mode"><i class="bi bi-moon-stars"></i></button><div class="dropdown"><button class="mp-icon-btn" data-bs-toggle="dropdown" aria-expanded="false" title="Notifications"><i class="bi bi-bell"></i><span class="mp-dot" data-notif-dot></span></button><div class="dropdown-menu dropdown-menu-end mp-dropdown-menu"><div class="d-flex justify-content-between align-items-center px-2 pb-2"><strong>Notifications</strong><a href="notifications.aspx" class="small">View all</a></div><div data-notif-list></div></div></div><div class="dropdown"><button class="btn p-0 border-0 bg-transparent" data-bs-toggle="dropdown"><span class="mp-avatar sm" data-mini-avatar>DR</span></button><div class="dropdown-menu dropdown-menu-end mp-dropdown-menu"><a class="dropdown-item rounded-3" href="profile.aspx"><i class="bi bi-person me-2"></i>My Profile</a><a class="dropdown-item rounded-3" href="settings.aspx"><i class="bi bi-gear me-2"></i>Settings</a><hr class="my-1"/><a class="dropdown-item rounded-3 text-danger" href="../Home/SignIn_up.aspx"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></div></div></div>
    </div>
    <div class="mp-page-head fade-in"><div><span class="mp-page-eyebrow"><i class="bi bi-calendar2-event"></i>Schedule</span><h2>Session calendar</h2><p>Plan mentoring sessions, review your calendar, and join upcoming meetings.</p></div><div class="d-flex gap-2"><button class="mp-btn mp-btn-outline" data-cal-today><i class="bi bi-calendar-check"></i>Today</button><button class="mp-btn mp-btn-primary" data-add-session><i class="bi bi-plus-lg"></i>Add Session</button><button class="mp-btn mp-btn-primary" id="mpJoinMeetingBtn"><i class="bi bi-camera-video"></i>Join Meeting</button></div></div>
    <div class="row g-4">
      <div class="col-xl-8 fade-in"><section class="mp-card p-4 h-100"><div class="mp-calendar-head"><div class="mp-calendar-head-left"><button class="mp-cal-nav-btn" data-cal-prev aria-label="Previous month"><i class="bi bi-chevron-left"></i></button><h5 data-cal-label>September 2026</h5><button class="mp-cal-nav-btn" data-cal-next aria-label="Next month"><i class="bi bi-chevron-right"></i></button></div><span class="mp-chip accepted"><i class="bi bi-circle-fill"></i>Session day</span></div><div class="mp-cal-grid" data-cal-grid></div></section></div>
      <div class="col-xl-4 fade-in"><section class="mp-card p-4 h-100"><div class="d-flex justify-content-between align-items-center mb-3"><h5 class="fw-semibold mb-0">Upcoming Sessions</h5><span class="mp-mini-label">September</span></div><ul class="mp-upcoming-list" data-upcoming-list></ul></section></div>
    </div>
  </main>
</div>

<div class="modal fade" id="mpDayModal" tabindex="-1" aria-hidden="true"><div class="modal-dialog modal-dialog-centered"><div class="modal-content mp-modal"><div class="modal-header"><h5 class="modal-title" data-modal-date>September 24, 2026</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div><div class="modal-body p-0"><div data-day-sessions></div></div><div class="modal-footer"><button type="button" class="mp-btn mp-btn-outline" data-bs-dismiss="modal">Close</button><button type="button" class="mp-btn mp-btn-primary" data-schedule-this-day><i class="bi bi-plus-lg"></i>Schedule for this day</button></div></div></div></div>
<div class="modal fade" id="mpAddSessionModal" tabindex="-1" aria-hidden="true"><div class="modal-dialog modal-dialog-centered"><div class="modal-content mp-modal"><form data-add-session-form><div class="modal-header"><h5 class="modal-title">Add mentoring session</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div><div class="modal-body"><div class="row g-3"><div class="col-md-6"><label class="form-label">Date</label><input class="form-control" type="date" name="date" required /></div><div class="col-md-6"><label class="form-label">Time</label><input class="form-control" type="time" name="time" value="19:00" required /></div><div class="col-md-6"><label class="form-label">Mentee</label><select class="form-select" name="mentee" required><option>Naina Shah</option><option>Rohan Verma</option><option>Priya Nair</option></select></div><div class="col-md-6"><label class="form-label">Session title</label><input class="form-control" name="title" value="Mentoring Session" required /></div></div></div><div class="modal-footer"><button type="button" class="mp-btn mp-btn-outline" data-bs-dismiss="modal">Cancel</button><button class="mp-btn mp-btn-primary" type="submit"><i class="bi bi-check2-circle"></i>Save Session</button></div></form></div></div></div>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script><script src="../assets/js/mentor-app.js?v=7"></script>
</body></html>
