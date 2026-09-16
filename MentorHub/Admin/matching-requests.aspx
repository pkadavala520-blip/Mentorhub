<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="matching-requests.aspx.cs" Inherits="MentorHub.Admin.matching_requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Matching Queue</span>
            </div>
        </div>
        <div class="page-header">
            <span class="page-badge"><i class="bi bi-send-check"></i>Matching Requests</span>
            <h2 class="fw-bold mt-3 mb-1">Approve, assign, and monitor mentor matches</h2>
            <p class="text-muted mb-0">Each request includes mentor preference, learning goal, and status for quick administration.</p>
        </div>
        <div class="dashboard-card p-4">
            <h5 class="fw-semibold mb-3">Pending mentor-mentee requests</h5>
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>Mentee</th>
                            <th>Preferred Skill</th>
                            <th>Recommended Mentor</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Naina Shah<br />
                                <small class="text-muted">Career shift into product</small></td>
                            <td>Product Strategy</td>
                            <td>Daniel Ross</td>
                            <td><span class="badge bg-warning text-dark">Pending</span></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <asp:Button ID="btnapp" runat="server" class="btn btn-sm btn-success" Text="Approve" />
                                    <asp:Button ID="btnrej" runat="server" class="btn btn-sm btn-outline-danger" Text="Reject" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Rohan Verma<br />
                                <small class="text-muted">Leadership coaching</small></td>
                            <td>Leadership</td>
                            <td>Meera Singh</td>
                            <td><span class="badge bg-info text-dark">Review</span></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <asp:Button ID="btnass" runat="server" class="btn btn-sm btn-outline-primary" Text="Assign" />
                                    <asp:Button ID="btnreje" runat="server" class="btn btn-sm btn-outline-danger" Text="Reject" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Jiya Rao<br />
                                <small class="text-muted">Portfolio and UX prep</small></td>
                            <td>UX Research</td>
                            <td>Aisha Patel</td>
                            <td><span class="badge bg-success">Approved</span></td>
                            <td>
                                <asp:Button ID="btnview" runat="server" class="btn btn-sm btn-outline-primary" Text="View" />
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
