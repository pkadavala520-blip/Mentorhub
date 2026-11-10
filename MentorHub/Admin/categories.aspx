<<<<<<< HEAD
﻿<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="MentorHub.Admin.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Main page */
        .categories-wrapper {
            box-sizing: border-box;
            width: 100%;
            min-height: 100vh;
            padding: 28px;
            border-radius: 24px;
            background: radial-gradient(circle at top left, #eee7ff 0, transparent 40%), linear-gradient(135deg, #f7f5ff, #f2f6ff);
        }

        /* Header */
        .categories-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 28px;
        }

        .categories-title {
            color: #20284b;
            font-size: 27px;
            font-weight: 750;
            margin: 0 0 6px;
        }

        .categories-subtitle {
            color: #7c86a5;
            font-size: 14px;
            margin: 0;
        }

        .category-add-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            white-space: nowrap;
            background: linear-gradient(135deg, #6545ed, #a13ce8);
            color: #fff !important;
            padding: 11px 19px;
            border: none;
            border-radius: 13px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 7px 18px rgba(112, 67, 230, .22);
            transition: .25s ease;
        }

            .category-add-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 23px rgba(112, 67, 230, .3);
            }

        /* Summary cards */
        .category-summary-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
            margin-bottom: 30px;
        }

        .category-summary-card {
            position: relative;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            min-width: 0;
            min-height: 110px;
            padding: 24px;
            overflow: hidden;
            background: rgba(255, 255, 255, .92);
            border: 1px solid #e1dcff;
            border-radius: 22px;
            box-shadow: 0 8px 22px rgba(75, 60, 150, .08);
            transition: .25s ease;
        }

            .category-summary-card::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #35b8ff, #8c4dff, #d53de8);
            }

            .category-summary-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 14px 30px rgba(91, 65, 180, .15);
            }

        .category-summary-info {
            flex: 1;
            min-width: 0;
        }

        .category-summary-name {
            display: flex;
            align-items: center;
            gap: 11px;
            color: #202744;
            font-size: 19px;
            font-weight: 700;
            margin: 0 0 9px;
            overflow-wrap: anywhere;
        }

        .category-accent {
            display: inline-block;
            flex-shrink: 0;
            width: 5px;
            height: 23px;
            border-radius: 5px;
            background: linear-gradient(180deg, #35b8ff, #b93df1);
        }

        .category-mentor-count {
            color: #7c86a5;
            font-size: 14px;
            margin: 0;
        }

        .category-summary-icon {
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 49px;
            height: 49px;
            color: #fff;
            font-size: 22px;
            border-radius: 15px;
            background: linear-gradient(145deg, #7657ff, #4d20c9);
            box-shadow: 0 9px 18px rgba(91, 48, 208, .28);
        }

        /* All categories section */
        .all-categories-section {
            padding: 25px;
            background: rgba(255, 255, 255, .78);
            border: 1px solid #e6e0ff;
            border-radius: 22px;
            box-shadow: 0 8px 22px rgba(75, 60, 150, .06);
        }

        .all-categories-heading {
            color: #20284b;
            font-size: 21px;
            font-weight: 700;
            margin: 0 0 6px;
        }

        .all-categories-description {
            color: #7c86a5;
            font-size: 14px;
            margin: 0 0 22px;
        }

        /* DataList cards */
        .categories-list {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            width: 100%;
        }

        .category-detail-card {
            position: relative;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            min-width: 0;
            min-height: 190px;
            padding: 22px;
            overflow: hidden;
            background: #fff;
            border: 1px solid #e1dcff;
            border-radius: 19px;
            box-shadow: 0 5px 16px rgba(75, 60, 150, .06);
            transition: .25s ease;
        }

            .category-detail-card::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #35b8ff, #8c4dff, #d53de8);
            }

            .category-detail-card:hover {
                transform: translateY(-4px);
                border-color: #c9bbff;
                box-shadow: 0 12px 25px rgba(91, 65, 180, .12);
            }

        .category-detail-top {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 0 0 15px;
        }

        .category-detail-icon {
            display: flex;
            flex-shrink: 0;
            align-items: center;
            justify-content: center;
            width: 43px;
            height: 43px;
            border-radius: 13px;
            background: #f0ebff;
            color: #7045e8;
            font-size: 20px;
        }

        .category-detail-name {
            color: #202744;
            font-size: 17px;
            font-weight: 700;
            margin: 0;
            overflow-wrap: anywhere;
        }

        .category-detail-description {
            flex: 1;
            color: #7c86a5;
            font-size: 14px;
            line-height: 1.7;
            overflow-wrap: anywhere;
            margin: 0 0 18px;
        }

        .category-detail-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            padding-top: 13px;
            border-top: 1px solid #eeeaff;
        }

        .category-detail-label {
            color: #7c86a5;
            font-size: 13px;
        }

        .category-detail-count {
            color: #6545ed;
            background: #f0ebff;
            padding: 6px 11px;
            border-radius: 10px;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
        }

        /* Tablet */
        @media (max-width: 1199px) {
            .categories-wrapper {
                padding: 22px;
            }

            .category-summary-grid,
            .categories-list {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 18px;
            }
        }

        /* Mobile */
        @media (max-width: 576px) {
            .categories-wrapper {
                padding: 15px;
                border-radius: 16px;
            }

            .categories-header {
                align-items: flex-start;
            }

            .categories-title {
                font-size: 23px;
            }

            .category-summary-grid,
            .categories-list {
                grid-template-columns: minmax(0, 1fr);
                gap: 16px;
            }

            .category-summary-card {
                padding: 20px;
            }

            .all-categories-section {
                padding: 18px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .category-summary-card,
            .category-detail-card,
            .category-add-btn {
                transition: none;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <main class="categories-wrapper">

        <!-- Page Header -->
        <div class="categories-header">

            <div>
                <h2 class="categories-title">Categories</h2>
                <p class="categories-subtitle">
                    Explore mentor categories and their available mentors.
                </p>
            </div>

            <a href="add-category.aspx" class="category-add-btn">
                <i class="bi bi-plus-lg me-2"></i>
                Add Category
            </a>

        </div>

        <!-- All Categories -->
        <section class="all-categories-section">

            <h3 class="all-categories-heading">All Categories</h3>

            <p class="all-categories-description">
                Browse all categories and view the number of mentors in each one.
            </p>

            <asp:DataList ID="dlCategories" runat="server"
                RepeatDirection="Horizontal"
                RepeatLayout="Flow"
                CssClass="categories-list">

                <ItemTemplate>

                    <div class="category-detail-card">

                        <div class="category-detail-top">

                            <div class="category-detail-icon">
                                <i class="bi bi-grid-1x2-fill"></i>
                            </div>

                            <h5 class="category-detail-name">
                                <asp:Label ID="lblCategoryName" runat="server"
                                    Text='<%# Eval("Category_Nm") %>' />
                            </h5>

                        </div>

                        <p class="category-detail-description">
                            <asp:Label ID="lblCategoryDescription" runat="server"
                                Text='<%# Eval("Category_Des") %>' />
                        </p>

                        <div class="category-detail-footer">

                            <span class="category-detail-label">
                                Available mentors
                            </span>

                            <span class="category-detail-count">
                                <asp:Label ID="lblMentorCount" runat="server" Text='<%# Eval("MentorCount") %>' />
                                mentors
                            </span>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:DataList>

        </section>

    </main>

</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="MentorHub.Admin.categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="flex-grow-1 content-area p-4">
        <div class="topbar rounded-4 p-3 mb-4 d-flex justify-content-between align-items-center">
            <div>
                <span class="fw-semibold">Categories</span></div>
            <a href="add-category.aspx" class="btn gradient-btn"><i class="bi bi-plus-lg me-2"></i>Add Category</a>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold">Technology</h5>
                    <p class="text-muted mb-0">120 mentors</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold">Design</h5>
                    <p class="text-muted mb-0">54 mentors</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="dashboard-card p-4">
                    <h5 class="fw-semibold">Business</h5>
                    <p class="text-muted mb-0">41 mentors</p>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
