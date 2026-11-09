<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MentorHub.Admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        window.analyticsChartInstance = null;
        window.categoryChartInstance = null;

        function renderAnalyticsChart(months, mentorCounts, menteeCounts) {
            const canvas = document.getElementById('analyticsChart');

            if (!canvas) return;

            if (window.analyticsChartInstance) {
                window.analyticsChartInstance.destroy();
            }

            window.analyticsChartInstance = new Chart(canvas, {
                type: 'bar',
                data: {
                    labels: months,
                    datasets: [
                        {
                            label: 'Mentors Registered',
                            data: mentorCounts,
                            backgroundColor: '#7652ed',
                            borderRadius: 10
                        },
                        {
                            label: 'Mentees Registered',
                            data: menteeCounts,
                            backgroundColor: '#06b6d4',
                            borderRadius: 10
                        }
                    ]
                },
                options: {
                    responsive: true,
                    interaction: {
                        mode: 'index',
                        intersect: false
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        },
                        tooltip: {
                            enabled: true,
                            callbacks: {
                                label: function (context) {
                                    return context.dataset.label + ': ' +
                                        context.parsed.y;
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                precision: 0
                            }
                        }
                    }
                }
            });
        }

        function renderCategoryChart(categories, categoryCounts) {
            const canvas = document.getElementById('categoryChart');

            if (!canvas) return;

            if (window.categoryChartInstance) {
                window.categoryChartInstance.destroy();
            }

            window.categoryChartInstance = new Chart(canvas, {
                type: 'doughnut',
                data: {
                    labels: categories,
                    datasets: [{
                        label: 'Total Mentors',
                        data: categoryCounts,
                        backgroundColor: categories.map(function (_, index) {
                            // unique color per category (no repeats)
                            return 'hsl(' + Math.round((index * 137.508) % 360) + ', 65%, ' + (index % 2 === 0 ? 52 : 62) + '%)';
                        }),
                        borderColor: '#ffffff',
                        borderWidth: 2,
                        hoverOffset: 8
                    }]
                },
                options: {
                    responsive: true,
                    cutout: '60%',
                    plugins: {
                        legend: {
                            display: true,
                            position: 'bottom',
                            labels: {
                                boxWidth: 10,
                                boxHeight: 10,
                                padding: 8,
                                font: { size: 10 },
                                generateLabels: function (chart) {
                                    var ds = chart.data.datasets[0];
                                    return chart.data.labels.map(function (label, i) {
                                        return {
                                            text: label + ' (' + ds.data[i] + ')',
                                            fillStyle: ds.backgroundColor[i],
                                            strokeStyle: ds.backgroundColor[i],
                                            index: i
                                        };
                                    });
                                }
                            }
                        },
                        tooltip: {
                            enabled: true,
                            callbacks: {
                                title: function (items) {
                                    return items[0].label;
                                },
                                label: function (context) {
                                    var total = context.dataset.data.reduce(function (a, b) { return a + b; }, 0);
                                    var pct = total ? Math.round(context.parsed * 100 / total) : 0;
                                    return 'Mentors: ' + context.parsed + ' (' + pct + '%)';
                                }
                            }
                        }
                    }
                }
            });
        }
    </script>


    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <asp:Label ID="Label1" runat="server" class="fw-semibold" Text=""></asp:Label>
            </div>
            <div class="d-flex align-items-center gap-3">
                <i class="bi bi-bell fs-5"></i>
                <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'><defs><linearGradient id='g' x1='0' y1='0' x2='1' y2='1'><stop offset='0' stop-color='%235535e6'/><stop offset='1' stop-color='%23a855f7'/></linearGradient></defs><rect width='200' height='200' fill='url(%23g)'/><circle cx='100' cy='78' r='34' fill='white' fill-opacity='0.92'/><path d='M38 188 C38 128 162 128 162 188 Z' fill='white' fill-opacity='0.92'/></svg>" class="profile-avatar profile-photo profile-photo-empty" data-photo-key="adminProfilePhoto" alt="Profile" />
            </div>
        </div>
        <div class="row g-4 mb-4">
            <div class="col-lg-4 col-md-6">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblTotalMentor" runat="server" Text="Total Mentors"></asp:Label>
                            </p>
                            <h3 class="fw-bold mb-0">
                                <asp:Label ID="lblCountMentor" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="icon-badge">
                            <i class="bi bi-person-workspace"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblTotalMentee" runat="server" Text="Total Mentees"></asp:Label>
                            </p>
                            <h3 class="fw-bold mb-0">
                                <asp:Label ID="lblcountMentee" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="icon-badge">
                            <i class="bi bi-people"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblTotalMatches" runat="server" Text="Total Matches"></asp:Label>
                            </p>
                            <h3 class="fw-bold mb-0">
                                <asp:Label ID="lblCountMatches" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="icon-badge">
                            <i class="bi bi-person-check"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblPending" runat="server" Text="Pending Requests"></asp:Label>
                            </p>
                            <h3 class="fw-bold mb-0">
                                <asp:Label ID="lblCountPending" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="icon-badge">
                            <i class="bi bi-hourglass-split"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblCompleted" runat="server" Text="Completed Sessions"></asp:Label>
                            </p>
                            <h3 class="fw-bold mb-0">
                                <asp:Label ID="lblCountCompleted" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="icon-badge">
                            <i class="bi bi-calendar2-check"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <p class="text-muted mb-1">
                                <asp:Label ID="lblReports" runat="server" Text="Reports"></asp:Label>
                            </p>
                            <h3 class="fw-bold mb-0">
                                <asp:Label ID="lblCountReports" runat="server" Text=""></asp:Label></h3>
                        </div>
                        <div class="icon-badge">
                            <i class="bi bi-file-earmark-bar-graph"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--        Chart--%>
        <div class="row g-4 mb-4">
            <div class="col-lg-7">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="fw-semibold mb-0">Platform Analytics</h5>
                        <span class="badge bg-primary-subtle text-primary">Monthly</span>
                    </div>
                    <canvas id="analyticsChart" height="180"></canvas>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold mb-3">Category Breakdown</h5>
                    <canvas id="categoryChart" height="180"></canvas>
                </div>
            </div>
        </div>

        <%--        GridView--%>
        <div class="dashboard-card p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="fw-semibold mb-0">Recent Matching Requests</h5>
                <a href="matching-requests.aspx" class="btn btn-sm gradient-btn">View All</a>
            </div>
            <div class="table-responsive">
                <table class="table align-middle">
                    <asp:GridView ID="GridView1" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table align-middle"
                        GridLines="None"
                        EmptyDataText="No matching requests found."
                        ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Request ID"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Mentee"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Mentor"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Status"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Date"></asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                    <%--                    <tbody>
                        <tr>
                            <td>#M102</td>
                            <td>Naina Shah</td>
                            <td>Daniel Ross</td>
                            <td><span class="badge bg-warning text-dark">Pending</span></td>
                            <td>22 Jul 2026</td>
                        </tr>
                        <tr>
                            <td>#M103</td>
                            <td>Rohan Verma</td>
                            <td>Meera Singh</td>
                            <td><span class="badge bg-success">Approved</span></td>
                            <td>21 Jul 2026</td>
                        </tr>
                        <tr>
                            <td>#M104</td>
                            <td>Jiya Rao</td>
                            <td>Aisha Patel</td>
                            <td><span class="badge bg-info text-dark">In Review</span></td>
                            <td>20 Jul 2026</td>
                        </tr>
                    </tbody>--%>
                </table>
            </div>
        </div>

        <%--        DataList--%>
        <div class="row g-4 mt-1">
            <div class="col-lg-7">
                <div class="dashboard-card p-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="fw-semibold mb-0">Top Performing Mentors</h5>
                        <a href="manage-mentors.aspx" class="small text-decoration-none">View All</a>
                    </div>
                    <ul class="list-unstyled mb-0 leaderboard-list">
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>
                                <li class="d-flex align-items-center justify-content-between py-2">

                                    <div class="d-flex align-items-center gap-3">
                                        <span class="rank-badge">
                                            <%# Container.ItemIndex + 1 %>
                                        </span>

                                        <div>
                                            <p class="fw-semibold mb-0">
                                                <%# Eval("FullName") %>
                                            </p>

                                            <small class="text-muted">
                                                <%# Eval("Expertise") %>
                                            </small>
                                        </div>
                                    </div>

                                    <div class="text-end">
                                        <span class="badge bg-primary">
                                            <%--                                            <%# Eval("MenteeCount") %>--%>
                                            <i class="bi bi-people-fill ms-1"></i>
                                        </span>

                                        <div>
                                            <small class="text-muted">mentees</small>
                                        </div>
                                    </div>

                                </li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="dashboard-card p-4 h-100">
                    <h5 class="fw-semibold mb-3">Quick Actions</h5>
                    <div class="d-grid gap-2 quick-action-grid">
                        <a href="add-mentor.aspx" class="btn btn-outline-primary text-start"><i class="bi bi-person-plus me-2"></i>Add New Mentor</a> <a href="add-mentee.aspx" class="btn btn-outline-primary text-start"><i class="bi bi-person-add me-2"></i>Add New Mentee</a> <a href="matching-requests.aspx" class="btn btn-outline-primary text-start"><i class="bi bi-diagram-3 me-2"></i>Review Matching Requests</a> <a href="create-announcement.aspx" class="btn btn-outline-primary text-start"><i class="bi bi-megaphone me-2"></i>Post an Announcement</a> <a href="reports.aspx" class="btn btn-outline-primary text-start"><i class="bi bi-file-earmark-bar-graph me-2"></i>Generate Report</a>
                    </div>
                    <hr class="my-3" />
                    <div class="d-flex align-items-start gap-2 system-note">
                        <i class="bi bi-info-circle mt-1"></i><small class="text-muted mb-0">All systems are running normally. Last data sync completed a few minutes ago.</small>
                    </div>
                </div>
            </div>
        </div>

        <%--         Datalist--%>
        <div class="dashboard-card p-4 mt-4">
            <h5 class="fw-semibold mb-3">Recent Activity</h5>
            <ul class="list-unstyled mb-0 activity-feed">
                <li class="d-flex gap-3"><span class="activity-dot bg-primary"></span>
                    <div>
                        <p class="mb-0">
                            New mentor <strong>Sneha Kapoor</strong> was approved and is now live.
                        </p>
                        <small class="text-muted">12 min ago</small>
                    </div>
                </li>
                <li class="d-flex gap-3"><span class="activity-dot bg-success"></span>
                    <div>
                        <p class="mb-0">
                            Matching request <strong>#M103</strong> between Rohan Verma and Meera Singh was approved.
                        </p>
                        <small class="text-muted">1 hour ago</small>
                    </div>
                </li>
                <li class="d-flex gap-3"><span class="activity-dot bg-warning"></span>
                    <div>
                        <p class="mb-0">
                            3 new matching requests are waiting for review.
                        </p>
                        <small class="text-muted">3 hours ago</small>
                    </div>
                </li>
                <li class="d-flex gap-3"><span class="activity-dot bg-info"></span>
                    <div>
                        <p class="mb-0">
                            Monthly platform report for June was generated.
                        </p>
                        <small class="text-muted">Yesterday</small>
                    </div>
                </li>
            </ul>
        </div>
    </main>

</asp:Content>
