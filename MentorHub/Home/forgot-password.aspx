<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="MentorHub.Home.forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="glass-card p-4 p-md-5">
                    <div class="feature-icon mb-3"><i class="bi bi-key"></i></div>
                    <h2 class="fw-bold mb-3">Reset Password</h2>
                    <p class="text-muted">Enter your email to receive reset instructions.</p>
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input type="email" class="form-control" placeholder="you@example.com" />
                        </div>
                        <button class="btn gradient-btn w-100">Send Reset Link</button>
                    </form>
                    <p class="text-center small text-muted mt-3 mb-0">Remembered your password? <a href="SignIn_up.aspx">Back to Login</a></p>
                </div>
                <p class="text-center text-muted small mt-3"><i class="bi bi-shield-lock me-1"></i>For your security, reset links expire after 30 minutes.</p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/main.js"></script>
</asp:Content>

