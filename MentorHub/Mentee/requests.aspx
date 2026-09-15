<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="requests.aspx.cs" Inherits="MentorHub.Mentee.requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
          <div><button class="btn btn-outline-secondary me-3 sidebar-toggle-btn" data-sidebar-toggle aria-label="Toggle navigation menu" aria-expanded="false"><i class="bi bi-list"></i></button><span class="fw-semibold">Request History</span></div>
        </div>
        <div class="dashboard-card p-4">
          <div class="table-responsive">
            <table class="table align-middle">
              <thead><tr><th>Mentor</th><th>Topic</th><th>Status</th></tr></thead>
              <tbody>
                <tr><td>Meera Singh</td><td>Leadership Growth</td><td><span class="badge bg-warning text-dark">Pending</span></td></tr>
                <tr><td>Daniel Ross</td><td>System Design</td><td><span class="badge bg-success">Approved</span></td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </main>
</asp:Content>
