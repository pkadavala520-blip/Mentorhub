<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="MentorHub.Mentor.Mentor_Profile" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Profile | MentorHub</title>
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/styles.css?v=6" />
    <link rel="stylesheet" href="../assets/css/mentor-panel.css?v=1" />
  </head>
  <body class="mentor-shell" data-page="profile">
    <div class="d-flex">
      <aside class="sidebar mp-sidebar">
        <div class="mp-brand">
          <div class="mp-brand-mark"><i class="bi bi-mortarboard-fill"></i></div>
          <div class="mp-brand-text"><h4>MentorHub</h4><span>Mentor Panel</span></div>
        </div>
        <nav class="mp-nav nav flex-column">
          <div class="mp-nav-section-label">Overview</div>
          <a class="nav-link" href="index.aspx"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a>
          <a class="nav-link active" href="profile.aspx"><i class="bi bi-person"></i><span>My Profile</span></a>
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

        <div class="d-flex justify-content-between align-items-start flex-wrap gap-3 mb-4 fade-in">
          <div>
            <span class="mp-page-eyebrow"><i class="bi bi-person-lines-fill"></i>My Profile</span>
            <h2 class="fw-bold mt-3 mb-1">Professional profile and experience summary</h2>
            <p class="text-muted mb-0">Create a polished mentor identity with your background, focus areas, and availability.</p>
          </div>
          <button type="button" class="mp-btn mp-btn-primary" data-edit-profile-btn><i class="bi bi-pencil-square"></i>Edit Profile</button>
        </div>

        <div class="mp-card p-4 fade-in">
          <div class="row g-4">
            <div class="col-lg-4 text-center">
              <div class="profile-photo-wrap mb-3" data-photo-key="mentorProfilePhoto">
                <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'><rect width='200' height='200' fill='%23eef0f3'/><circle cx='100' cy='78' r='38' fill='%23a9b4c2'/><path d='M28 192 C28 128 172 128 172 192 Z' fill='%23a9b4c2'/></svg>" class="rounded-circle profile-photo profile-photo-empty" style="width: 180px; height: 180px; object-fit: cover;" alt="Mentor" />
                <button type="button" class="photo-edit-btn" aria-label="Change profile photo" title="Change profile photo">+</button>
              </div>
              <h4 class="fw-bold mb-0" data-profile-name>Daniel Ross</h4>
              <p class="text-muted" data-profile-title>Lead Software Engineer | 10+ Years Experience</p>
              <div class="text-warning mb-2"><i class="bi bi-star-fill"></i> <span data-profile-rating>4.8</span> (<span data-profile-reviews>128</span> reviews)</div>
              <div class="d-flex justify-content-center gap-2 flex-wrap">
                <a href="messages.aspx" class="mp-btn mp-btn-soft btn-sm"><i class="bi bi-chat-dots"></i>Message a Mentee</a>
                <a href="settings.aspx" class="mp-btn mp-btn-outline btn-sm"><i class="bi bi-gear"></i>Account Settings</a>
              </div>
            </div>
            <div class="col-lg-8">
              <h5 class="fw-semibold mb-3">Professional Overview</h5>
              <p class="text-muted" data-profile-bio>I help students and professionals improve their software engineering skills through hands-on mentorship, interview prep, and career strategy.</p>
              <div class="row g-3 mt-2">
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-mortarboard me-2 text-primary"></i>Education</h6>
                    <p class="mb-0 text-muted" data-profile-education>M.Tech in Computer Science</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-briefcase me-2 text-primary"></i>Experience</h6>
                    <p class="mb-0 text-muted" data-profile-experience>10+ years at Microsoft & Google</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-lightbulb me-2 text-primary"></i>Top Skills</h6>
                    <p class="mb-0 text-muted" data-profile-skills>Java, Python, System Design</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mp-panel p-3">
                    <h6 class="fw-semibold"><i class="bi bi-calendar2-week me-2 text-primary"></i>Availability</h6>
                    <p class="mb-0 text-muted" data-profile-availability>Mon-Fri, 7pm-10pm</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Edit Profile Modal -->
        <div class="modal fade" id="mpEditProfileModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius:1.1rem; border:none;">
              <form>
                <div class="modal-header">
                  <h5 class="modal-title fw-semibold">Edit Profile</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="mb-3"><label class="form-label">Full Name</label><input class="form-control" name="name" /></div>
                  <div class="mb-3"><label class="form-label">Title</label><input class="form-control" name="title" /></div>
                  <div class="mb-0"><label class="form-label">Professional Overview</label><textarea class="form-control" name="bio" rows="4"></textarea></div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="mp-btn mp-btn-outline" data-bs-dismiss="modal">Cancel</button>
                  <button type="submit" class="mp-btn mp-btn-primary"><i class="bi bi-check2-circle"></i>Save Changes</button>
                </div>
              </form>
            </div>
          </div>
        </div>

      </main>
    </div>

    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/mentor-app.js?v=1"></script>
  </body>
</html>
