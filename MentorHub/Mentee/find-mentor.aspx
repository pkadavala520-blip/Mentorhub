
<%@ Page Title="" Language="C#" MasterPageFile="~/Mentee/Mentee.Master" AutoEventWireup="true" CodeBehind="find-mentor.aspx.cs" Inherits="MentorHub.Mentee.find_mentor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Main mentor list */
        .mentor-list {
            display: grid !important;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 24px;
            width: 100%;
            margin: 0;
        }

        .mentor-list > span {
            display: contents !important;
        }

        .mentor-list br {
            display: none !important;
        }

        .mentor-list .col-lg-4 {
            width: 100%;
            max-width: 100%;
            padding: 0;
            min-width: 0;
        }

        /* Mentor card */
        .mentor-list .match-card {
            height: 100%;
            width: 100%;
            overflow: hidden;
            border-radius: 20px;
            background: #ffffff;
            border: 1px solid #e9eaf2;
            box-shadow: 0 5px 20px rgba(30, 41, 59, 0.06);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .mentor-list .match-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(30, 41, 59, 0.12);
        }

        /* Mentor profile image */
        .mentor-list .people-card-photo {
            width: 100%;
            height: 220px;
            object-fit: cover;
            object-position: center;
            display: block;
            background: #f1f5f9;
        }

        /* Search area */
        .mentor-search-box {
            border: 1px solid #e9eaf2;
            border-radius: 18px;
            background: #ffffff;
            box-shadow: 0 4px 16px rgba(30, 41, 59, 0.04);
        }

        .mentor-search-box .form-control,
        .mentor-search-box .form-select {
            min-height: 46px;
            border-radius: 10px;
            border: 1px solid #dfe3ec;
            font-size: 14px;
        }

        .mentor-search-box .form-control:focus,
        .mentor-search-box .form-select:focus {
            border-color: #8b7cf6;
            box-shadow: 0 0 0 3px rgba(139, 124, 246, 0.13);
        }

        .mentor-search-box .gradient-btn {
            min-height: 46px;
            border-radius: 10px;
            font-weight: 600;
        }

        .mentor-name {
            color: #1e293b;
            font-size: 18px;
            font-weight: 700;
            overflow-wrap: anywhere;
        }

        .mentor-detail {
            font-size: 13px;
            line-height: 1.7;
            overflow-wrap: anywhere;
        }

        .mentor-detail-label {
            color: #475569;
            font-weight: 600;
        }

        .mentor-card-content {
            display: flex;
            flex-direction: column;
            height: calc(100% - 220px);
        }

        .mentor-request-btn {
            margin-top: auto;
            min-height: 44px;
            border-radius: 10px;
            font-weight: 600;
        }

        .mentor-page-description {
            max-width: 720px;
            line-height: 1.7;
        }

        /* Tablet */
        @media (max-width: 991px) {
            .mentor-list {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 20px;
            }
        }

        /* Mobile */
        @media (max-width: 575px) {
            .mentor-list {
                grid-template-columns: 1fr;
                gap: 18px;
            }

            .mentor-list .people-card-photo {
                height: 230px;
            }

            .mentor-search-box {
                padding: 18px !important;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="flex-grow-1 content-area p-4">

        <!-- Top bar -->
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <button type="button"
                    class="btn btn-outline-secondary me-3 sidebar-toggle-btn"
                    data-sidebar-toggle
                    aria-label="Toggle navigation menu"
                    aria-expanded="false">
                    <i class="bi bi-list"></i>
                </button>

                <span class="fw-semibold">Find the perfect mentor</span>
            </div>
        </div>


        <!-- Page heading -->
        <div class="page-header mb-4">

            <span class="page-badge">
                <i class="bi bi-search-heart me-2"></i>Find Mentor
            </span>

            <h2 class="fw-bold mt-3 mb-2">
                Find Your Perfect Mentor
            </h2>

            <p class="text-muted mb-0 mentor-page-description">
                Discover experienced professionals who can guide you in your career,
                help you develop technical skills, and support your professional growth.
            </p>

        </div>


        <!-- Search and filter section -->
        <div class="mentor-search-box p-4 mb-4">

            <div class="mb-3">
                <h5 class="fw-bold mb-1">Search Mentors</h5>
                <p class="text-muted small mb-0">
                    Search by name or filter mentors by skill and category.
                </p>
            </div>

            <div class="row g-3 align-items-center">

                <!-- Search by name -->
                <div class="col-12 col-md-4">

                    <label for="<%= txtsearch.ClientID %>" class="form-label small fw-semibold">
                        Mentor Name
                    </label>

                    <div class="input-group">
                        <span class="input-group-text bg-white">
                            <i class="bi bi-search"></i>
                        </span>

                        <asp:TextBox
                            ID="txtsearch"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter mentor name">
                        </asp:TextBox>
                    </div>

                </div>


                <!-- Filter by skill -->
                <div class="col-12 col-md-3">

                    <label for="<%= drpskl.ClientID %>" class="form-label small fw-semibold">
                        Filter by Skill
                    </label>

                    <asp:DropDownList
                        ID="drpskl"
                        runat="server"
                        CssClass="form-select"
                        AppendDataBoundItems="false">

                        <asp:ListItem Value="">-- Select Skill --</asp:ListItem>

                    </asp:DropDownList>

                </div>


                <!-- Filter by category -->
                <div class="col-12 col-md-3">

                    <label for="<%= drpcat.ClientID %>" class="form-label small fw-semibold">
                        Filter by Category
                    </label>

                    <asp:DropDownList
                        ID="drpcat"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Value="">-- Select Category --</asp:ListItem>

                    </asp:DropDownList>

                </div>


                <!-- Search button -->
                <div class="col-12 col-md-2">

                    <label class="form-label small fw-semibold d-none d-md-block">
                        &nbsp;
                    </label>

                    <asp:Button
                        ID="btnsearch"
                        runat="server"
                        CssClass="btn gradient-btn w-100"
                        Text="Search"
                        OnClick="btnsearch_Click" />

                </div>

            </div>

        </div>


        <!-- Mentor list heading -->
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">

            <div>
                <h4 class="fw-bold mb-1">Available Mentors</h4>
                <p class="text-muted small mb-0">
                    Explore mentor profiles and find the right match for your goals.
                </p>
            </div>

        </div>


        <!-- Mentor cards -->
        <div class="row g-4">

            <asp:DataList
                ID="DataList1"
                runat="server"
                CssClass="mentor-list"
                RepeatDirection="Horizontal"
                RepeatLayout="Flow"
                RepeatColumns="3"
                Width="100%">

                <ItemTemplate>

                    <div class="col-lg-4">

                        <div class="match-card dashboard-card">

                            <!-- Profile photo -->
                            <asp:Image
                                ID="Image1"
                                runat="server"
                                CssClass="people-card-photo"
                                ImageUrl='<%# Eval("ProfilePhoto") %>'
                                AlternateText="Mentor profile photo" />

                            <div class="p-4 mentor-card-content">

                                <!-- Mentor name -->
                                <h5 class="mentor-name mb-2">

                                    <asp:Label
                                        ID="lblnm"
                                        runat="server"
                                        Text='<%# Eval("FullName") %>'>
                                    </asp:Label>

                                </h5>


                                <!-- Professional title -->
                                <p class="text-muted mb-3 mentor-detail">

                                    <i class="bi bi-briefcase me-2"></i>

                                    <asp:Label
                                        ID="lbltitle"
                                        runat="server"
                                        Text='<%# Eval("ProfessionalTitle") %>'>
                                    </asp:Label>

                                </p>


                                <!-- Skills -->
                                <div class="mentor-detail mb-3">

                                    <div class="mentor-detail-label mb-1">
                                        <i class="bi bi-stars me-2"></i>Skills
                                    </div>

                                    <asp:Label
                                        ID="lblskl"
                                        runat="server"
                                        Text='<%# Eval("Skills") %>'>
                                    </asp:Label>

                                </div>


                                <!-- Availability -->
                                <div class="mentor-detail mb-4">

                                    <div class="mentor-detail-label mb-1">
                                        <i class="bi bi-calendar-check me-2"></i>Availability
                                    </div>

                                    <asp:Label
                                        ID="lblAvb"
                                        runat="server"
                                        Text='<%# Eval("Availability") %>'>
                                    </asp:Label>

                                </div>


                                <!-- Request button -->
                                <asp:Button
                                    ID="btnRequest"
                                    runat="server"
                                    CssClass="btn gradient-btn w-100 mentor-request-btn"
                                    Text="Request Mentor"
                                    CommandName="RequestMentor"
                                    CommandArgument='<%# Eval("MentorID") %>' />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:DataList>

        </div>

    </main>

</asp:Content>
