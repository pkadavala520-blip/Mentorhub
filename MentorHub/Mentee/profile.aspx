<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="MentorHub.Mentee.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Student Profile</span></div>
          <a href="edit-profile.aspx" class="btn gradient-btn"><i class="bi bi-pencil me-2"></i>Edit Profile</a>
        </div>
        <div class="page-header">
          <span class="page-badge"><i class="bi bi-person-vcard"></i>My Profile</span>
          <h2 class="fw-bold mt-3 mb-1">Student profile and personal goals</h2>
          <p class="text-muted mb-0">Keep your career direction, preferred domains, and learning interests clearly visible to your mentor.</p>
        </div>
        <div class="glass-card p-4">
          <div class="row g-4 align-items-center">
            <div class="col-lg-4 text-center">
              <div class="profile-photo-wrap mb-3" data-photo-key="menteeProfilePhoto">
                <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'><rect width='200' height='200' fill='%23eef0f3'/><circle cx='100' cy='78' r='38' fill='%23a9b4c2'/><path d='M28 192 C28 128 172 128 172 192 Z' fill='%23a9b4c2'/></svg>" class="rounded-circle profile-photo profile-photo-empty" style="width:180px;height:180px;object-fit:cover;" alt="Mentee" />
                <button type="button" class="photo-edit-btn" aria-label="Change profile photo" title="Change profile photo">+</button>
              </div>
              <h4 class="fw-bold mt-3">Naina Shah</h4>
              <p class="text-muted">B.Tech Computer Science Student</p>
            </div>
            <div class="col-lg-8">
              <div class="row g-3">
                <div class="col-md-6"><div class="dashboard-card p-3"><h6 class="fw-semibold">Education</h6><p class="mb-0 text-muted">B.Tech, IIT Delhi</p></div></div>
                <div class="col-md-6"><div class="dashboard-card p-3"><h6 class="fw-semibold">Interests</h6><p class="mb-0 text-muted">Product Management, AI</p></div></div>
                <div class="col-md-6"><div class="dashboard-card p-3"><h6 class="fw-semibold">Skills</h6><p class="mb-0 text-muted">Python, Data Analysis</p></div></div>
                <div class="col-md-6"><div class="dashboard-card p-3"><h6 class="fw-semibold">Career Goal</h6><p class="mb-0 text-muted">Transition to Product Manager</p></div></div>
              </div>
            </div>
          </div>
        </div>
      </main>
</asp:Content>
