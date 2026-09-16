<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="mentor-details.aspx.cs" Inherits="MentorHub.Admin.mentor_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Mentor Details</span>
            </div>
            <a href="manage-mentors.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="glass-card p-4">
            <div class="row g-4 align-items-center">
                <div class="col-lg-3 text-center">
                    <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=300&q=80" class="rounded-circle" style="width: 150px; height: 150px; object-fit: cover;" alt="Mentor" />
                    <h5 class="fw-bold mt-3 mb-0">Daniel Ross</h5>
                    <p class="text-muted small">Lead Software Engineer · Microsoft</p>
                    <span class="badge bg-success">Active</span>
                </div>
                <div class="col-lg-9">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Email</h6>
                                <p class="mb-0 text-muted">daniel@mentorhub.in</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Domain</h6>
                                <p class="mb-0 text-muted">Software Engineering</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Skills</h6>
                                <p class="mb-0 text-muted">Java, System Design</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Rating</h6>
                                <p class="mb-0 text-muted"><i class="bi bi-star-fill text-warning me-1"></i>4.9</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="dashboard-card p-4 mt-4" style="max-width: 640px;">
            <h5 class="fw-semibold mb-3">Edit Mentor</h5>
            <div class="row g-3" onsubmit="return false;">
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Full Name"></asp:Label><asp:TextBox ID="txtmfnm" runat="server" class="form-control" value="Daniel Ross"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" class="form-label" Text="Domain"></asp:Label><asp:TextBox ID="txtmdmn" runat="server" class="form-control" value="Software Engineering"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" class="form-label" Text="Skills"></asp:Label><asp:TextBox ID="txtmsk" runat="server" class="form-control" value="Java, System Design"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label6" runat="server" class="form-label" Text="Status"></asp:Label><asp:DropDownList ID="drpmstu" runat="server" class="form-select" AutoPostBack="True">
                        <asp:ListItem Selected="True">Active</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12">
                    <asp:Button ID="btnscng" runat="server" class="btn gradient-btn" Text="Save Changes" />
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
