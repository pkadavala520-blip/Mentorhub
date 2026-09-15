<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Index" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Dashboard | MentorHub</title>
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=1" />
  </head>
  <body class="mentor-shell" data-page="dashboard">
    <div class="d-flex">
      <aside class="sidebar mp-sidebar">
        <div class="mp-brand">
          <div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div>
          <div class="mp-brand-text"><h4>MentorHub</h4><span>Mentor Panel</span></div>
        </div>
        <nav class="mp-nav nav flex-column">
          <div class="mp-nav-section-label">Overview</div>
          <a class="nav-link active" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
          <a class="nav-link" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
          <a class="nav-link" href="my-skills.aspx"><i class="bi bi-lightbulb"></i><span>My Skills</span></a>
          <div class="mp-nav-section-label">Mentoring</div>
          <a class="nav-link" href="availability.aspx"><i class="bi bi-calendar2-week"></i><span>Availability</span></a>
          <a class="nav-link" href="requests.aspx"><i class="bi bi-ui-checks"></i><span>Matching Requests</span><span class="mp-nav-badge" data-badge="requests">0</span></a>
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

        <div class="mp-hero mb-4 fade-in">
          <div class="mp-hero-content d-flex flex-wrap justify-content-between align-items-center gap-3">
            <div>
              <span class="mp-page-eyebrow" style="background:rgba(255,255,255,0.18);color:#fff;"><i class="bi bi-stars"></i>Your mentor workspace</span>
              <h2 class="fw-bold mt-3 mb-1"> <span data-profile-name>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span> </h2>
              <p class="mb-0" style="opacity:.9;">Here's what's happening with your mentees today.</p>
            </div>
            <div class="d-flex gap-2">
              <a href="requests.aspx" class="mp-btn" style="background:rgba(255,255,255,0.16);color:#fff;"><i class="bi bi-ui-checks"></i>Review Requests</a>
              <a href="schedule.aspx" class="mp-btn" style="background:#fff;color:var(--mp-primary);"><i class="bi bi-calendar2-plus"></i>View Schedule</a>
            </div>
          </div>
        </div>

        <div class="row g-4 mb-4 mp-stagger">
          <div class="col-lg-4 col-md-6 fade-in">
            <div class="mp-stat">
              <div class="mp-stat-icon mp-bg-indigo"><i class="bi bi-people-fill"></i></div>
              <div><div class="mp-stat-value" data-stat="mentees" data-countup="14">0</div><div class="mp-stat-label">My Mentees</div></div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 fade-in">
            <div class="mp-stat">
              <div class="mp-stat-icon mp-bg-sky"><i class="bi bi-calendar2-event-fill"></i></div>
              <div><div class="mp-stat-value" data-stat="sessions" data-countup="6">0</div><div class="mp-stat-label">Upcoming Sessions</div></div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 fade-in">
            <div class="mp-stat">
              <div class="mp-stat-icon mp-bg-amber"><i class="bi bi-hourglass-split"></i></div>
              <div><div class="mp-stat-value" data-stat="pending" data-countup="3">0</div><div class="mp-stat-label">Pending Requests</div></div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 fade-in">
            <div class="mp-stat">
              <div class="mp-stat-icon mp-bg-green"><i class="bi bi-check2-circle"></i></div>
              <div><div class="mp-stat-value" data-stat="completed" data-countup="48">0</div><div class="mp-stat-label">Completed Sessions</div></div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 fade-in">
            <div class="mp-stat">
              <div class="mp-stat-icon mp-bg-pink"><i class="bi bi-star-fill"></i></div>
              <div><div class="mp-stat-value" data-stat="rating" data-countup="4.9" data-decimals="1">0</div><div class="mp-stat-label">Average Rating</div></div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 fade-in">
            <div class="mp-card p-4 h-100 d-flex flex-column justify-content-center">
              <span class="text-muted small mb-1">Quick actions</span>
              <div class="d-flex flex-wrap gap-2">
                <a href="add-slot.aspx" class="mp-btn mp-btn-soft btn-sm"><i class="bi bi-plus-lg"></i>Add Slot</a>
                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm"><i class="bi bi-chat-dots"></i>Messages</a>
              </div>
            </div>
          </div>
        </div>

        <div class="row g-4">
          <div class="col-lg-7 fade-in">
            <div class="mp-card p-4 h-100">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="fw-semibold mb-0">Session Summary</h5>
                <span class="mp-chip accepted">Last 6 months</span>
              </div>
              <canvas id="mentorChart" height="180"></canvas>
            </div>
          </div>
          <div class="col-lg-5 fade-in">
            <div class="mp-card p-4 h-100">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="fw-semibold mb-0">Recent Requests</h5>
                <a href="requests.aspx" class="small">View all</a>
              </div>
              <ul class="list-group list-group-flush" data-recent-requests></ul>
            </div>
          </div>
        </div>

        <div class="row g-4 mt-1">
          <div class="col-12 fade-in">
            <div class="mp-card p-4">
              <h5 class="fw-semibold mb-3">Recent Activity</h5>
              <div class="mp-timeline" data-activity-feed></div>
            </div>
          </div>
        </div>

      </main>
    </div>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/chartjs/chart.umd.js"></script>
        <script src="../assets/js/mentor-app.js?v=1"></script>
    <script>
      new Chart(document.getElementById('mentorChart'), {
        type: 'line',
        data: {
          labels: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
          datasets: [{
            label: 'Sessions',
            data: [8, 7, 10, 9, 11, 12],
            borderColor: '#4f46e5',
            backgroundColor: 'rgba(79,70,229,0.15)',
            pointBackgroundColor: '#4f46e5',
            fill: true,
            tension: 0.4
          }]
        },
        options: {
          responsive: true,
          plugins: { legend: { display: false } },
          scales: { y: { beginAtZero: true, grid: { color: 'rgba(79,70,229,0.08)' } }, x: { grid: { display: false } } }
        }
      });
    </script>
  </body>
</html>
