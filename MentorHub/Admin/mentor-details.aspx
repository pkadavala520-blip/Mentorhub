<%@ Page Title="Mentor Details" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="mentor-details.aspx.cs" Inherits="MentorHub.Admin.mentor_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">

        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Mentor Details</span>
            </div>
            <a href="manage-mentors.aspx" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left me-2"></i>Back
            </a>
        </div>

        <div class="glass-card p-4">
            <div class="row g-4 align-items-center">

                <div class="col-lg-3 text-center">
                    <asp:Image ID="MentorPhoto" runat="server"
                        CssClass="rounded-circle"
                        Style="width:150px;height:150px;object-fit:cover;"
                        AlternateText="Mentor" />

                    <h5 class="fw-bold mt-3 mb-0">
                        <asp:Label ID="lblnm" runat="server"></asp:Label>
                    </h5>

                    <p class="text-muted small">
                        <asp:Label ID="lblCom" runat="server"></asp:Label>
                    </p>

                    <span class="badge bg-success">
                        <asp:Label ID="lblstu" runat="server"></asp:Label>
                    </span>
                </div>

                <div class="col-lg-9">
                    <div class="row g-3">

                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Email</h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblem" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Domain</h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblDom" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Skills</h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblSkl" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Experience</h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblExp" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <div class="dashboard-card p-4 mt-4" style="max-width:640px;">
            <h5 class="fw-semibold mb-3">Edit Mentor</h5>

            <div class="row g-3">

                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server"
                        CssClass="form-label" Text="Full Name"></asp:Label>
                    <asp:TextBox ID="txtmfnm" runat="server"
                        CssClass="form-control" MaxLength="100"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server"
                        CssClass="form-label" Text="Domain"></asp:Label>
                    <asp:TextBox ID="txtmdmn" runat="server"
                        CssClass="form-control" MaxLength="100"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server"
                        CssClass="form-label" Text="Skills"></asp:Label>
                    <asp:TextBox ID="txtmsk" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="Label6" runat="server"
                        CssClass="form-label" Text="Status"></asp:Label>
                    <asp:DropDownList ID="drpmstu" runat="server"
                        CssClass="form-select">
                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-12">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    <asp:Button ID="btnscng" runat="server"
                        CssClass="btn gradient-btn"
                        Text="Save Changes"
                        OnClick="btnscng_Click" />
                </div>

            </div>
        </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>