<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="MentorHub.Admin.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Administrator Profile</span>
            </div>
            <a href="edit-profile.aspx" class="btn gradient-btn"><i class="bi bi-pencil me-2"></i>Edit Profile</a>
        </div>
        <div class="glass-card p-4">
            <div class="row g-4 align-items-center">
                <div class="col-lg-4 text-center">
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=300&q=80" class="rounded-circle" style="width: 180px; height: 180px; object-fit: cover;" alt="Admin" />
                    <h4 class="fw-bold mt-3">Sara Johnson</h4>
                    <p class="text-muted">Platform Administrator</p>
                </div>
                <div class="col-lg-8">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Email</h6>
                                <p class="mb-0 text-muted">sara@mentorhub.com</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Role</h6>
                                <p class="mb-0 text-muted">Operations Lead</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Location</h6>
                                <p class="mb-0 text-muted">London, UK</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="dashboard-card p-3">
                                <h6 class="fw-semibold">Joined</h6>
                                <p class="mb-0 text-muted">January 2024</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
