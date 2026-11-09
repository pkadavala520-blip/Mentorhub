<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="MentorHub.Admin.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button>
                <span class="fw-semibold">Feedback Management</span></div>
        </div>
        <div class="page-header">
          <span class="page-badge"><i class="bi bi-star"></i>Feedback</span>
          <h2 class="fw-bold mt-3 mb-1">See how mentees rate their sessions</h2>
          <p class="text-muted mb-0">Monitor satisfaction across the platform and spot mentors who need a closer look.</p>
        </div>
        <div class="row g-4 mb-4">
          <div class="col-md-4">
            <div class="dashboard-card p-4">
              <p class="text-muted mb-1">Average Rating</p>
              <h3 class="fw-bold mb-0">4.8 <i class="bi bi-star-fill text-warning fs-6"></i></h3>
            </div>
          </div>
          <div class="col-md-4">
            <div class="dashboard-card p-4">
              <p class="text-muted mb-1">Total Reviews</p>
              <h3 class="fw-bold mb-0">1,042</h3>
            </div>
          </div>
          <div class="col-md-4">
            <div class="dashboard-card p-4">
              <p class="text-muted mb-1">Flagged for Review</p>
              <h3 class="fw-bold mb-0">3</h3>
            </div>
          </div>
        </div>
        <div class="dashboard-card p-4">
            <h5 class="fw-semibold mb-3">Recent Feedback</h5>
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Mentor</th>
                            <th>Feedback</th>
                            <th>Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Naina Shah</td>
                            <td>Daniel Ross</td>
                            <td>Clear guidance and actionable advice.</td>
                            <td><span class="badge bg-success">5.0 <i class="bi bi-star-fill ms-1"></i></span></td>
                        </tr>
                        <tr>
                            <td>Rohan Verma</td>
                            <td>Meera Singh</td>
                            <td>Great leadership perspective and thoughtful recommendations.</td>
                            <td><span class="badge bg-success">4.8 <i class="bi bi-star-fill ms-1"></i></span></td>
                        </tr>
                        <tr>
                            <td>Jiya Rao</td>
                            <td>Aisha Patel</td>
                            <td>Helped me structure my design portfolio review.</td>
                            <td><span class="badge bg-success">4.9 <i class="bi bi-star-fill ms-1"></i></span></td>
                        </tr>
                        <tr>
                            <td>Aarav Mehta</td>
                            <td>Rohan Mehta</td>
                            <td>Session felt rushed, would like more time for questions.</td>
                            <td><span class="badge bg-warning">3.6 <i class="bi bi-star-fill ms-1"></i></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
