<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="announcements.aspx.cs" Inherits="MentorHub.Admin.announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Announcements</span></div>
            <a href="create-announcement.aspx" class="btn gradient-btn"><i class="bi bi-plus-lg me-2"></i>Create Notice</a>
        </div>
        <div class="dashboard-card p-4">
            <h5 class="fw-semibold mb-3">Latest Platform Updates</h5>
            <div class="card mb-3 border-0 bg-light">
                <div class="card-body">
                    <h6 class="fw-semibold">Summer Mentor Sprint</h6>
                    <p class="text-muted mb-0">A new mentoring initiative is now open for applications. Interested mentors can enrol before 31 July.</p>
                </div>
            </div>
            <div class="card border-0 bg-light">
                <div class="card-body">
                    <h6 class="fw-semibold">Weekly Live Q&A</h6>
                    <p class="text-muted mb-0">Every Friday, leadership mentors will host a live discussion for mentees seeking career advice.</p>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
