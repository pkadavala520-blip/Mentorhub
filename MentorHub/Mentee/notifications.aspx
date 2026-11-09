<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="notifications.aspx.cs" Inherits="MentorHub.Mentee.notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Notifications</span></div>
        </div>
        <div class="dashboard-card p-4">
          <ul class="list-group list-group-flush">
            <li class="list-group-item px-0">A reminder: your session with Daniel Ross is tomorrow at 6:00 PM.</li>
            <li class="list-group-item px-0">Your request for leadership coaching was approved.</li>
            <li class="list-group-item px-0">New resources were added to your learning path.</li>
          </ul>
        </div>
      </main>
</asp:Content>
