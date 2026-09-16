<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="add-mentor.aspx.cs" Inherits="MentorHub.Admin.add_mentor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Add Mentor</span>
            </div>
            <a href="manage-mentors.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="dashboard-card p-4" style="max-width: 640px;">
            <h5 class="fw-semibold mb-3">Mentor Details</h5>
            <div class="row g-3" onsubmit="return false;">
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Full Name"></asp:Label><asp:TextBox ID="txtmfnm" runat="server" class="form-control" placeholder="e.g. Daniel Ross"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Email"></asp:Label><asp:TextBox ID="txtmem" runat="server" class="form-control" placeholder="mentor@mentorhub.in"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" class="form-label" Text="Domain"></asp:Label><asp:TextBox ID="txtmdmn" runat="server" class="form-control" placeholder="e.g. Software Engineering"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" class="form-label" Text="Skills"></asp:Label><asp:TextBox ID="txtmsk" runat="server" class="form-control" placeholder="e.g. Java, System Design"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" class="form-label" Text="Years of Experience"></asp:Label><asp:TextBox ID="txtmexp" runat="server" class="form-control" min="0"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label6" runat="server" class="form-label" Text="Status"></asp:Label><asp:DropDownList ID="drpmstu" runat="server" class="form-select" AutoPostBack="True">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12">
                    <asp:LinkButton ID="lbtnaddMentore" runat="server" class="btn gradient-btn"><i class="bi bi-check2-circle me-2"></i>Add Mentor</asp:LinkButton>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
