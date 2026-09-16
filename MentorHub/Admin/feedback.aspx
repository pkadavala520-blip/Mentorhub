<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="MentorHub.Admin.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Feedback Management</span></div>
        </div>
        <div class="dashboard-card p-4">
            <h5 class="fw-semibold mb-3">Recent Feedback</h5>
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Mentor</th>
                            <th>Feedback</th>
                            <th>Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Naina Shah</td>
                            <td>Daniel Ross</td>
                            <td>Clear guidance and actionable advice.</td>
                            <td>5.0</td>
                        </tr>
                        <tr>
                            <td>Rohan Verma</td>
                            <td>Meera Singh</td>
                            <td>Great leadership perspective and thoughtful recommendations.</td>
                            <td>4.8</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
