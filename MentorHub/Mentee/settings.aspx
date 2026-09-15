<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="MentorHub.Mentee.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Account Settings</span></div>
        </div>
        <div class="dashboard-card p-4">
          <div class="row g-4">
            <div class="col-md-6">
              <label class="form-label">Display Name</label>
              <input class="form-control" value="Aisha Patel" />
            </div>
            <div class="col-md-6">
              <label class="form-label">Email</label>
              <input class="form-control" value="aisha@example.com" />
            </div>
            <div class="col-12">
              <div class="form-check form-switch"><input class="form-check-input" type="checkbox" checked /><label class="form-check-label">Enable email reminders</label></div>
            </div>
            <div class="col-12"><button class="btn gradient-btn">Save Changes</button></div>
          </div>
        </div>
      </main>
</asp:Content>
