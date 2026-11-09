<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="recommemded.aspx.cs" Inherits="MentorHub.Mentee.recommemded" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Recommended Matches</span></div>
        </div>
        <div class="row g-4">
          <div class="col-lg-4"><div class="match-card dashboard-card"><img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=900&q=80" alt="Mentor" /><div class="p-4"><h5 class="fw-semibold">Aisha Patel</h5><p class="text-muted">Product Design | 8 years</p><p class="text-muted small">Skills: Figma, UX Strategy</p><button class="btn gradient-btn w-100">Request Mentor</button></div></div></div>
          <div class="col-lg-4"><div class="match-card dashboard-card"><img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=900&q=80" alt="Mentor" /><div class="p-4"><h5 class="fw-semibold">Daniel Ross</h5><p class="text-muted">Software Engineering | 10 years</p><p class="text-muted small">Skills: System Design, Java</p><button class="btn gradient-btn w-100">Request Mentor</button></div></div></div>
        </div>
      </main>
</asp:Content>
