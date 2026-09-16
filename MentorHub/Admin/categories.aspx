<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="MentorHub.Admin.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Categories</span></div>
            <a href="add-category.aspx" class="btn gradient-btn"><i class="bi bi-plus-lg me-2"></i>Add Category</a>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold">Technology</h5>
                    <p class="text-muted mb-0">120 mentors</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold">Design</h5>
                    <p class="text-muted mb-0">54 mentors</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold">Business</h5>
                    <p class="text-muted mb-0">41 mentors</p>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
