<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="MentorHub.Mentee.schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Session Schedule</span></div>
          <a href="#" class="btn gradient-btn"><i class="bi bi-camera-video me-2"></i>Join Session</a>
        </div>
        <div class="row g-4">
          <div class="col-lg-7"><div class="dashboard-card p-4"><h5 class="fw-semibold mb-3">July Calendar</h5><div class="border rounded-4 p-3 text-center text-muted">Interactive calendar view for upcoming sessions.</div></div></div>
          <div class="col-lg-5"><div class="dashboard-card p-4"><h5 class="fw-semibold mb-3">Upcoming</h5><ul class="list-group list-group-flush"><li class="list-group-item px-0">23 Jul — Career roadmap session</li><li class="list-group-item px-0">25 Jul — Mock interview review</li></ul></div></div>
        </div>
      </main>
</asp:Content>
