<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="MentorHub.Admin.settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="flex-grow-1 content-area p-4">

        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Platform Settings</span>
            </div>
        </div>

        <div class="dashboard-card p-4">

            <h5 class="fw-semibold mb-3">Configuration</h5>

            <div class="row g-3">

                <div class="col-12">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Platform Name"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" value="MentorHub"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Email Notifications"></asp:Label>

                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-select">
                        <asp:ListItem>Enabled</asp:ListItem>
                        <asp:ListItem>Disabled</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="Label13" runat="server" class="form-label" Text="Auto Match Approval"></asp:Label>

                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-select">
                        <asp:ListItem>Enabled</asp:ListItem>
                        <asp:ListItem>Manual Review</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-12">
                    <asp:Button ID="Button1" runat="server" class="btn gradient-btn" Text="Save Changes" />
                </div>

            </div>

        </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>

</asp:Content>