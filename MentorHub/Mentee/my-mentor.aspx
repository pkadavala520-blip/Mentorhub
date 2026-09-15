<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="my-mentor.aspx.cs" Inherits="MentorHub.Mentee.my_mentor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Current Mentor</span></div>
        </div>
        <div class="dashboard-card p-4">
          <h5 class="fw-semibold">Daniel Ross</h5>
          <p class="text-muted">Lead Software Engineer with 10+ years of experience in building scalable applications.</p>
          <p class="mb-0"><strong>Focus:</strong> System design, career growth, interview preparation</p>
        </div>
      </main>
</asp:Content>
