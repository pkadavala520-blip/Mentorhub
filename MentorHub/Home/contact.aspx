<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="MentorHub.Home.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="py-5">
        <div class="container">
            <div class="page-header">
                <span class="page-badge"><i class="bi bi-envelope-open"></i>Contact MentorHub</span>
                <h1 class="display-6 fw-bold mt-3">Let’s build the right mentorship experience together.</h1>
                <p class="text-muted mt-2 mb-0">Reach out for onboarding support, platform feedback, or collaboration on student engagement programs.</p>
            </div>

            <div class="row g-4">
                <div class="col-lg-5">
                    <div class="dashboard-card p-4 h-100">
                        <h5 class="fw-semibold mb-3">Get in touch</h5>
                        <ul class="list-unstyled list-soft">
                            <li><i class="bi bi-geo-alt-fill text-primary me-2"></i>22, Pearl Street, Bengaluru, India</li>
                            <li><i class="bi bi-telephone-fill text-primary me-2"></i>+91 98765 43210</li>
                            <li><i class="bi bi-envelope-fill text-primary me-2"></i>hello@mentorhub.in</li>
                        </ul>
                        <div class="mt-4">
                            <a href="#" class="me-3 text-primary"><i class="bi bi-linkedin fs-5"></i></a>
                            <a href="#" class="me-3 text-primary"><i class="bi bi-twitter fs-5"></i></a>
                            <a href="#" class="text-primary"><i class="bi bi-instagram fs-5"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="glass-card p-4 p-lg-5">
                        <div id="contactForm">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <asp:Label ID="Label1" runat="server"  class="form-label" Text="Full Name"></asp:Label>
                                    <asp:TextBox ID="txtfnm" runat="server" class="form-control" placeholder="Enter your full name"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="Label2" runat="server" class="form-label" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtem" runat="server" class="form-control" placeholder="Enter your email address"></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <asp:Label ID="Label3" runat="server" Text="Subject" class="form-label"></asp:Label>
                                    <asp:TextBox ID="txtsub" runat="server" class="form-control" placeholder="What would you like to discuss?"></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <asp:Label ID="Label4" runat="server" Text="Message" class="form-label"></asp:Label>  
                                    <asp:TextBox ID="txtmsg" runat="server" TextMode="MultiLine" Rows="5" class="form-control" placeholder="Write your message here..."></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <asp:Button ID="btnsqui" runat="server" class="btn gradient-btn" Text="Send enquiry" />
                                    <div id="formMessage" class="small text-success mt-2" style="display: none;">Thanks! Your enquiry has been received.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 mt-1">
                <div class="col-md-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-clock"></i></div>
                        <h6 class="fw-semibold">Support hours</h6>
                        <p class="text-muted small mb-0">Mon–Sat, 9:00 AM – 7:00 PM IST</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-lightning-charge"></i></div>
                        <h6 class="fw-semibold">Response time</h6>
                        <p class="text-muted small mb-0">We typically reply within 24 hours.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="dashboard-card p-4 h-100">
                        <div class="feature-icon mb-3"><i class="bi bi-question-circle"></i></div>
                        <h6 class="fw-semibold">Have a quick question?</h6>
                        <p class="text-muted small mb-0">Check our <a href="faq.aspx">FAQ page</a> first.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

