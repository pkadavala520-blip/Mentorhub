<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="mentors.aspx.cs" Inherits="MentorHub.Home.mentors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="py-5">

        <div class="container">

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
                </p>

            </div>


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

            </div>


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

            </div>

        </div>

    </section>

</asp:Content>