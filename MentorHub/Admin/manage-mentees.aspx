<%@ Page Title="Manage Mentees" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manage-mentees.aspx.cs" Inherits="MentorHub.Admin.manage_mentees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="flex-grow-1 content-area p-4">

        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">

            <div>
                <span class="fw-semibold">Mentee Administration
                </span>
            </div>

            <a href="add-mentee.aspx" class="btn gradient-btn">
                <i class="bi bi-plus-lg me-2"></i>
                Add Mentee
            </a>

        </div>


        <div class="page-header">

            <span class="page-badge">
                <i class="bi bi-people"></i>
                Manage Mentees
            </span>

            <h2 class="fw-bold mt-3 mb-1">Mentee Directory
            </h2>

            <p class="text-muted mb-0">
                Review and manage all registered mentees on the MentorHub platform.
            </p>

        </div>


        <div class="row g-4 mb-4">

            <div class="col-md-4">

                <div class="dashboard-card p-4">

                    <p class="text-muted mb-1">
                        Total Mentees
                    </p>

                    <h3 class="fw-bold">0
                    </h3>

                </div>

            </div>


            <div class="col-md-4">

                <div class="dashboard-card p-4">

                    <p class="text-muted mb-1">
                        New This Month
                    </p>

                    <h3 class="fw-bold">0
                    </h3>

                </div>

            </div>


            <div class="col-md-4">

                <div class="dashboard-card p-4">

                    <p class="text-muted mb-1">
                        Pending Approval
                    </p>

                    <h3 class="fw-bold">0
                    </h3>

                </div>

            </div>

        </div>


        <div class="dashboard-card p-4">

            <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">

                <div>

                    <h5 class="fw-semibold mb-1">Registered Mentees
                    </h5>

                    <small class="text-muted">All registered mentee information
                    </small>

                </div>


                <div class="d-flex gap-2 flex-wrap">

                    <asp:TextBox
                        ID="txtsearch"
                        runat="server"
                        CssClass="form-control form-control-sm"
                        Style="width: 220px"
                        placeholder="Search learner">
                    </asp:TextBox>


                    <asp:Button
                        ID="btnfilter"
                        runat="server"
                        CssClass="btn btn-outline-secondary btn-sm"
                        Text="Filter"></asp:Button>

                </div>

            </div>


            <div class="table-responsive">

                <asp:GridView
                    ID="gvMentees"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table align-middle mb-0"
                    GridLines="None"
                    DataKeyNames="MenteeID"
                    EmptyDataText="No mentees found.">
                    <Columns>


                        <asp:TemplateField HeaderText="ID">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblMenteeID"
                                    runat="server"
                                    Text='<%# Eval("MenteeID") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Photo">

                            <ItemTemplate>

                                <asp:Image
                                    ID="imgMentee"
                                    runat="server"
                                    Width="48px"
                                    Height="48px"
                                    CssClass="table-avatar"
                                    ImageUrl='<%# Eval("ProfilePhoto") %>'
                                    AlternateText="Mentee Photo" />

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Full Name">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblName"
                                    runat="server"
                                    CssClass="fw-semibold"
                                    Text='<%# Eval("FullName") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Email">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblEmail"
                                    runat="server"
                                    Text='<%# Eval("Email") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Phone">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblPhone"
                                    runat="server"
                                    Text='<%# Eval("Phone") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Education">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblEducation"
                                    runat="server"
                                    Text='<%# Eval("Education") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="College">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblCollege"
                                    runat="server"
                                    Text='<%# Eval("College") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Career Goal">

                            <ItemTemplate>

                                <div style="min-width: 180px; max-width: 280px;">

                                    <asp:Label
                                        ID="lblCareerGoal"
                                        runat="server"
                                        CssClass="text-muted"
                                        Text='<%# Eval("CareerGoal") %>'>
                                    </asp:Label>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Learning Goal">

                            <ItemTemplate>

                                <div style="min-width: 180px; max-width: 280px;">

                                    <asp:Label
                                        ID="lblLearningGoal"
                                        runat="server"
                                        CssClass="text-muted"
                                        Text='<%# Eval("LearningGoal") %>'>
                                    </asp:Label>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Skills & Interests">

                            <ItemTemplate>

                                <div style="min-width: 180px; max-width: 300px;">

                                    <asp:Label
                                        ID="lblSkillsInterests"
                                        runat="server"
                                        CssClass="text-muted"
                                        Text='<%# Eval("SkillsInterests") %>'>
                                    </asp:Label>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Preferred Domain">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblPreferredDomain"
                                    runat="server"
                                    Text='<%# Eval("PreferredDomain") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Bio">

                            <ItemTemplate>

                                <div style="min-width: 250px; max-width: 350px;">

                                    <asp:Label
                                        ID="lblBio"
                                        runat="server"
                                        CssClass="text-muted"
                                        Text='<%# Eval("Bio") %>'>
                                    </asp:Label>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>




                        <asp:TemplateField HeaderText="Terms Accepted">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblTerms"
                                    runat="server"
                                    Text='<%# Convert.ToBoolean(Eval("TermsAccepted")) ? "Accepted" : "Not Accepted" %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Registration Date">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblRegistrationDate"
                                    runat="server"
                                    Text='<%# Eval("RegistrationDate", "{0:dd-MM-yyyy}") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

                                <asp:Label
                                    ID="lblStatus"
                                    runat="server"
                                    Text='<%# Eval("Status") %>'>
                                </asp:Label>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:HyperLink
                                    ID="lnkView"
                                    runat="server"
                                    CssClass="btn btn-sm btn-outline-primary me-1"
                                    NavigateUrl='<%# "mentee-details.aspx?menteeId=" + Eval("MenteeID") %>'
                                    Text="View">
                                </asp:HyperLink>


                                <asp:LinkButton
                                    ID="btnDelete"
                                    runat="server"
                                    CssClass="btn btn-sm btn-outline-danger"
                                    CommandName="DeleteMentee"
                                    CommandArgument='<%# Eval("MenteeID") %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this mentee?');">
                                    Delete
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>


                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </main>

</asp:Content>
