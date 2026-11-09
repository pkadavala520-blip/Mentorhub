<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="features.aspx.cs" Inherits="MentorHub.Home.features" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="py-5">
        <div class="container">
            <div class="page-header">
                <span class="page-badge"><i class="bi bi-collection-play"></i>Platform Features</span>
                <h1 class="display-6 fw-bold mt-3">A complete toolkit for mentoring success.</h1>
                <p class="text-muted mt-2 mb-0">Every feature is designed to help mentors and mentees move from discovery to growth with clarity and momentum.</p>
            </div>

            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-search-heart"></i></div>
                        <h5>Intelligent match discovery</h5>
                        <p class="text-muted mb-0">Search by domain, skill, experience, rating, and language to find your ideal mentor in seconds.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-chat-dots"></i></div>
                        <h5>Realtime communication</h5>
                        <p class="text-muted mb-0">Start conversations, share goals, and stay aligned with dedicated chat and session tools.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-calendar2-week"></i></div>
                        <h5>Smart scheduling</h5>
                        <p class="text-muted mb-0">Book sessions based on real availability, manage deadlines, and keep every meeting organized.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-bar-chart-line"></i></div>
                        <h5>Progress tracking</h5>
                        <p class="text-muted mb-0">Track learning goals, session completion, milestones, and engagement in one intuitive dashboard.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-shield-check"></i></div>
                        <h5>Secure approvals</h5>
                        <p class="text-muted mb-0">Admins can manage requests, verify quality, and keep the entire platform consistent and trustworthy.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-stars"></i></div>
                        <h5>Feedback-first growth</h5>
                        <p class="text-muted mb-0">Collect reviews and ratings to improve outcomes, strengthen relationships, and guide future matches.</p>
                    </div>
                </div>
            </div>

            <div class="text-center my-5">
                <h2 class="section-title">Built for every role</h2>
                <p class="text-muted">Each dashboard is tailored to what that role actually needs to do.</p>
            </div>
            <div class="row g-4">
                <div class="col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <span class="page-badge mb-3"><i class="bi bi-person-badge"></i>Admin</span>
                        <ul class="list-unstyled list-soft mt-3">
                            <li><i class="bi bi-check2 text-success me-2"></i>Approve mentor &amp; mentee requests</li>
                            <li><i class="bi bi-check2 text-success me-2"></i>Monitor platform-wide activity</li>
                            <li><i class="bi bi-check2 text-success me-2"></i>Manage reported issues</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <span class="role-pill mentor mb-3"><i class="bi bi-mortarboard"></i>Mentor</span>
                        <ul class="list-unstyled list-soft mt-3">
                            <li><i class="bi bi-check2 text-success me-2"></i>Set availability and expertise areas</li>
                            <li><i class="bi bi-check2 text-success me-2"></i>Accept or decline mentee requests</li>
                            <li><i class="bi bi-check2 text-success me-2"></i>Track ratings and session history</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="dashboard-card p-4 h-100">
                        <span class="role-pill mentee mb-3"><i class="bi bi-person"></i>Mentee</span>
                        <ul class="list-unstyled list-soft mt-3">
                            <li><i class="bi bi-check2 text-success me-2"></i>Search and filter mentor profiles</li>
                            <li><i class="bi bi-check2 text-success me-2"></i>Book sessions around your schedule</li>
                            <li><i class="bi bi-check2 text-success me-2"></i>Track personal learning milestones</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

