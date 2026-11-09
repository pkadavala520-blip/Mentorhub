<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="MentorHub.Mentee.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Feedback</span></div>
        </div>
        <div class="row g-4">
          <div class="col-lg-7">
            <div class="dashboard-card p-4">
              <h5 class="fw-semibold mb-3">Recent Feedback</h5>
              <div class="border rounded-4 p-3 mb-3">
                <div class="d-flex justify-content-between mb-2"><strong>Daniel Ross</strong><span class="text-warning"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></span></div>
                <p class="mb-0 text-muted">“Your communication and preparedness have improved a lot this month.”</p>
              </div>
              <div class="border rounded-4 p-3">
                <div class="d-flex justify-content-between mb-2"><strong>Mentor Hub</strong><span class="text-warning"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></span></div>
                <p class="mb-0 text-muted">“You are progressing well and completing milestones on time.”</p>
              </div>
            </div>
          </div>
          <div class="col-lg-5">
            <div class="dashboard-card p-4">
              <h5 class="fw-semibold mb-3">Share Reflection</h5>
              <textarea class="form-control mb-3" rows="5" placeholder="Write a quick reflection for your mentor..."></textarea>
              <button class="btn gradient-btn">Submit</button>
            </div>
          </div>
        </div>
      </main>
</asp:Content>
