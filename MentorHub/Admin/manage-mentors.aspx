<%@ Page Title="Manage Mentors" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="manage-mentors.aspx.cs" Inherits="MentorHub.Admin.manage_mentors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="flex-grow-1 content-area p-4">

        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
<<<<<<< HEAD
            <div>
                <span class="fw-semibold">Mentor Administration</span>
            </div>
        </div>

        <div class="page-header">
=======

            <div>
                <span class="fw-semibold">Mentor Administration
                </span>
            </div>

            <a href="add-mentor.aspx" class="btn gradient-btn">
                <i class="bi bi-plus-lg me-2"></i>
                Add Mentor
            </a>

        </div>


        <div class="page-header">

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
            <span class="page-badge">
                <i class="bi bi-person-workspace"></i>
                Manage Mentors
            </span>

<<<<<<< HEAD
            <h2 class="fw-bold mt-3 mb-1">Mentor Directory</h2>
=======
            <h2 class="fw-bold mt-3 mb-1">Mentor Directory
            </h2>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a

            <p class="text-muted mb-0">
                Review and manage all registered mentors on the MentorHub platform.
            </p>
<<<<<<< HEAD
        </div>

        <div class="row g-4 mb-4">

            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <p class="text-muted mb-1">Total Mentors</p>
                    <h3 class="fw-bold">
                        <asp:Label ID="lblTotalMentors" runat="server"></asp:Label>
                    </h3>
                </div>
            </div>

            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <p class="text-muted mb-1">Pending Approval</p>
                    <h3 class="fw-bold">
                        <asp:Label ID="lblPendingMentors" runat="server"></asp:Label>
                    </h3>
                </div>
            </div>

            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <p class="text-muted mb-1">Inactive Mentors</p>
                    <h3 class="fw-bold">
                        <asp:Label ID="lblInactiveMentors" runat="server"></asp:Label>
                    </h3>
                </div>
=======

        </div>


        <div class="row g-4 mb-4">

            <div class="col-md-4">

                <div class="dashboard-card p-4">

                    <p class="text-muted mb-1">
                        Total Mentors
                    </p>

                    <h3 class="fw-bold">1
                    </h3>

                </div>

            </div>


            <div class="col-md-4">

                <div class="dashboard-card p-4">

                    <p class="text-muted mb-1">
                        Pending Approval
                    </p>

                    <h3 class="fw-bold">21
                    </h3>

                </div>

            </div>


            <div class="col-md-4">

                <div class="dashboard-card p-4">

                    <p class="text-muted mb-1">
                        Inactive Mentors
                    </p>

                    <h3 class="fw-bold">13
                    </h3>

                </div>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
            </div>

        </div>

<<<<<<< HEAD
=======

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
        <div class="dashboard-card p-4">

            <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">

                <div>
<<<<<<< HEAD
                    <h5 class="fw-semibold mb-1">Mentor Directory</h5>
                    <small class="text-muted">All registered mentor information</small>
                </div>

=======

                    <h5 class="fw-semibold mb-1">Mentor Directory
                    </h5>

                    <small class="text-muted">All registered mentor information
                    </small>

                </div>


>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                <div class="d-flex gap-2 flex-wrap">

                    <asp:TextBox
                        ID="txtsmentor"
                        runat="server"
                        CssClass="form-control form-control-sm"
                        Style="width: 220px"
                        placeholder="Search mentor">
                    </asp:TextBox>

<<<<<<< HEAD
=======

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                    <asp:Button
                        ID="btnfilter"
                        runat="server"
                        CssClass="btn btn-outline-secondary btn-sm"
<<<<<<< HEAD
                        Text="Filter"
                        OnClick="btnfilter_Click" />
=======
                        Text="Filter"></asp:Button>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a

                </div>

            </div>

<<<<<<< HEAD
=======

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
            <div class="table-responsive">

                <asp:GridView
                    ID="gvMentors"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table align-middle mb-0"
                    GridLines="None"
                    DataKeyNames="MentorID"
                    EmptyDataText="No mentors found."
                    OnRowCommand="gvMentors_RowCommand">

                    <Columns>

                        <asp:TemplateField HeaderText="ID">
<<<<<<< HEAD
                            <ItemTemplate>
=======

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblMentorID"
                                    runat="server"
                                    Text='<%# Eval("MentorID") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Photo">
=======

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Photo">

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                            <ItemTemplate>
                                <asp:Image
                                    ID="imgMentee"
                                    runat="server"
                                    Width="48px"
                                    Height="48px"
                                    CssClass="table-avatar"
                                    ImageUrl='<%# Eval("ProfilePhoto") %>'
                                    AlternateText="Mentor Photo" />
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Full Name">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Full Name">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblName"
                                    runat="server"
                                    CssClass="fw-semibold"
                                    Text='<%# Eval("FullName") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Email">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblEmail"
                                    runat="server"
                                    Text='<%# Eval("Email") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phone">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Phone">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblPhone"
                                    runat="server"
                                    Text='<%# Eval("Phone") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Professional Title">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Professional Title">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblProfessionalTitle"
                                    runat="server"
                                    Text='<%# Eval("ProfessionalTitle") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Company">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblCompany"
                                    runat="server"
                                    Text='<%# Eval("Company") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Experience">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Experience">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblExperience"
                                    runat="server"
                                    Text='<%# Eval("Experience") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Expertise">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Expertise">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblExpertise"
                                    runat="server"
                                    Text='<%# Eval("Expertise") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Skills">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Skills">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblSkills"
                                    runat="server"
                                    Text='<%# Eval("Skills") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Availability">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Availability">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblAvailability"
                                    runat="server"
                                    Text='<%# Eval("Availability") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Bio">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Bio">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblBio"
                                    runat="server"
                                    Text='<%# Eval("Bio") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Terms Accepted">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>





                        <asp:TemplateField HeaderText="Terms Accepted">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblTerms"
                                    runat="server"
                                    Text='<%# Convert.ToBoolean(Eval("TermsAccepted")) ? "Accepted" : "Not Accepted" %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Registration Date">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Registration Date">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblRegistrationDate"
                                    runat="server"
                                    Text='<%# Eval("RegistrationDate", "{0:dd-MM-yyyy}") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                                <asp:Label
                                    ID="lblStatus"
                                    runat="server"
                                    Text='<%# Eval("Status") %>'>
                                </asp:Label>
<<<<<<< HEAD
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit"
                                    runat="server"
                                    CssClass="btn btn-sm btn-outline-primary me-1"
                                    CommandName="cmd_edt"
                                    CommandArgument='<%# Eval("MentorID") %>'>
                                        Edit
                                </asp:LinkButton>
=======

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:HyperLink
                                    ID="lnkEdit"
                                    runat="server"
                                    CssClass="btn btn-sm btn-outline-primary me-1"
                                    NavigateUrl='<%# "mentor-details.aspx?mentorId=" + Eval("MentorID") %>'
                                    Text="Edit">
                                </asp:HyperLink>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a

                                <asp:LinkButton
                                    ID="btnDelete"
                                    runat="server"
                                    CssClass="btn btn-sm btn-outline-danger"
<<<<<<< HEAD
                                    CommandName="cmd_del"
                                    CommandArgument='<%# Eval("MentorID") %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this mentor?');">
                                        Delete
                                </asp:LinkButton>

                            </ItemTemplate>
=======
                                    CommandName="DeleteMentor"
                                    CommandArgument='<%# Eval("MentorID") %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this mentor?');">
                                    Delete
                                </asp:LinkButton>

                            </ItemTemplate>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </main>

</asp:Content>
