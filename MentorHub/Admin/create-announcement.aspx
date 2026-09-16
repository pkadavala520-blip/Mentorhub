<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="create-announcement.aspx.cs" Inherits="MentorHub.Admin.create_announcement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Create Notice</span>
            </div>
            <a href="announcements.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left me-2"></i>Back</a>
        </div>
        <div class="dashboard-card p-4" style="max-width: 640px;">
            <h5 class="fw-semibold mb-3">New Announcement</h5>
            <div class="row g-3" onsubmit="return false;">
                <div class="col-12">
                    <asp:Label ID="Label1" runat="server" class="form-label" Text="Title"></asp:Label><asp:TextBox ID="txttle" runat="server" class="form-control" placeholder="e.g. Summer Mentor Sprint"></asp:TextBox>
                </div>
                <div class="col-12">
                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Message"></asp:Label><asp:TextBox ID="txtmsg" runat="server" class="form-control" TextMode="MultiLine" Rows="4" placeholder="Write the announcement details"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" class="form-label" Text="Audience"></asp:Label><asp:DropDownList ID="drpaud" runat="server" class="form-select" AutoPostBack="True">
                        <asp:ListItem>Everyone</asp:ListItem>
                        <asp:ListItem>Mentors</asp:ListItem>
                        <asp:ListItem>Mentees</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-12">
                    <asp:LinkButton ID="lbtnaddpn" runat="server" class="btn gradient-btn"><i class="bi bi-send me-2"></i>Publish Notice</asp:LinkButton>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
