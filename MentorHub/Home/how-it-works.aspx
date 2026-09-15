<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="how-it-works.aspx.cs" Inherits="MentorHub.Home.how_it_works" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="hero-section">
        <div class="container py-5">
            <div class="glass-card p-5">
                <span class="page-badge"><i class="bi bi-signpost-split"></i>How it Works</span>
                <h1 class="fw-bold mb-3 mt-3">From sign-up to your first breakthrough session.</h1>
                <p class="text-muted mb-0">Create an account, fill your profile, discover mentors, request sessions, and start your growth journey through guided support — all tracked in one dashboard.</p>
            </div>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-title">Five simple steps</h2>
                <p class="text-muted">Whether you're a mentee looking for guidance or a mentor ready to give back, the flow is the same at its core.</p>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100 d-flex gap-3">
                        <span class="step-number">1</span>
                        <div>
                            <h5 class="mb-1">Create your account</h5>
                            <p class="text-muted mb-0 small">Sign up as a mentor or mentee in under two minutes with just your name, email, and role.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100 d-flex gap-3">
                        <span class="step-number">2</span>
                        <div>
                            <h5 class="mb-1">Build your profile</h5>
                            <p class="text-muted mb-0 small">Add your skills, goals, availability, and experience so matches are relevant from day one.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100 d-flex gap-3">
                        <span class="step-number">3</span>
                        <div>
                            <h5 class="mb-1">Discover a match</h5>
                            <p class="text-muted mb-0 small">Browse or get recommended mentors filtered by domain, rating, and experience level.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100 d-flex gap-3">
                        <span class="step-number">4</span>
                        <div>
                            <h5 class="mb-1">Request &amp; schedule</h5>
                            <p class="text-muted mb-0 small">Send a request, get approved, and book sessions around real availability.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100 d-flex gap-3">
                        <span class="step-number">5</span>
                        <div>
                            <h5 class="mb-1">Grow &amp; track progress</h5>
                            <p class="text-muted mb-0 small">Chat, meet, and log milestones while your dashboard tracks completion and feedback.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100 d-flex gap-3">
                        <span class="step-number">6</span>
                        <div>
                            <h5 class="mb-1">Share feedback</h5>
                            <p class="text-muted mb-0 small">Rate your sessions to help refine future matches for the whole community.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="glass-card p-4 h-100">
                        <span class="role-pill mentee mb-3"><i class="bi bi-person"></i>For Mentees</span>
                        <h4 class="fw-semibold mt-2">Your learning journey</h4>
                        <ul class="list-unstyled list-soft">
                            <li><i class="bi bi-1-circle text-primary me-2"></i>Tell us your goals and current skill level</li>
                            <li><i class="bi bi-2-circle text-primary me-2"></i>Get matched with mentors who fit your path</li>
                            <li><i class="bi bi-3-circle text-primary me-2"></i>Book sessions and prepare with shared notes</li>
                            <li><i class="bi bi-4-circle text-primary me-2"></i>Track milestones on your personal dashboard</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="glass-card p-4 h-100">
                        <span class="role-pill mentor mb-3"><i class="bi bi-mortarboard"></i>For Mentors</span>
                        <h4 class="fw-semibold mt-2">Your giving-back journey</h4>
                        <ul class="list-unstyled list-soft">
                            <li><i class="bi bi-1-circle text-primary me-2"></i>Set your expertise areas and availability</li>
                            <li><i class="bi bi-2-circle text-primary me-2"></i>Review and accept mentee requests</li>
                            <li><i class="bi bi-3-circle text-primary me-2"></i>Run sessions and share resources</li>
                            <li><i class="bi bi-4-circle text-primary me-2"></i>Build a track record through ratings</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="dashboard-card p-5 text-center">
                <h3 class="fw-bold mb-2">Ready to get started?</h3>
                <p class="text-muted mb-4">Join thousands of mentors and mentees already growing together on MentorHub.</p>
                <div class="d-flex justify-content-center gap-3 flex-wrap">
                    <a href="SignIn_up.aspx" class="btn gradient-btn">Create Account</a>
                    <a href="mentors.aspx" class="btn btn-outline-primary rounded-pill px-4">Browse Mentors</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

