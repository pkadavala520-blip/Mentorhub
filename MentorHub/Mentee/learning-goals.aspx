<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="learning-goals.aspx.cs" Inherits="MentorHub.Mentee.learning_goals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Learning Goals</span></div>
        </div>
        <div class="dashboard-card p-4">
          <h5 class="fw-semibold mb-3">Current Milestones</h5>
          <ul class="list-group list-group-flush">
            <li class="list-group-item px-0">Develop a product thinking mindset through weekly mentor sessions.</li>
            <li class="list-group-item px-0">Complete three mock interviews before August.</li>
            <li class="list-group-item px-0">Build a portfolio piece showcasing UX and analytics work.</li>
          </ul>
        </div>
      </main>
</asp:Content>
