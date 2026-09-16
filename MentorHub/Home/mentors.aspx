<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="mentors.aspx.cs" Inherits="MentorHub.Home.mentors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="py-5">
        <div class="container">
            <div class="page-header">
                <span class="page-badge"><i class="bi bi-people"></i>Featured mentors</span>
                <h1 class="display-6 fw-bold mt-3">Meet experienced mentors ready to guide your next step.</h1>
                <p class="text-muted mt-2 mb-0">From product growth to machine learning, these mentors bring practical experience and real-world insight.</p>
            </div>

            <div class="d-flex flex-wrap gap-2 mb-4"> 
                <span class="filter-pill active" data-filter="all" role="button" tabindex="0"><i class="bi bi-funnel me-1"></i>All Domains</span>
                <span class="filter-pill" data-filter="product-design" role="button" tabindex="0">Product Design</span>
                <span class="filter-pill" data-filter="software-engineering" role="button" tabindex="0">Software Engineering</span>
                <span class="filter-pill" data-filter="business-strategy" role="button" tabindex="0">Business &amp; Strategy</span>
                <span class="filter-pill" data-filter="data-analytics" role="button" tabindex="0">Data &amp; Analytics</span>
                <span class="filter-pill" data-filter="marketing" role="button" tabindex="0">Marketing</span>
            </div>

            <div class="row g-4">
                <div class="col-lg-4" data-category="product-design">
                    <div class="dashboard-card p-4 h-100 people-card">
                        <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=900&q=80" class="rounded-4 mb-3 people-card-photo" alt="Aisha Patel" />
                        <h5 class="fw-semibold">Aisha Patel</h5>
                        <p class="text-muted mb-2">Senior Product Designer • Google</p>
                        <p class="small text-muted"><i class="bi bi-lightning-charge me-2"></i>UX, Design Systems, Portfolio Review</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="stat-pill"><i class="bi bi-star-fill"></i>4.9</span>
                            <span class="text-muted small">12 years exp.</span>
                        </div>
                        <a href="SignIn_up.aspx" class="btn gradient-btn w-100 mt-3">Request Mentor</a>
                    </div>
                </div>
                <div class="col-lg-4" data-category="software-engineering">
                    <div class="dashboard-card p-4 h-100 people-card">
                        <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=900&q=80" class="rounded-4 mb-3 people-card-photo" alt="Daniel Ross" />
                        <h5 class="fw-semibold">Daniel Ross</h5>
                        <p class="text-muted mb-2">Lead Software Engineer • Microsoft</p>
                        <p class="small text-muted"><i class="bi bi-code-slash me-2"></i>Backend Systems, DSA, Interview Prep</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="stat-pill"><i class="bi bi-star-fill"></i>4.8</span>
                            <span class="text-muted small">9 years exp.</span>
                        </div>
                        <a href="SignIn_up.aspx" class="btn gradient-btn w-100 mt-3">Request Mentor</a>
                    </div>
                </div>
                <div class="col-lg-4" data-category="business-strategy">
                    <div class="dashboard-card p-4 h-100 people-card">
                        <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=900&q=80" class="rounded-4 mb-3 people-card-photo" alt="Meera Singh" />
                        <h5 class="fw-semibold">Meera Singh</h5>
                        <p class="text-muted mb-2">Principal Business Analyst • Deloitte</p>
                        <p class="small text-muted"><i class="bi bi-graph-up-arrow me-2"></i>Career Strategy, Analytics, Leadership</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="stat-pill"><i class="bi bi-star-fill"></i>5.0</span>
                            <span class="text-muted small">15 years exp.</span>
                        </div>
                        <a href="SignIn_up.aspx" class="btn gradient-btn w-100 mt-3">Request Mentor</a>
                    </div>
                </div>

                <div class="col-lg-4" data-category="data-analytics">
                    <div class="dashboard-card p-4 h-100 people-card">
                        <img src="https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&w=900&q=80" class="rounded-4 mb-3 people-card-photo" alt="Arjun Verma" />
                        <h5 class="fw-semibold">Arjun Verma</h5>
                        <p class="text-muted mb-2">Data Science Manager • Flipkart</p>
                        <p class="small text-muted"><i class="bi bi-bar-chart me-2"></i>Machine Learning, Analytics, Career Pivot</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="stat-pill"><i class="bi bi-star-fill"></i>4.9</span>
                            <span class="text-muted small">10 years exp.</span>
                        </div>
                        <a href="SignIn_up.aspx" class="btn gradient-btn w-100 mt-3">Request Mentor</a>
                    </div>
                </div>
                <div class="col-lg-4" data-category="marketing">
                    <div class="dashboard-card p-4 h-100 people-card">
                        <img src="https://images.unsplash.com/photo-1573497491208-6b1acb260507?auto=format&fit=crop&w=900&q=80" class="rounded-4 mb-3 people-card-photo" alt="Sneha Kapoor" />
                        <h5 class="fw-semibold">Sneha Kapoor</h5>
                        <p class="text-muted mb-2">Growth Marketing Lead • Zomato</p>
                        <p class="small text-muted"><i class="bi bi-megaphone me-2"></i>Brand Strategy, Growth, Content</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="stat-pill"><i class="bi bi-star-fill"></i>4.7</span>
                            <span class="text-muted small">8 years exp.</span>
                        </div>
                        <a href="SignIn_up.aspx" class="btn gradient-btn w-100 mt-3">Request Mentor</a>
                    </div>
                </div>
                <div class="col-lg-4" data-category="business-strategy">
                    <div class="dashboard-card p-4 h-100 people-card">
                        <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=900&q=80" class="rounded-4 mb-3 people-card-photo" alt="Rohan Mehta" />
                        <h5 class="fw-semibold">Rohan Mehta</h5>
                        <p class="text-muted mb-2">Founder &amp; CTO • Startup Labs</p>
                        <p class="small text-muted"><i class="bi bi-rocket-takeoff me-2"></i>Entrepreneurship, Product Strategy</p>
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <span class="stat-pill"><i class="bi bi-star-fill"></i>4.9</span>
                            <span class="text-muted small">11 years exp.</span>
                        </div>
                        <a href="SignIn_up.aspx" class="btn gradient-btn w-100 mt-3">Request Mentor</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

