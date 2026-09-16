<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manage-mentees.aspx.cs" Inherits="MentorHub.Admin.manage_mentees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Mentee Administration</span>
            </div>
            <a href="add-mentee.aspx" class="btn gradient-btn"><i class="bi bi-plus-lg me-2"></i>Add Mentee</a>
        </div>
        <div class="page-header">
            <span class="page-badge"><i class="bi bi-people"></i>Manage Mentees</span>
            <h2 class="fw-bold mt-3 mb-1">Student and professional learner directory</h2>
            <p class="text-muted mb-0">Monitor learner engagement, requests, and progress across all mentorship journeys.</p>
        </div>
        <div class="row g-4 mb-4">
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <p class="text-muted mb-1">Active Learners</p>
                    <h3 class="fw-bold">1,184</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <p class="text-muted mb-1">New This Month</p>
                    <h3 class="fw-bold">116</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <p class="text-muted mb-1">Onboarding Pending</p>
                    <h3 class="fw-bold">24</h3>
                </div>
            </div>
        </div>
        <div class="dashboard-card p-4">
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-2">
                <h5 class="fw-semibold mb-0">Registered Mentees</h5>
                <div class="d-flex gap-2 flex-wrap">
                    <asp:TextBox ID="txtsearch" runat="server" class="form-control form-control-sm" style="width: 220px" placeholder="Search learner"></asp:TextBox>
                    <asp:Button ID="btnfilter" runat="server" class="btn btn-outline-secondary btn-sm" Text="Filter" />
                </div>
            </div>
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Education</th>
                            <th>Interests</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <img src="https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=200&q=80" class="table-avatar" alt="mentee" /></td>
                            <td>Naina Shah<br />
                                <small class="text-muted">naina@studentmail.com</small></td>
                            <td>B.Tech Computer Science</td>
                            <td>Product Management</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>
                                <div class="d-flex gap-2"><a href="mentee-details.aspx" class="btn btn-sm btn-outline-primary">View</a><a href="#" class="btn btn-sm btn-outline-danger">Remove</a></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&q=80" class="table-avatar" alt="mentee" /></td>
                            <td>Rohan Verma<br />
                                <small class="text-muted">rohan@careermail.com</small></td>
                            <td>MBA Candidate</td>
                            <td>Leadership, Strategy</td>
                            <td><span class="badge bg-warning text-dark">Pending</span></td>
                            <td>
                                <div class="d-flex gap-2"><a href="mentee-details.aspx" class="btn btn-sm btn-outline-primary">Review</a><a href="#" class="btn btn-sm btn-outline-danger">Remove</a></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=80" class="table-avatar" alt="mentee" /></td>
                            <td>Jiya Rao<br />
                                <small class="text-muted">jiya@designmail.com</small></td>
                            <td>Design Student</td>
                            <td>UX Research</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>
                                <div class="d-flex gap-2"><a href="mentee-details.aspx" class="btn btn-sm btn-outline-primary">View</a><a href="#" class="btn btn-sm btn-outline-danger">Remove</a></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
