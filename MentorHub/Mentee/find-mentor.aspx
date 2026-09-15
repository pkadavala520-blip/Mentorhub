<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="find-mentor.aspx.cs" Inherits="MentorHub.Mentee.find_mentor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div>
            <button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button>
            <span class="fw-semibold">Find the perfect mentor</span>
          </div>
        </div>

        <div class="page-header">
          <span class="page-badge"><i class="bi bi-search-heart"></i>Find Mentor</span>
          <h2 class="fw-bold mt-3 mb-1">Search mentors by expertise, industry, and availability</h2>
          <p class="text-muted mb-0">Choose a guide who can support your career goal, technical skill, or confidence-building effort.</p>
        </div>

        <div class="glass-card p-4 mb-4">
          <div class="row g-3">
            <div class="col-md-4">
              <input type="text" class="form-control" placeholder="Search mentor" />
            </div>
            <div class="col-md-3">
              <select class="form-select"><option>Skill</option><option>Design</option><option>Software</option></select>
            </div>
            <div class="col-md-3">
              <select class="form-select"><option>Domain</option><option>AI</option><option>Product</option></select>
            </div>
            <div class="col-md-2">
              <button class="btn gradient-btn w-100">Search</button>
            </div>
          </div>
        </div>

        <div class="row g-4">
          <div class="col-lg-4">
            <div class="match-card dashboard-card">
              <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=900&q=80" alt="Mentor" />
              <div class="p-4">
                <h5 class="fw-semibold">Aisha Patel</h5>
                <p class="text-muted mb-2">Senior Product Designer</p>
                <p class="small text-muted">Skills: UI/UX, Figma, Product Strategy</p>
                <p class="small text-muted">Availability: Mon, Wed</p>
                <div class="text-warning mb-3"><i class="bi bi-star-fill"></i> 4.9</div>
                <button class="btn gradient-btn w-100">Request Mentor</button>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="match-card dashboard-card">
              <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=900&q=80" alt="Mentor" />
              <div class="p-4">
                <h5 class="fw-semibold">Daniel Ross</h5>
                <p class="text-muted mb-2">Lead Software Engineer</p>
                <p class="small text-muted">Skills: Java, Python, System Design</p>
                <p class="small text-muted">Availability: Tue, Thu</p>
                <div class="text-warning mb-3"><i class="bi bi-star-fill"></i> 4.8</div>
                <button class="btn gradient-btn w-100">Request Mentor</button>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="match-card dashboard-card">
              <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=900&q=80" alt="Mentor" />
              <div class="p-4">
                <h5 class="fw-semibold">Meera Singh</h5>
                <p class="text-muted mb-2">Business Consultant</p>
                <p class="small text-muted">Skills: Strategy, Leadership, Growth</p>
                <p class="small text-muted">Availability: Fri, Sat</p>
                <div class="text-warning mb-3"><i class="bi bi-star-fill"></i> 5.0</div>
                <button class="btn gradient-btn w-100">Request Mentor</button>
              </div>
            </div>
          </div>
        </div>
      </main>
</asp:Content>
