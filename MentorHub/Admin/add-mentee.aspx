<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add-mentee.aspx.cs" Inherits="MentorHub.Admin.add_mentee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Add Mentee</span>
            </div>
            <a href="manage-mentees.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="dashboard-card p-4" style="max-width: 640px;">
            <h5 class="fw-semibold mb-3">Mentee Details</h5>
            <div class="row g-3" onsubmit="return false;">
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Full Name"></asp:Label><asp:TextBox ID="txtfnm" runat="server" class="form-control" placeholder="e.g. Naina Shah"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Email"></asp:Label><asp:TextBox ID="txtem" runat="server" class="form-control" placeholder="learner@studentmail.com"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" class="form-label" Text="Education"></asp:Label><asp:TextBox ID="txtedu" runat="server" class="form-control" placeholder="e.g. B.Tech Computer Science"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" class="form-label" Text="Interests"></asp:Label><asp:TextBox ID="txtint" runat="server" class="form-control" placeholder="e.g. Product Management"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" class="form-label" Text="Status"></asp:Label><asp:DropDownList ID="drpstu" runat="server" class="form-select" AutoPostBack="True">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12">
                    <asp:LinkButton ID="lbtnaddMentee" runat="server" class="btn gradient-btn"><i class="bi bi-check2-circle me-2"></i>Add Mentee</asp:LinkButton>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
