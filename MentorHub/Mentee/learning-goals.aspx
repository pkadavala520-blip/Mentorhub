<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="learning-goals.aspx.cs" Inherits="MentorHub.Mentee.learning_goals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Learning Goals</span></div>
          <button type="button" class="btn gradient-btn"><i class="bi bi-plus-lg me-2"></i>Add Goal</button>
        </div>
        <div class="page-header">
          <span class="page-badge"><i class="bi bi-bullseye"></i>My Goals</span>
          <h2 class="fw-bold mt-3 mb-1">Track the milestones on your learning path</h2>
          <p class="text-muted mb-0">Set clear goals with your mentor and watch your progress build up over each session.</p>
        </div>

        <div class="row g-4 mb-4">
          <div class="col-md-4">
            <div class="dashboard-card p-4">
              <p class="text-muted mb-1">Active Goals</p>
              <h3 class="fw-bold mb-0">3</h3>
            </div>
          </div>
          <div class="col-md-4">
            <div class="dashboard-card p-4">
              <p class="text-muted mb-1">Completed</p>
              <h3 class="fw-bold mb-0">5</h3>
            </div>
          </div>
          <div class="col-md-4">
            <div class="dashboard-card p-4">
              <p class="text-muted mb-1">Overall Progress</p>
              <h3 class="fw-bold mb-0">74%</h3>
            </div>
          </div>
        </div>

        <div class="dashboard-card p-4">
          <h5 class="fw-semibold mb-3">Current Milestones</h5>
          <div class="goal-item">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <div>
                <p class="fw-semibold mb-0">Develop a product thinking mindset</p>
                <small class="text-muted">Through weekly mentor sessions with Daniel Ross</small>
              </div>
              <span class="badge bg-success">On Track</span>
            </div>
            <div class="progress"><div class="progress-bar" style="width:80%"></div></div>
          </div>
          <div class="goal-item">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <div>
                <p class="fw-semibold mb-0">Complete three mock interviews</p>
                <small class="text-muted">Target: before August</small>
              </div>
              <span class="badge bg-warning">In Progress</span>
            </div>
            <div class="progress"><div class="progress-bar" style="width:45%"></div></div>
          </div>
          <div class="goal-item">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <div>
                <p class="fw-semibold mb-0">Build a portfolio piece</p>
                <small class="text-muted">Showcasing UX and analytics work</small>
              </div>
              <span class="badge bg-primary">Just Started</span>
            </div>
            <div class="progress"><div class="progress-bar" style="width:20%"></div></div>
          </div>
        </div>
      </main>
</asp:Content>
