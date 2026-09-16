<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add-category.aspx.cs" Inherits="MentorHub.Admin.add_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Add Category</span>
            </div>
            <a href="categories.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="dashboard-card p-4" style="max-width: 560px;">
            <h5 class="fw-semibold mb-3">New Category</h5>
            <div class="row g-3" onsubmit="return false;">
                <div class="col-12">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Category Name"></asp:Label><asp:TextBox ID="txtcnm" runat="server" class="form-control" placeholder="e.g. Data & Analytics"></asp:TextBox>
                </div>
                <div class="col-12">
                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Description"></asp:Label><asp:TextBox ID="txtdesc" runat="server" class="form-control" TextMode="MultiLine" Rows="3" placeholder="Briefly describe this category"></asp:TextBox>
                </div>
                <div class="col-12">
                    <asp:LinkButton ID="addCat" runat="server" class="btn gradient-btn"><i class="bi bi-check2-circle me-2"></i>Add Category</asp:LinkButton>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
