<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="sessions.aspx.cs" Inherits="MentorHub.Admin.sessions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Session Oversight</span></div>
        </div>
        <div class="row g-4">
            <div class="col-lg-7">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold mb-3">Upcoming Sessions</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item px-0">20 Jul — Daniel Ross with Naina Shah <span class="float-end text-muted">10:00 AM</span></li>
                        <li class="list-group-item px-0">21 Jul — Meera Singh with Rohan Verma <span class="float-end text-muted">3:00 PM</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold mb-3">Completed Sessions</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item px-0">18 Jul — Aisha Patel with Jiya Rao</li>
                        <li class="list-group-item px-0">17 Jul — Daniel Ross with Asha</li>
                    </ul>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
