<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="edit-profile.aspx.cs" Inherits="MentorHub.Mentee.edit_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Edit Profile</span></div>
          <a href="profile.html" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="dashboard-card p-4" style="max-width:640px;">
          <h5 class="fw-semibold mb-3">Update Your Details</h5>
          <form class="row g-3" onsubmit="return false;">
            <div class="col-md-6"><label class="form-label">Full Name</label><input class="form-control" placeholder="Your full name" /></div>
            <div class="col-md-6"><label class="form-label">Email</label><input type="email" class="form-control" placeholder="you@studentmail.com" /></div>
            <div class="col-md-6"><label class="form-label">Education</label><input class="form-control" placeholder="e.g. B.Tech Computer Science" /></div>
            <div class="col-md-6"><label class="form-label">Interests</label><input class="form-control" placeholder="e.g. Product Management" /></div>
            <div class="col-12"><label class="form-label">Career Goals</label><textarea class="form-control" rows="3" placeholder="Share what you're working towards"></textarea></div>
            <div class="col-12"><button class="btn gradient-btn">Save Changes</button></div>
          </form>
        </div>
      </main>
</asp:Content>
