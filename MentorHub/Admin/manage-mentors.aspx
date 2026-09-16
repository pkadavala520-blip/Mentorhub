<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manage-mentors.aspx.cs" Inherits="MentorHub.Admin.manage_mentors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <main class="flex-grow-1 content-area p-4">
          <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
              <div>
                  <span class="fw-semibold">Mentor Administration</span></div>
              <a href="add-mentor.aspx" class="btn gradient-btn"><i class="bi bi-plus-lg me-2"></i>Add Mentor</a>
          </div>
          <div class="page-header">
              <span class="page-badge"><i class="bi bi-person-workspace"></i>Manage Mentors</span>
              <h2 class="fw-bold mt-3 mb-1">Mentor directory and approvals</h2>
              <p class="text-muted mb-0">Review expert profiles, monitor participation, and keep mentor quality high across the platform.</p>
          </div>
          <div class="row g-4 mb-4">
              <div class="col-md-4">
                  <div class="dashboard-card p-4">
                      <p class="text-muted mb-1">Verified Mentors</p>
                      <h3 class="fw-bold">184</h3>
                  </div>
              </div>
              <div class="col-md-4">
                  <div class="dashboard-card p-4">
                      <p class="text-muted mb-1">Pending Approval</p>
                      <h3 class="fw-bold">21</h3>
                  </div>
              </div>
              <div class="col-md-4">
                  <div class="dashboard-card p-4">
                      <p class="text-muted mb-1">Inactive Mentors</p>
                      <h3 class="fw-bold">13</h3>
                  </div>
              </div>
          </div>
          <div class="dashboard-card p-4">
              <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-2">
                  <h5 class="fw-semibold mb-0">Mentor Directory</h5>
                  <div class="d-flex gap-2 flex-wrap">
                      <asp:TextBox ID="txtsmentor" runat="server" class="form-control form-control-sm" style="width: 220px" placeholder="Search mentor"></asp:TextBox>
                      <asp:Button ID="btnfilter" runat="server" class="btn btn-outline-secondary btn-sm" Text="Filter" />
                  </div>
              </div>
              <div class="table-responsive">
                  <table class="table align-middle">
                      <thead>
                          <tr>
                              <th>Photo</th>
                              <th>Name</th>
                              <th>Domain</th>
                              <th>Skills</th>
                              <th>Rating</th>
                              <th>Status</th>
                              <th>Action</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td>
                                  <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80" class="table-avatar" alt="mentor" /></td>
                              <td>Daniel Ross<br />
                                  <small class="text-muted">daniel@mentorhub.in</small></td>
                              <td>Software Engineering</td>
                              <td>Java, System Design</td>
                              <td>4.9</td>
                              <td><span class="badge bg-success">Active</span></td>
                              <td>
                                  <div class="d-flex gap-2"><a href="mentor-details.aspx" class="btn btn-sm btn-outline-primary">Edit</a><a href="#" class="btn btn-sm btn-outline-danger">Delete</a></div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80" class="table-avatar" alt="mentor" /></td>
                              <td>Aisha Patel<br />
                                  <small class="text-muted">aisha@mentorhub.in</small></td>
                              <td>Product Design</td>
                              <td>UI/UX, Strategy</td>
                              <td>4.8</td>
                              <td><span class="badge bg-warning text-dark">Pending</span></td>
                              <td>
                                  <div class="d-flex gap-2"><a href="mentor-details.aspx" class="btn btn-sm btn-outline-primary">Review</a><a href="#" class="btn btn-sm btn-outline-danger">Delete</a></div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=80" class="table-avatar" alt="mentor" /></td>
                              <td>Meera Singh<br />
                                  <small class="text-muted">meera@mentorhub.in</small></td>
                              <td>Business Growth</td>
                              <td>Leadership, Consulting</td>
                              <td>5.0</td>
                              <td><span class="badge bg-success">Active</span></td>
                              <td>
                                  <div class="d-flex gap-2"><a href="mentor-details.aspx" class="btn btn-sm btn-outline-primary">Edit</a><a href="#" class="btn btn-sm btn-outline-danger">Delete</a></div>
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
