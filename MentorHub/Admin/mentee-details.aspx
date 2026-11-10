<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="mentee-details.aspx.cs" Inherits="MentorHub.Admin.mentee_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Mentee Details</span>
            </div>
            <a href="manage-mentees.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="glass-card p-4">
            <div class="row g-4 align-items-center">
                <div class="col-lg-3 text-center">
<<<<<<< HEAD
                    <asp:Image ID="MenteePhoto" runat="server" class="rounded-circle" style="width: 150px; height: 150px; object-fit: cover;" alt="Mentee"/>
                    <h5 class="fw-bold mt-3 mb-0">
                        <asp:Label ID="lblnm" runat="server" Text=""></asp:Label></h5>
                    <p class="text-muted small">
                        <asp:Label ID="lbledu" runat="server" Text=""></asp:Label></p>
                    <span class="badge bg-success">
                        <asp:Label ID="lblstu" runat="server" Text=""></asp:Label></span>
=======
                    <img src="https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=300&q=80" class="rounded-circle" style="width: 150px; height: 150px; object-fit: cover;" alt="Mentee" />
                    <h5 class="fw-bold mt-3 mb-0">Naina Shah</h5>
                    <p class="text-muted small">B.Tech Computer Science</p>
                    <span class="badge bg-success">Active</span>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                </div>
                <div class="col-lg-9">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
<<<<<<< HEAD
                                <h6 class="fw-semibold">
                                    <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label></h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblem" runat="server" Text=""></asp:Label>
                                </p>
=======
                                <h6 class="fw-semibold">Email</h6>
                                <p class="mb-0 text-muted">naina@studentmail.com</p>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
<<<<<<< HEAD
                                <h6 class="fw-semibold">
                                    <asp:Label ID="Label2" runat="server" Text="Interests"></asp:Label></h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblint" runat="server" Text=""></asp:Label></p>
=======
                                <h6 class="fw-semibold">Interests</h6>
                                <p class="mb-0 text-muted">Product Management</p>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
<<<<<<< HEAD
                                <h6 class="fw-semibold">
                                    <asp:Label ID="Label6" runat="server" Text="Assigned Mentor"></asp:Label></h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lblAssignMentor" runat="server" Text=""></asp:Label></p>
=======
                                <h6 class="fw-semibold">Assigned Mentor</h6>
                                <p class="mb-0 text-muted">Daniel Ross</p>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
<<<<<<< HEAD
                                <h6 class="fw-semibold">
                                    <asp:Label ID="Label8" runat="server" Text="Joined"></asp:Label></h6>
                                <p class="mb-0 text-muted">
                                    <asp:Label ID="lbljoind" runat="server" Text=""></asp:Label></p>
=======
                                <h6 class="fw-semibold">Joined</h6>
                                <p class="mb-0 text-muted">March 2026</p>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="dashboard-card p-4 mt-4" style="max-width: 640px;">
            <h5 class="fw-semibold mb-3">Edit Mentee</h5>
            <form class="row g-3" onsubmit="return false;">
                <div class="col-md-6">
<<<<<<< HEAD
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Full Name"></asp:Label><asp:TextBox ID="txtfnm" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" class="form-label" Text="Education"></asp:Label><asp:TextBox ID="txtedu" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" class="form-label" Text="Interests"></asp:Label><asp:TextBox ID="txtint" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" class="form-label" Text="Status"></asp:Label><asp:DropDownList ID="drpstu" runat="server" class="form-select" AutoPostBack="False">
=======
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Full Name"></asp:Label><asp:TextBox ID="txtfnm" runat="server" class="form-control" value="Naina Shah"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" class="form-label" Text="Education"></asp:Label><asp:TextBox ID="txtedu" runat="server" class="form-control" value="B.Tech Computer Science"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" class="form-label" Text="Interests"></asp:Label><asp:TextBox ID="txtint" runat="server" class="form-control" value="Product Management"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" class="form-label" Text="Status"></asp:Label><asp:DropDownList ID="drpstu" runat="server" class="form-select" AutoPostBack="True">
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                        <asp:ListItem Selected="True">Active</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12">
<<<<<<< HEAD
                    <asp:Button ID="Button1" runat="server" class="btn gradient-btn" Text="Save Changes" OnClick="Button1_Click" />
=======
                    <asp:Button ID="Button1" runat="server" class="btn gradient-btn" Text="Save Changes" />
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                </div>
            </form>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
