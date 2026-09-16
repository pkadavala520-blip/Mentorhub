<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="MentorHub.Admin.reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Analytics Reports</span></div>
            <a href="#" class="btn gradient-btn"><i class="bi bi-download me-2"></i>Export PDF</a>
        </div>
        <div class="page-header">
            <span class="page-badge"><i class="bi bi-graph-up-arrow"></i>Reports</span>
            <h2 class="fw-bold mt-3 mb-1">Data-driven insights for mentorship growth</h2>
            <p class="text-muted mb-0">Monitor monthly engagement, mentor distribution, and platform activity from one place.</p>
        </div>
        <div class="row g-4 mb-4">
            <div class="col-lg-7">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold mb-3">Monthly Engagement</h5>
                    <canvas id="adminReportChart" height="190"></canvas>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold mb-3">Mentor Distribution</h5>
                    <canvas id="adminCategoryChart" height="190"></canvas>
                </div>
            </div>
        </div>
        <div class="dashboard-card p-4">
            <h5 class="fw-semibold mb-3">Recent Activity</h5>
            <ul class="list-group list-group-flush">
                <li class="list-group-item px-0">12 new mentor registrations received this week.</li>
                <li class="list-group-item px-0">36 matching requests approved automatically.</li>
                <li class="list-group-item px-0">Two sessions were marked as completed with feedback.</li>
            </ul>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>
    <script src="../assets/js/main.js"></script>
    <script>
        new Chart(document.getElementById('adminReportChart'), {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{ label: 'Sessions', data: [180, 220, 245, 270, 310, 340], backgroundColor: ['#4f46e5', '#7c3aed', '#4f46e5', '#7c3aed', '#4f46e5', '#7c3aed'] }]
            },
            options: { responsive: true, plugins: { legend: { display: false } } }
        });
        new Chart(document.getElementById('adminCategoryChart'), {
            type: 'doughnut',
            data: {
                labels: ['Engineering', 'Design', 'Business', 'Education'],
                datasets: [{ data: [42, 24, 18, 16], backgroundColor: ['#4f46e5', '#7c3aed', '#22c55e', '#f59e0b'] }]
            },
            options: { responsive: true, plugins: { legend: { position: 'bottom' } } }
        });
    </script>
</asp:Content>
