<%@ Page Title="Edit Profile"
    Language="C#"
    MasterPageFile="~/Mentee/Mentee.Master"
    AutoEventWireup="true"
    CodeBehind="edit-profile.aspx.cs"
    Inherits="MentorHub.Mentee.edit_profile" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* ============================= */
        /* EDIT PROFILE PAGE */
        /* ============================= */

        .edit-profile-wrapper {
            max-width: 900px;
            margin: 0 auto;
        }

        .edit-profile-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 32px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .edit-profile-title {
            font-weight: 700;
            color: #2d1b69;
        }

        .edit-profile-subtitle {
            color: #777;
            font-size: 14px;
        }

        .form-label-custom {
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        .profile-input {
            border-radius: 12px !important;
            padding: 12px 15px !important;
            border: 1px solid #ddd !important;
            transition: all 0.25s ease;
        }

        .profile-input:focus {
            border-color: #7c3aed !important;
            box-shadow: 0 0 0 0.2rem rgba(124, 58, 237, 0.12) !important;
        }

        .profile-input:hover {
            border-color: #b7a0ff !important;
        }

        .save-btn {
            border: none;
            border-radius: 12px;
            padding: 12px 25px;
            font-weight: 600;
            background: linear-gradient(135deg, #7c3aed, #d946ef);
            color: white;
            transition: all 0.25s ease;
        }

        .save-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(124, 58, 237, 0.25);
            color: white;
        }

        .back-btn {
            border-radius: 12px;
            padding: 10px 18px;
        }

        .success-message {
            display: block;
            margin-top: 12px;
            color: #198754;
            font-weight: 600;
        }

        .profile-section-icon {
            width: 46px;
            height: 46px;
            border-radius: 14px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #ede9fe, #fce7f3);
            color: #7c3aed;
            font-size: 21px;
            margin-right: 10px;
        }

        @media (max-width: 768px) {

            .edit-profile-card {
                padding: 22px;
                border-radius: 18px;
            }

            .topbar {
                flex-direction: column;
                align-items: flex-start !important;
                gap: 15px;
            }

            .back-btn {
                width: 100%;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">


    <main class="content-area p-4">


        <!-- ================= TOPBAR ================= -->

        <div class="topbar rounded-4 p-3 mb-4
                    d-flex justify-content-between
                    align-items-center">

            <div>

                <h4 class="mb-1 fw-bold">

                    <i class="bi bi-person-gear me-2"></i>

                    Edit Profile

                </h4>

                <span class="fw-semibold text-muted">

                    Update your personal information

                </span>

            </div>


            <a href="profile.aspx"
               class="btn btn-outline-secondary back-btn">

                <i class="bi bi-arrow-left me-2"></i>

                Back to Profile

            </a>

        </div>


        <!-- ================= PROFILE FORM ================= -->

        <div class="edit-profile-wrapper">

            <div class="edit-profile-card">


                <!-- HEADER -->

                <div class="mb-4">

                    <div class="d-flex align-items-center mb-2">

                        <span class="profile-section-icon">

                            <i class="bi bi-person-vcard"></i>

                        </span>

                        <h4 class="edit-profile-title mb-0">

                            Update Your Details

                        </h4>

                    </div>


                    <p class="edit-profile-subtitle mb-0">

                        Keep your profile information up to date
                        so mentors can better understand your goals.

                    </p>

                </div>


                <!-- ================= FIELDS ================= -->

                <div class="row g-4">


                    <!-- FULL NAME -->

                    <div class="col-md-6">

                        <label class="form-label form-label-custom">

                            <i class="bi bi-person me-1"></i>

                            Full Name

                        </label>


                        <asp:TextBox
                            ID="txtFullName"
                            runat="server"
                            CssClass="form-control profile-input"
                            placeholder="Enter your full name">
                        </asp:TextBox>

                    </div>


                    <!-- EMAIL -->

                    <div class="col-md-6">

                        <label class="form-label form-label-custom">

                            <i class="bi bi-envelope me-1"></i>

                            Email

                        </label>


                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="form-control profile-input"
                            placeholder="Enter your email">
                        </asp:TextBox>

                    </div>


                    <!-- EDUCATION -->

                    <div class="col-md-6">

                        <label class="form-label form-label-custom">

                            <i class="bi bi-mortarboard me-1"></i>

                            Education

                        </label>


                        <asp:TextBox
                            ID="txtEducation"
                            runat="server"
                            CssClass="form-control profile-input"
                            placeholder="e.g. BCA Computer Science">
                        </asp:TextBox>

                    </div>


                    <!-- SKILLS / INTERESTS -->

                    <div class="col-md-6">

                        <label class="form-label form-label-custom">

                            <i class="bi bi-stars me-1"></i>

                            Skills &amp; Interests

                        </label>


                        <asp:TextBox
                            ID="txtInterests"
                            runat="server"
                            CssClass="form-control profile-input"
                            placeholder="e.g. ASP.NET, C#, Python">
                        </asp:TextBox>

                    </div>


                    <!-- CAREER GOALS -->

                    <div class="col-12">

                        <label class="form-label form-label-custom">

                            <i class="bi bi-bullseye me-1"></i>

                            Career Goals

                        </label>


                        <asp:TextBox
                            ID="txtCareerGoals"
                            runat="server"
                            CssClass="form-control profile-input"
                            TextMode="MultiLine"
                            Rows="5"
                            placeholder="Tell us about your career goals">
                        </asp:TextBox>

                    </div>


                    <!-- ================= SAVE ================= -->

                    <div class="col-12 pt-2">

                        <asp:Button
                            ID="btnSaveChanges"
                            runat="server"
                            Text="Save Changes"
                            CssClass="btn save-btn"
                            OnClick="btnSaveChanges_Click" />


                        <asp:Label
                            ID="lblMessage"
                            runat="server"
                            CssClass="success-message">
                        </asp:Label>

                    </div>


                </div>

            </div>

        </div>

    </main>


</asp:Content>