<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="mentors.aspx.cs" Inherits="MentorHub.Home.mentors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<<<<<<< HEAD

    <style>
        /* Mentor grid */
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

            /* Mentor photo */
            .mentor-list .people-card-photo {
                width: 100%;
                height: 220px;
                object-fit: cover;
                object-position: center;
                display: block;
                background: #f1f5f9;
            }

        .mentor-photo-placeholder {
            height: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #eef2ff, #f5f3ff);
            color: #8175e5;
            font-size: 64px;
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
            min-height: 290px;
        }

        .mentor-request-btn {
            margin-top: auto;
            min-height: 44px;
            border-radius: 10px;
            font-weight: 600;
        }

        /* Filter pills */
        .mentor-filters {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 28px;
        }

        .filter-pill {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 17px;
            border: 1px solid #e2e8f0;
            border-radius: 30px;
            background: #ffffff;
            color: #475569;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

            .filter-pill:hover {
                border-color: #9b8cf5;
                color: #7565df;
            }

            .filter-pill.active {
                background: linear-gradient(135deg, #7867e8, #a16be8);
                border-color: transparent;
                color: #ffffff;
                box-shadow: 0 4px 12px rgba(124, 103, 232, 0.2);
            }

        .mentor-page-description {
            max-width: 750px;
            line-height: 1.7;
        }

        .mentor-section-heading {
            color: #1e293b;
            font-weight: 700;
        }

        .mentor-featured-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 7px 11px;
            border-radius: 20px;
            background: #fff8e7;
            color: #a66a09;
            font-size: 11px;
            font-weight: 700;
        }

        .mentor-empty-state {
            padding: 45px 20px;
            border: 1px dashed #cbd5e1;
            border-radius: 18px;
            background: #ffffff;
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

            .mentor-filters {
                gap: 8px;
            }

            .filter-pill {
                padding: 9px 13px;
                font-size: 12px;
            }

            .mentor-list .people-card-photo,
            .mentor-photo-placeholder {
                height: 230px;
            }
        }
    </style>

</asp:Content>


=======
</asp:Content>

>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="py-5">

        <div class="container">

<<<<<<< HEAD
            <!-- Page heading -->
            <div class="page-header mb-4">

                <span class="page-badge">
                    <i class="bi bi-people me-2"></i>Featured Mentors
                </span>

                <h1 class="display-6 fw-bold mt-3 mb-2">Meet Your Next Mentor
                </h1>

                <p class="text-muted mt-2 mb-0 mentor-page-description">
                    Connect with experienced professionals who can help you grow your
                    skills, explore career opportunities, and achieve your goals.
=======
            <div class="page-header">

                <span class="page-badge">
                    <i class="bi bi-people"></i> Featured mentors
                </span>

                <h1 class="display-6 fw-bold mt-3">
                    Meet experienced mentors ready to guide your next step.
                </h1>

                <p class="text-muted mt-2 mb-0">
                    From product growth to machine learning, these mentors bring
                    practical experience and real-world insight.
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
                </p>

            </div>


<<<<<<< HEAD
            <!-- Domain filters -->
            <div class="mentor-filters" id="mentorFilters" runat="server">

                <asp:LinkButton
                    ID="lnkAllDomains"
                    runat="server"
                    CssClass="filter-pill active"
                    data-filter="all"
                    OnClientClick="filterMentors('all'); return false;">
        <i class="bi bi-funnel me-1"></i>All Domains
                </asp:LinkButton>

            </div>

            <!-- Section heading -->
            <div class="mb-4">

                <h4 class="mentor-section-heading mb-1">Explore Our Mentors
                </h4>

                <p class="text-muted small mb-0">
                    Browse mentor profiles and discover the right expertise for you.
                </p>
=======
            <!-- FILTERS -->
            <div class="d-flex flex-wrap gap-2 mb-4">

                <span class="filter-pill active"
                      data-filter="all"
                      role="button"
                      tabindex="0">

                    <i class="bi bi-funnel me-1"></i>
                    All Domains

                </span>

                <span class="filter-pill"
                      data-filter="product-design"
                      role="button"
                      tabindex="0">

                    Product Design

                </span>

                <span class="filter-pill"
                      data-filter="software-engineering"
                      role="button"
                      tabindex="0">

                    Software Engineering

                </span>

                <span class="filter-pill"
                      data-filter="business-strategy"
                      role="button"
                      tabindex="0">

                    Business &amp; Strategy

                </span>

                <span class="filter-pill"
                      data-filter="data-analytics"
                      role="button"
                      tabindex="0">

                    Data &amp; Analytics

                </span>

                <span class="filter-pill"
                      data-filter="marketing"
                      role="button"
                      tabindex="0">

                    Marketing

                </span>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a

            </div>


<<<<<<< HEAD
            <!-- Dynamic mentor cards -->
            <div class="row g-4">

                <asp:DataList ID="DataList1" runat="server"
                    CssClass="mentor-list"
                    RepeatDirection="Horizontal"
                    RepeatLayout="Flow"
                    RepeatColumns="3"
                    Width="100%">

                    <ItemTemplate>

                        <div class="col-lg-4"
                            data-category='<%# Eval("ProfessionalTitle") %> <%# Eval("Expertise") %> <%# Eval("Skills") %>'>

                            <div class="match-card dashboard-card">

                                <!-- Mentor photo -->
                                <div class="mentor-photo-wrapper">

                                    <asp:Image ID="Image1" runat="server"
                                        CssClass="people-card-photo"
                                        ImageUrl='<%# Eval("ProfilePhoto") %>'
                                        AlternateText="Mentor profile photo" />

                                </div>


                                <div class="p-4 mentor-card-content">

                                    <!-- Name -->
                                    <h5 class="mentor-name mb-2">

                                        <asp:Label ID="lblnm" runat="server"
                                            Text='<%# Eval("FullName") %>'>
                                        </asp:Label>

                                    </h5>


                                    <!-- Professional title and company -->
                                    <p class="text-muted mb-3 mentor-detail">

                                        <i class="bi bi-briefcase me-2"></i>

                                        <asp:Label ID="lbltitle" runat="server"
                                            Text='<%# Eval("ProfessionalTitle") %>'>
                                        </asp:Label>

                                        <asp:Label ID="lblCompany" runat="server"
                                            Text='<%# Eval("Company") %>'>
                                        </asp:Label>

                                    </p>


                                    <!-- Skills -->
                                    <div class="mentor-detail mb-3">

                                        <div class="mentor-detail-label mb-1">
                                            <i class="bi bi-stars me-2"></i>Skills
                                        </div>

                                        <asp:Label ID="lblskl" runat="server"
                                            Text='<%# Eval("Skills") %>'>
                                        </asp:Label>

                                    </div>


                                    <!-- Experience -->
                                    <div class="mentor-detail mb-3">

                                        <div class="mentor-detail-label mb-1">
                                            <i class="bi bi-graph-up-arrow me-2"></i>Experience
                                        </div>

                                        <asp:Label ID="lblExperience" runat="server"
                                            Text='<%# Eval("Experience") %>'>
                                        </asp:Label>

                                    </div>


                                    <!-- Featured badge -->
                                    <div class="mb-3">

                                        <span class="mentor-featured-badge">
                                            <i class="bi bi-star-fill"></i>
                                            Featured Mentor
                                        </span>

                                    </div>


                                    <!-- Request button -->
                                    <a href="SignIn_up.aspx"
                                        class="btn gradient-btn w-100 mentor-request-btn">

                                        <i class="bi bi-send me-2"></i>
                                        Request Mentor

                                    </a>

                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                </asp:DataList>

            </div>


            <!-- No mentors message -->
            <asp:Label ID="lblNoMentors"
                runat="server"
                Text="No mentors are available right now."
                CssClass="text-muted text-center d-block mt-4"
                Visible="false">
            </asp:Label>


            <!-- No filter matches message -->
            <div id="lblNoFilterResults"
                class="mentor-empty-state text-center mt-4"
                style="display: none;">

                <i class="bi bi-search display-5 text-muted"></i>

                <h5 class="fw-bold mt-3">No mentors found
                </h5>

                <p class="text-muted mb-3">
                    Try selecting another domain to explore more mentors.
                </p>

                <button type="button" class="btn gradient-btn" id="btnResetFilters">
                    Show All Mentors
                </button>
=======
            <!-- MENTORS -->
            <div class="row g-4">


                <!-- AISHA -->
                <div class="col-lg-4" data-category="product-design">

                    <div class="dashboard-card p-4 h-100 people-card">

                        <div class="mentor-photo-wrapper">

                            <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=900&q=85"
                                 class="people-card-photo"
                                 alt="Aisha Patel" />

                        </div>

                        <h5 class="fw-semibold mt-3">
                            Aisha Patel
                        </h5>

                        <p class="text-muted mb-2">
                            Senior Product Designer • Google
                        </p>

                        <p class="small text-muted">
                            <i class="bi bi-lightning-charge me-2"></i>
                            UX, Design Systems, Portfolio Review
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <span class="stat-pill">
                                <i class="bi bi-star-fill"></i> 4.9
                            </span>

                            <span class="text-muted small">
                                12 years exp.
                            </span>

                        </div>

                        <a href="SignIn_up.aspx"
                           class="btn gradient-btn w-100 mt-3">
                            Request Mentor
                        </a>

                    </div>

                </div>


                <!-- DANIEL -->
                <div class="col-lg-4" data-category="software-engineering">

                    <div class="dashboard-card p-4 h-100 people-card">

                        <div class="mentor-photo-wrapper">

                            <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=900&q=85"
                                 class="people-card-photo"
                                 alt="Daniel Ross" />

                        </div>

                        <h5 class="fw-semibold mt-3">
                            Daniel Ross
                        </h5>

                        <p class="text-muted mb-2">
                            Lead Software Engineer • Microsoft
                        </p>

                        <p class="small text-muted">
                            <i class="bi bi-code-slash me-2"></i>
                            Backend Systems, DSA, Interview Prep
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <span class="stat-pill">
                                <i class="bi bi-star-fill"></i> 4.8
                            </span>

                            <span class="text-muted small">
                                9 years exp.
                            </span>

                        </div>

                        <a href="SignIn_up.aspx"
                           class="btn gradient-btn w-100 mt-3">
                            Request Mentor
                        </a>

                    </div>

                </div>


                <!-- MEERA -->
                <div class="col-lg-4" data-category="business-strategy">

                    <div class="dashboard-card p-4 h-100 people-card">

                        <div class="mentor-photo-wrapper">

                            <img src="https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=900&q=85"
                                 class="people-card-photo"
                                 alt="Meera Singh" />

                        </div>

                        <h5 class="fw-semibold mt-3">
                            Meera Singh
                        </h5>

                        <p class="text-muted mb-2">
                            Principal Business Analyst • Deloitte
                        </p>

                        <p class="small text-muted">
                            <i class="bi bi-graph-up-arrow me-2"></i>
                            Career Strategy, Analytics, Leadership
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <span class="stat-pill">
                                <i class="bi bi-star-fill"></i> 5.0
                            </span>

                            <span class="text-muted small">
                                15 years exp.
                            </span>

                        </div>

                        <a href="SignIn_up.aspx"
                           class="btn gradient-btn w-100 mt-3">
                            Request Mentor
                        </a>

                    </div>

                </div>


                <!-- ARJUN -->
                <div class="col-lg-4" data-category="data-analytics">

                    <div class="dashboard-card p-4 h-100 people-card">

                        <div class="mentor-photo-wrapper">

                            <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=900&q=85"
                                 class="people-card-photo"
                                 alt="Arjun Verma" />

                        </div>

                        <h5 class="fw-semibold mt-3">
                            Arjun Verma
                        </h5>

                        <p class="text-muted mb-2">
                            Data Science Manager • Flipkart
                        </p>

                        <p class="small text-muted">
                            <i class="bi bi-bar-chart me-2"></i>
                            Machine Learning, Analytics, Career Pivot
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <span class="stat-pill">
                                <i class="bi bi-star-fill"></i> 4.9
                            </span>

                            <span class="text-muted small">
                                10 years exp.
                            </span>

                        </div>

                        <a href="SignIn_up.aspx"
                           class="btn gradient-btn w-100 mt-3">
                            Request Mentor
                        </a>

                    </div>

                </div>


                <!-- SNEHA -->
                <div class="col-lg-4" data-category="marketing">

                    <div class="dashboard-card p-4 h-100 people-card">

                        <div class="mentor-photo-wrapper">

                            <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=900&q=85"
                                 class="people-card-photo"
                                 alt="Sneha Kapoor" />

                        </div>

                        <h5 class="fw-semibold mt-3">
                            Sneha Kapoor
                        </h5>

                        <p class="text-muted mb-2">
                            Growth Marketing Lead • Zomato
                        </p>

                        <p class="small text-muted">
                            <i class="bi bi-megaphone me-2"></i>
                            Brand Strategy, Growth, Content
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <span class="stat-pill">
                                <i class="bi bi-star-fill"></i> 4.7
                            </span>

                            <span class="text-muted small">
                                8 years exp.
                            </span>

                        </div>

                        <a href="SignIn_up.aspx"
                           class="btn gradient-btn w-100 mt-3">
                            Request Mentor
                        </a>

                    </div>

                </div>


                <!-- ROHAN -->
                <div class="col-lg-4" data-category="business-strategy">

                    <div class="dashboard-card p-4 h-100 people-card">

                        <div class="mentor-photo-wrapper">

                            <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=900&q=85"
                                 class="people-card-photo"
                                 alt="Rohan Mehta" />

                        </div>

                        <h5 class="fw-semibold mt-3">
                            Rohan Mehta
                        </h5>

                        <p class="text-muted mb-2">
                            Founder &amp; CTO • Startup Labs
                        </p>

                        <p class="small text-muted">
                            <i class="bi bi-rocket-takeoff me-2"></i>
                            Entrepreneurship, Product Strategy
                        </p>

                        <div class="d-flex justify-content-between align-items-center mt-3">

                            <span class="stat-pill">
                                <i class="bi bi-star-fill"></i> 4.9
                            </span>

                            <span class="text-muted small">
                                11 years exp.
                            </span>

                        </div>

                        <a href="SignIn_up.aspx"
                           class="btn gradient-btn w-100 mt-3">
                            Request Mentor
                        </a>

                    </div>

                </div>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a

            </div>

        </div>

    </section>

<<<<<<< HEAD

    <!-- Domain filter script -->

<script type="text/javascript">
    function filterMentors(filter) {
        var filters = document.querySelectorAll(".filter-pill");
        var mentors = document.querySelectorAll(
            ".mentor-list [data-category]"
        );

        var noResults = document.getElementById("lblNoFilterResults");
        var visibleCount = 0;

        filters.forEach(function (pill) {
            var pillFilter = pill.getAttribute("data-filter") || "";

            pill.classList.toggle(
                "active",
                filter.toLowerCase() === pillFilter.toLowerCase()
            );
        });

        mentors.forEach(function (mentor) {
            var categoryText = (
                mentor.getAttribute("data-category") || ""
            ).toLowerCase();

            var selectedFilter = (filter || "").toLowerCase();

            var showMentor = selectedFilter === "all";

            if (!showMentor) {
                showMentor = categoryText.includes(selectedFilter);
            }

            mentor.style.display = showMentor ? "" : "none";

            if (showMentor) {
                visibleCount++;
            }
        });

        if (noResults) {
            noResults.style.display =
                visibleCount === 0 ? "block" : "none";
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        var resetButton = document.getElementById("btnResetFilters");

        if (resetButton) {
            resetButton.addEventListener("click", function () {
                filterMentors("all");
            });
        }
    });
</script>

</asp:Content>
=======
</asp:Content>
>>>>>>> c7a986f0fac2b89f646809c0b1c5ae0b6fd1632a
