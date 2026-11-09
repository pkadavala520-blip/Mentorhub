<%@ Page Title="Dashboard"
    Language="C#"
    MasterPageFile="~/Mentee/Mentee.Master"
    AutoEventWireup="true"
    CodeBehind="Index.aspx.cs"
    Inherits="MentorHub.Mentee.Index" %>


<asp:Content
    ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <main class="content-area p-4">
    <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
        <div>
            <button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false">
                <i class="bi bi-list"></i>
            </button>
            <span class="fw-semibold">Your learning journey</span>
        </div>
        <div class="d-flex align-items-center gap-3">
            <i class="bi bi-bell fs-5"></i>
            <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'><defs><linearGradient id='g' x1='0' y1='0' x2='1' y2='1'><stop offset='0' stop-color='%237c3aed'/><stop offset='1' stop-color='%23d946ef'/></linearGradient></defs><rect width='200' height='200' fill='url(%23g)'/><circle cx='100' cy='78' r='34' fill='white' fill-opacity='0.92'/><path d='M38 188 C38 128 162 128 162 188 Z' fill='white' fill-opacity='0.92'/></svg>" class="profile-avatar profile-photo profile-photo-empty" data-photo-key="menteeProfilePhoto" alt="Profile" />
        </div>
    </div>
                        <!-- ============================================ -->
                        <!-- STAT CARDS -->
                        <!-- ============================================ -->

                        <div class="row g-4 mb-4">
                            <div class="col-lg-4 col-md-6">
                                <div class="dashboard-card p-4">
                                    <p class="text-muted mb-1">
                                        My Mentor
                                    </p>
                                    <h3 class="fw-bold mb-0">
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </h3>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="dashboard-card p-4">
                                    <p class="text-muted mb-1">
                                        Pending Requests
                                    </p>
                                    <h3 class="fw-bold mb-0">2 </h3>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="dashboard-card p-4">
                                    <p class="text-muted mb-1">
                                        Upcoming Sessions
                                    </p>
                                    <h3 class="fw-bold mb-0">4 </h3>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="dashboard-card p-4">
                                    <p class="text-muted mb-1">
                                        Completed Sessions
                                    </p>
                                    <h3 class="fw-bold mb-0">18 </h3>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="dashboard-card p-4">
                                    <p class="text-muted mb-1">
                                        Learning Progress
                                    </p>
                                    <h3 class="fw-bold mb-0">74% </h3>
                                </div>
                            </div>
    </div>



                        <!-- ============================================ -->
                        <!-- LEARNING PATH -->
                        <!-- ============================================ -->

                        <div class="dashboard-card p-4">
                            <h5 class="fw-semibold mb-3">Recommended Learning Path </h5>
                            <div class="table-responsive">
                                <table class="table align-middle">
                                    <thead>
                                        <tr>
                                            <th>Goal</th>
                                            <th>Progress</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Career switch to Product Management </td>
                                            <td>
                                                <div class="progress"
                                                    style="height: 8px;">
                                                    <div
                                                        class="progress-bar"
                                                        style="width: 70%;">
                                                    </div>
                                                </div>
                                            </td>
                                            <td><span class="badge bg-success">On Track </span></td>
                                        </tr>
                                        <tr>
                                            <td>System design prep for interviews </td>
                                            <td>
                                                <div class="progress"
                                                    style="height: 8px;">
                                                    <div
                                                        class="progress-bar"
                                                        style="width: 55%;">
                                                    </div>
                                                </div>
                                            </td>
                                            <td><span class="badge bg-warning text-dark">In Progress </span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
    </div>



                        <!-- ============================================ -->
                        <!-- SUGGESTED MENTORS -->
                        <!-- ============================================ -->

                        <div class="row g-4 mt-1">
                            <div class="col-lg-7">
                                <div class="dashboard-card p-4">
                                    <div class="d-flex
                                justify-content-between
                                align-items-center
                                mb-3">
                                        <h5 class="fw-semibold mb-0">Suggested Mentors for You </h5>
                                        <a href="recommemded.aspx"
                                            class="small text-decoration-none">See All </a>
                                    </div>
                                    <div class="row g-3">
                                        <div class="col-md-4">
                                            <div class="suggested-mentor
                                        text-center
                                        p-3">
                                                <div class="mb-2">
                                                    <i class="bi bi-person-circle"
                                                        style="font-size: 55px;"></i>
                                                </div>
                                                <p class="fw-semibold mb-0">
                                                    Meera Singh
                                                </p>
                                                <small class="text-muted d-block mb-2">Business Consultant </small><a href="find-mentor.aspx"
                                                    class="btn btn-sm btn-outline-primary w-100">Request </a>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="suggested-mentor
                                        text-center
                                        p-3">
                                                <div class="mb-2">
                                                    <i class="bi bi-person-circle"
                                                        style="font-size: 55px;"></i>
                                                </div>
                                                <p class="fw-semibold mb-0">
                                                    Arjun Verma
                                                </p>
                                                <small class="text-muted d-block mb-2">Data Science Manager </small><a href="find-mentor.aspx"
                                                    class="btn btn-sm btn-outline-primary w-100">Request </a>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="suggested-mentor
                                        text-center
                                        p-3">
                                                <div class="mb-2">
                                                    <i class="bi bi-person-circle"
                                                        style="font-size: 55px;"></i>
                                                </div>
                                                <p class="fw-semibold mb-0">
                                                    Rohan Mehta
                                                </p>
                                                <small class="text-muted d-block mb-2">Founder &amp; CTO </small><a href="find-mentor.aspx"
                                                    class="btn btn-sm btn-outline-primary w-100">Request </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <!-- ======================================== -->
                            <!-- UPCOMING SESSIONS -->
                            <!-- ======================================== -->

                            <div class="col-lg-5">
                                <div class="dashboard-card p-4 h-100">
                                    <h5 class="fw-semibold mb-3">Upcoming Sessions </h5>
                                    <ul class="list-unstyled mb-0 session-list">
                                        <li class="d-flex
                                   align-items-center
                                   gap-3 py-2">
                                            <div class="session-date-chip">
                                                <span>24</span> Jul
                                            </div>
                                            <div>
                                                <p class="fw-semibold mb-0">
                                                    1:1 with Daniel Ross
                                                </p>
                                                <small class="text-muted">Interview prep · 5:00 PM </small>
                                            </div>
                                        </li>
                                        <li class="d-flex
                                   align-items-center
                                   gap-3 py-2">
                                            <div class="session-date-chip">
                                                <span>27</span> Jul
                                            </div>
                                            <div>
                                                <p class="fw-semibold mb-0">
                                                    System design review
                                                </p>
                                                <small class="text-muted">With Daniel Ross · 6:30 PM </small>
                                            </div>
                                        </li>
                                        <li class="d-flex
                                   align-items-center
                                   gap-3 py-2">
                                            <div class="session-date-chip">
                                                <span>02</span> Aug
                                            </div>
                                            <div>
                                                <p class="fw-semibold mb-0">
                                                    Portfolio walkthrough
                                                </p>
                                                <small class="text-muted">With Daniel Ross · 4:00 PM </small>
                                            </div>
                                        </li>
                                    </ul>
                                    <a href="schedule.aspx"
                                        class="btn gradient-btn w-100 mt-2">View Full Schedule </a>
                                </div>
                            </div>
    </div>



                        <!-- ============================================ -->
                        <!-- MILESTONES -->
                        <!-- ============================================ -->

                        <div class="dashboard-card p-4 mt-4">
                            <h5 class="fw-semibold mb-3">Your Milestones </h5>
                            <div class="row g-3">
                                <div class="col-6 col-md-3">
                                    <div class="milestone-chip
                                text-center
                                p-3">
                                        <i class="bi bi-award"></i>
                                        <p class="fw-semibold mb-0 mt-2">
                                            First Session
                                        </p>
                                        <small class="text-muted">Completed </small>
                                    </div>
                                </div>
                                <div class="col-6 col-md-3">
                                    <div class="milestone-chip
                                text-center
                                p-3">
                                        <i class="bi bi-graph-up-arrow"></i>
                                        <p class="fw-semibold mb-0 mt-2">
                                            5 Sessions Streak
                                        </p>
                                        <small class="text-muted">Completed </small>
                                    </div>
                                </div>
                                <div class="col-6 col-md-3">
                                    <div class="milestone-chip
                                text-center
                                p-3">
                                        <i class="bi bi-bullseye"></i>
                                        <p class="fw-semibold mb-0 mt-2">
                                            First Goal Set
                                        </p>
                                        <small class="text-muted">Completed </small>
                                    </div>
                                </div>
                                <div class="col-6 col-md-3">
                                    <div class="milestone-chip
                                text-center
                                p-3 locked">
                                        <i class="bi bi-trophy"></i>
                                        <p class="fw-semibold mb-0 mt-2">
                                            20 Sessions
                                        </p>
                                        <small class="text-muted">2 to go </small>
                                    </div>
                                </div>
                            </div>
    </div>
    </main>
</asp:Content>



