<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="edit-profile.aspx.cs" Inherits="MentorHub.Admin.edit_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Edit Profile</span>
            </div>
            <a href="profile.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="dashboard-card p-4" style="max-width: 640px;">
            <h5 class="fw-semibold mb-3">Update Administrator Details</h5>
            <div class="row g-3" onsubmit="return false;">
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Full Name"></asp:Label> <asp:TextBox ID="txtfnm" runat="server" class="form-control" value="Sara Johnson"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Role"></asp:Label> <asp:TextBox ID="txtrl" runat="server" class="form-control" value="Operations Lead"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" class="form-label" Text="Email"></asp:Label> <asp:TextBox ID="txtem" runat="server" class="form-control" value="sara@mentorhub.com"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" class="form-label" Text="Location"></asp:Label> <asp:TextBox ID="txtlcn" runat="server" class="form-control" value="London, UK"></asp:TextBox>
                </div>
                <div class="col-12">
                    <asp:Label ID="Label5" runat="server" class="form-label" Text="Bio"></asp:Label><asp:TextBox ID="txtbio" runat="server"  class="form-control" TextMode="MultiLine" Rows="3" Text="Overseeing platform operations, mentor quality, and learner success at MentorHub."></asp:TextBox>
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
