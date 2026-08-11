<%@ Page Title="MentorHub - Sign In / Sign Up"
    Language="C#"
    MasterPageFile="~/Home/Home.Master"
    AutoEventWireup="true"
    CodeBehind="SignIn_up.aspx.cs"
    Inherits="MentorHub.Home.SignIn_up" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

<style type="text/css">

    /* =========================================================
       PAGE
       ========================================================= */

    * {
        box-sizing: border-box;
    }

    .login-scene {
        min-height: 100vh;
        padding: 45px 25px 65px;

        background:
            radial-gradient(
                circle at 8% 15%,
                rgba(99,102,241,.12),
                transparent 18%
            ),
            radial-gradient(
                circle at 92% 82%,
                rgba(139,92,246,.12),
                transparent 22%
            ),
            #f8f9ff;

        position: relative;
        overflow: hidden;
    }


    /* =========================================================
       BACKGROUND DECORATION
       ========================================================= */

    .login-scene::before,
    .login-scene::after {
        content: "";
        position: absolute;
        border-radius: 50%;
        pointer-events: none;
    }

    .login-scene::before {
        width: 45px;
        height: 45px;

        left: 4%;
        top: 16%;

        background:
            linear-gradient(
                135deg,
                rgba(116,91,224,.45),
                rgba(71,205,166,.55)
            );
    }

    .login-scene::after {
        width: 38px;
        height: 38px;

        right: 5%;
        bottom: 8%;

        background:
            linear-gradient(
                135deg,
                rgba(116,91,224,.45),
                rgba(71,205,166,.55)
            );
    }


    /* =========================================================
       MAIN ROW
       ========================================================= */

    .auth-main-row {
        width: 100%;
        max-width: 1450px;

        margin: 0 auto;

        position: relative;
        z-index: 2;
    }

    /* =========================================================
       LEFT PURPLE PANEL - NORMAL HEIGHT
       ========================================================= */

    .auth-side {
        min-height: 0;
        height: auto;

        border-radius: 30px;

        background:
            linear-gradient(
                135deg,
                #5735e8 0%,
                #6339ed 48%,
                #7a35e9 100%
            );

        color: white;

        box-shadow:
            0 30px 70px rgba(79,55,220,.25);

        position: relative;
        overflow: hidden;

        display: flex;
        align-items: center;
    }


    /* =========================================================
       LEFT CONTENT
       ========================================================= */

    .auth-side-content {
        width: 100%;
        max-width: 650px;

        margin: 0 auto;

        padding: 35px 18px;

        position: relative;
        z-index: 3;
    }


    /* =========================================================
       SIGN IN / SIGN UP CONTENT
       ========================================================= */

    .side-content-inner {
        max-width: 570px;

        position: relative;
        z-index: 4;
    }


    /* =========================================================
       HEADING
       ========================================================= */

    .auth-side h3 {
        font-size: 34px;

        font-weight: 800;

        line-height: 1.2;

        letter-spacing: -.7px;

        margin-top: 0;
        margin-bottom: 18px;
    }


    /* =========================================================
       DESCRIPTION
       ========================================================= */

    .auth-side p {
        color: rgba(255,255,255,.96);

        font-size: 16px;

        line-height: 1.65;

        max-width: 540px;

        margin-top: 0;
        margin-bottom: 25px;
    }


    /* =========================================================
       FEATURE LIST
       ========================================================= */

    .side-feature-list {
        list-style: none;

        padding: 0;
        margin: 0;
    }


    .side-feature-list li {
        color: rgba(255,255,255,.98);

        font-size: 15px;

        line-height: 1.5;

        margin-bottom: 17px;

        display: flex;

        align-items: flex-start;
    }


    .side-feature-list li i {
        font-size: 16px;

        margin-right: 10px;

        margin-top: 2px;

        flex-shrink: 0;
    }


    /* =========================================================
       SIGN UP EXTRA TEXT
       ========================================================= */

    .signup-side-note {
        margin-top: 25px;

        padding-top: 20px;

        border-top:
            1px solid
            rgba(255,255,255,.18);

        max-width: 540px;

        font-size: 14px;
    }


    /* =========================================================
       RIGHT CARD - ALSO NORMAL HEIGHT
       ========================================================= */

    .glass-card {
        width: 100%;

        min-height: 0;
        height: auto;

        background:
            rgba(255,255,255,.97);

        border:
            1px solid
            rgba(111,94,225,.16);

        border-radius: 28px;

        box-shadow:
            0 25px 70px
            rgba(70,55,140,.15);

        position: relative;

        z-index: 3;

        overflow: hidden;
    }


    /* =========================================================
       RESPONSIVE
       ========================================================= */

    @media(max-width:991px) {

        .login-scene {
            padding:
                30px 15px 50px;
        }

        .auth-side {
            min-height: 0;
            height: auto;
            border-radius: 24px;
        }

        .glass-card {
            min-height: 0;
            height: auto;
            border-radius: 24px;
        }
    }


    @media(max-width:767px) {

        .login-scene {
            padding:
                20px 10px 40px;
        }

        .auth-side {
            min-height: 0;
            height: auto;
            border-radius: 20px;
        }

        .glass-card {
            min-height: 0;
            height: auto;
            border-radius: 20px;
        }

        .auth-side-content {
            padding: 30px 15px;
        }

        .auth-side h3 {
            font-size: 27px;
        }

        .login-title {
            font-size: 27px;
        }
    }

    /* =========================================================
       FORM
       ========================================================= */

    .form-label {
        color: #34384a;

        font-weight: 600;

        font-size: 15px;

        margin-bottom: 8px;
    }


    .form-control,
    .form-select {
        min-height: 50px;

        border-radius: 9px;

        border:
            1px solid
            #dce0ea;

        padding: 11px 14px;

        font-size: 15px;

        color: #34384a;

        background: #fff;

        transition: .2s ease;
    }


    .form-control::placeholder {
        color: #9297a5;
    }


    .form-control:focus,
    .form-select:focus {
        border-color: #7040eb;

        box-shadow:
            0 0 0 3px
            rgba(112,64,235,.10);

        outline: none;
    }


    /* =========================================================
       REMEMBER ME
       ========================================================= */

    .remember-row {
        display: flex;

        justify-content: space-between;

        align-items: center;

        margin-top: 8px;

        margin-bottom: 22px;

        font-size: 14px;
    }


    .remember-box {
        display: flex;

        align-items: center;

        gap: 7px;

        color: #5e6472;
    }


    .remember-box input {
        width: 17px;
        height: 17px;

        accent-color: #6639e8;
    }


    .forgot-link {
        color: #2479ff;

        text-decoration: none;

        font-weight: 500;
    }


    .forgot-link:hover {
        text-decoration: underline;
    }


    /* =========================================================
       ADMIN LOGIN BUTTON
       ========================================================= */

    .gradient-btn {
        border: none !important;

        color: white !important;

        background:
            linear-gradient(
                135deg,
                #5036e7,
                #8235e9
            ) !important;

        border-radius: 25px !important;

        min-height: 54px;

        font-size: 16px;

        font-weight: 700;

        box-shadow:
            0 12px 25px
            rgba(91,53,232,.25);

        transition: .2s ease;
    }


    .gradient-btn:hover {
        background:
            linear-gradient(
                135deg,
                #442bd7,
                #7128d8
            ) !important;

        transform: translateY(-1px);

        box-shadow:
            0 15px 30px
            rgba(91,53,232,.30);
    }


    /* =========================================================
       MENTOR LOGIN BUTTON
       ========================================================= */

    .btn-mentor-outline {
        border:
            1px solid
            #2778ff !important;

        color: #2479ff !important;

        background: white !important;

        border-radius: 6px !important;

        min-height: 45px;

        font-weight: 500;

        transition: .2s ease;
    }


    .btn-mentor-outline:hover {
        background: #f3f7ff !important;

        border-color:
            #1767e7 !important;
    }


    /* =========================================================
       MENTEE LOGIN BUTTON
       ========================================================= */

    .btn-mentee-outline {
        border:
            1px solid
            #159b59 !important;

        color: #159b59 !important;

        background: white !important;

        border-radius: 6px !important;

        min-height: 45px;

        font-weight: 500;

        transition: .2s ease;
    }


    .btn-mentee-outline:hover {
        background: #f1fcf6 !important;
    }


    /* =========================================================
       MENTEE REGISTER BUTTON
       ========================================================= */

    .btn-mentee-green {
        border: none !important;

        color: white !important;

        background:
            linear-gradient(
                135deg,
                #119947,
                #20b85e
            ) !important;

        border-radius: 25px !important;

        min-height: 52px;

        font-size: 16px;

        font-weight: 700;

        box-shadow:
            0 10px 22px
            rgba(17,153,71,.20);

        transition: .2s ease;
    }


    .btn-mentee-green:hover {
        color: white !important;

        background:
            linear-gradient(
                135deg,
                #0b843c,
                #159e4d
            ) !important;

        transform: translateY(-1px);
    }


    /* =========================================================
       SIGN UP BOTTOM
       ========================================================= */

    .signup-bottom-text {
        color: #555c6c;

        font-size: 14px;
    }


    .signup-bottom-text a {
        color: #2479ff;

        text-decoration: none;

        font-weight: 600;
    }


    .signup-bottom-text a:hover {
        text-decoration: underline;
    }


    /* =========================================================
       ROLE CARDS
       ========================================================= */

    .role-card {
        border:
            1px solid
            #e1e3ed;

        border-radius: 18px;

        background: white;

        cursor: pointer;

        transition: .25s ease;

        height: 100%;
    }


    .role-card:hover {
        border-color: #7040eb;

        transform:
            translateY(-4px);

        box-shadow:
            0 15px 35px
            rgba(90,55,220,.12);
    }


    .role-icon {
        width: 58px;
        height: 58px;

        border-radius: 16px;

        margin:
            0 auto 15px;

        display: flex;

        align-items: center;
        justify-content: center;

        background: #f1edff;

        color: #6338e8;

        font-size: 25px;
    }


    /* =========================================================
       VALIDATION
       ========================================================= */

    .validation-error {
        display: block;

        color: #dc3545;

        font-size: 12px;

        margin-top: 4px;
    }


    .form-icon-mentor {
        color: #6439e8;
    }


    .form-icon-mentee {
        color: #17aa50;
    }


    /* =========================================================
       REGISTRATION
       ========================================================= */

    .registration-form-container {
        width: 100%;
    }


    .registration-title {
        font-size: 30px;

        color: #1f2937;
    }


    /* =========================================================
       REGISTERED USERS
       ========================================================= */

    .registered-users-section {
        width: 100%;

        display: block;

        clear: both;

        margin:
            55px auto 0;

        max-width: 1450px;

        position: relative;

        z-index: 4;
    }


    .registered-users-section.hidden {
        display: none;
    }


    .registered-section-card {
        background: white;

        border:
            1px solid
            #e5e7eb;

        border-radius: 20px;

        overflow: hidden;

        box-shadow:
            0 12px 35px
            rgba(50,45,100,.10);

        margin-bottom: 30px;

        width: 100%;
    }


    /* =========================================================
       GRID HEADER
       ========================================================= */

    .registered-section-header {
        padding: 18px 22px;

        background:
            linear-gradient(
                135deg,
                #4f2ee4,
                #6937ea
            );

        color: white;

        display: flex;

        align-items: center;

        justify-content: space-between;
    }


    .registered-section-header.mentee-header {
        background:
            linear-gradient(
                135deg,
                #119947,
                #20b85e
            );
    }


    .registered-section-header h4 {
        margin: 0;

        font-size: 21px;

        font-weight: 700;
    }


    .small-count {
        background:
            rgba(255,255,255,.18);

        padding: 6px 12px;

        border-radius: 50px;

        font-size: 12px;
    }


    /* =========================================================
       GRID
       ========================================================= */

    .registered-table-container {
        width: 100%;

        overflow-x: auto;

        overflow-y: hidden;
    }


    .registered-grid {
        width: 100% !important;

        min-width: 1100px;

        margin: 0 !important;

        border-collapse: collapse;
    }


    .registered-grid th {
        background: #f5f3ff !important;

        color: #3d2d8f !important;

        font-size: 13px;

        font-weight: 700;

        padding: 13px 12px !important;

        border:
            1px solid
            #e5e1f7 !important;

        white-space: nowrap;

        text-align: left;
    }


    .registered-grid.mentee-grid th {
        background: #effcf4 !important;

        color: #16743b !important;

        border-color:
            #d7f0df !important;
    }


    .registered-grid td {
        padding: 12px !important;

        font-size: 13px;

        color: #404556;

        border:
            1px solid
            #ececf2 !important;

        background: white;

        vertical-align: middle;
    }


    .registered-grid tr:hover td {
        background: #faf9ff !important;
    }


    .registered-grid.mentee-grid tr:hover td {
        background: #f8fdf9 !important;
    }


    /* =========================================================
       RESPONSIVE
       ========================================================= */

    @media(max-width:1199px) {

        .auth-side h3 {
            font-size: 30px;
        }

        .login-title {
            font-size: 30px;
        }
    }


    @media(max-width:991px) {

        .login-scene {
            padding:
                30px 15px 50px;
        }

        .auth-side {
            min-height: 430px;

            border-radius: 24px;
        }

        .glass-card {
            min-height: auto;

            border-radius: 24px;
        }

        .registered-users-section {
            margin-top: 35px;
        }
    }


    @media(max-width:767px) {

        .login-scene {
            padding:
                20px 10px 40px;
        }

        .auth-side {
            min-height: 390px;

            border-radius: 20px;
        }

        .glass-card {
            border-radius: 20px;
        }

        .auth-side h3 {
            font-size: 27px;
        }

        .login-title {
            font-size: 27px;
        }

        .auth-tabs .nav-link {
            padding:
                12px 20px;

            font-size: 14px;
        }

        .remember-row {
            flex-direction: column;

            align-items: flex-start;

            gap: 10px;
        }

        .registration-title {
            font-size: 25px;
        }

        .registered-section-header {
            padding: 15px;
        }

        .registered-section-header h4 {
            font-size: 17px;
        }
    }

</style>

</asp:Content>


<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">


    <!-- =========================================================
         HIDDEN FIELDS
         ========================================================= -->

    <asp:HiddenField
        ID="RegistrationSuccess"
        runat="server"
        Value="0" />

    <asp:HiddenField
        ID="SelectedRole"
        runat="server"
        Value="" />


    <!-- =========================================================
         MAIN PAGE
         ========================================================= -->

    <div class="container-fluid login-scene">

        <div class="row
                    justify-content-center
                    align-items-stretch
                    g-4
                    auth-main-row">


            <!-- =================================================
                 LEFT PANEL
                 ================================================= -->

            <div class="col-lg-7">

                <div class="auth-side p-4 p-md-5">

                    <div class="auth-side-content">


                        <!-- =========================================
                             SIGN IN LEFT PANEL
                             ========================================= -->

                        <div id="leftpanel-signin">

                            <div class="side-content-inner">

                                <h3>
                                    Connect. Learn. Grow.
                                </h3>

                                <p>
                                    Build meaningful mentorship connections
                                    and achieve your goals with MentorHub.
                                </p>

                                <ul class="side-feature-list">

                                    <li>
                                        <i class="bi bi-check-circle-fill"></i>

                                        <span>
                                            Access your session dashboard
                                        </span>
                                    </li>

                                    <li>
                                        <i class="bi bi-check-circle-fill"></i>

                                        <span>
                                            Chat with your matched mentor or mentee
                                        </span>
                                    </li>

                                    <li>
                                        <i class="bi bi-check-circle-fill"></i>

                                        <span>
                                            Track goals and completed milestones
                                        </span>
                                    </li>

                                </ul>

                            </div>

                        </div>


                        <!-- =========================================
                             SIGN UP LEFT PANEL
                             ========================================= -->

                        <div id="leftpanel-signup"
                             style="display:none;">

                            <div class="side-content-inner">

                                <h3>
                                    Join MentorHub today
                                </h3>

                                <p>
                                    Create your Mentor or Mentee account
                                    and start your learning journey.
                                </p>

                                <ul class="side-feature-list">

                                    <li>
                                        <i class="bi bi-check-circle-fill"></i>

                                        <span>
                                            Free to join
                                        </span>
                                    </li>

                                    <li>
                                        <i class="bi bi-check-circle-fill"></i>

                                        <span>
                                            Connect with mentors
                                        </span>
                                    </li>

                                    <li>
                                        <i class="bi bi-check-circle-fill"></i>

                                        <span>
                                            Track your learning journey
                                        </span>
                                    </li>

                                </ul>

                                <div class="signup-side-note">

                                    <strong>
                                        Start learning. Share knowledge.
                                        Grow together.
                                    </strong>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 RIGHT SIDE
                 ================================================= -->

            <div class="col-lg-5">

                <div class="glass-card
                            p-3
                            p-md-4
                            p-lg-5">


                    <!-- =================================================
                         TABS
                         ================================================= -->

                    <ul class="nav nav-tabs
                               auth-tabs
                               justify-content-center
                               mb-4"
                        id="authTab"
                        role="tablist">


                        <!-- SIGN IN TAB -->

                        <li class="nav-item"
                            role="presentation">

                            <button
                                class="nav-link active"
                                id="login-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#login-pane"
                                type="button"
                                role="tab">

                                Sign In

                            </button>

                        </li>


                        <!-- SIGN UP TAB -->

                        <li class="nav-item"
                            role="presentation">

                            <button
                                class="nav-link"
                                id="register-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#register-pane"
                                type="button"
                                role="tab">

                                Sign Up

                            </button>

                        </li>

                    </ul>


                    <!-- =================================================
                         TAB CONTENT
                         ================================================= -->

                    <div class="tab-content">


                        <!-- =================================================
                             LOGIN
                             ================================================= -->

                        <div
                            class="tab-pane fade show active"
                            id="login-pane"
                            role="tabpanel">


                            <div class="text-center mb-4">

                                <h2 class="login-title mb-2">
                                    Sign In to MentorHub
                                </h2>

                                <p class="login-subtitle mb-0">
                                    Choose your role to continue
                                </p>

                            </div>


                            <!-- EMAIL -->

                            <div class="mb-3">

                                <label class="form-label">
                                    Email
                                </label>

                                <asp:TextBox
                                    ID="txtLoginEmail"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Email"
                                    placeholder="you@example.com" />

                            </div>


                            <!-- PASSWORD -->

                            <div class="mb-2">

                                <label class="form-label">
                                    Password
                                </label>

                                <asp:TextBox
                                    ID="txtLoginPassword"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Password"
                                    placeholder="********" />

                            </div>


                            <!-- REMEMBER -->

                            <div class="remember-row">

                                <label class="remember-box">

                                    <input
                                        type="checkbox"
                                        id="rememberMe" />

                                    <span>
                                        Remember me
                                    </span>

                                </label>

                                <a href="#"
                                   class="forgot-link">

                                    Forgot password?

                                </a>

                            </div>


                            <!-- LOGIN BUTTONS -->

                            <div class="d-grid gap-2">


                                <!-- ADMIN -->

                                <asp:Button
                                    ID="btnAdminLogin"
                                    runat="server"
                                    Text="Sign In as Admin"
                                    CssClass="btn gradient-btn"
                                    CausesValidation="false"
                                    OnClick="btnAdminLogin_Click" />


                                <!-- MENTOR -->

                                <asp:Button
                                    ID="btnMentorLogin"
                                    runat="server"
                                    Text="Sign In as Mentor"
                                    CssClass="btn btn-mentor-outline"
                                    CausesValidation="false"
                                    OnClick="btnMentorLogin_Click" />


                                <!-- MENTEE -->

                                <asp:Button
                                    ID="btnMenteeLogin"
                                    runat="server"
                                    Text="Sign In as Mentee"
                                    CssClass="btn btn-mentee-outline"
                                    CausesValidation="false"
                                    OnClick="btnMenteeLogin_Click" />

                            </div>


                            <!-- LOGIN MESSAGE -->

                            <asp:Label
                                ID="lblLoginMessage"
                                runat="server"
                                CssClass="d-block text-danger mt-3" />


                            <!-- SIGN UP LINK -->

                            <p class="text-center
                                      signup-bottom-text
                                      mt-4
                                      mb-0">

                                Don't have an account?

                                <a href="#"
                                   class="js-tab-switch"
                                   data-target-tab="register-tab">

                                    Sign Up

                                </a>

                            </p>

                        </div>


                        <!-- =================================================
                             REGISTER
                             ================================================= -->

                        <div
                            class="tab-pane fade"
                            id="register-pane"
                            role="tabpanel">


                            <!-- =================================================
                                 ROLE SELECTION
                                 ================================================= -->

                            <div id="reg-step-role">

                                <div class="text-center mb-4">

                                    <h2 class="fw-bold">
                                        Create your account
                                    </h2>

                                    <p class="text-muted">
                                        Choose Mentor or Mentee
                                    </p>

                                </div>


                                <div class="row g-3">


                                    <!-- MENTOR CARD -->

                                    <div class="col-md-6">

                                        <div
                                            class="role-card
                                                   text-center
                                                   p-4"
                                            data-role="mentor"
                                            role="button">

                                            <div class="role-icon">

                                                <i class="bi
                                                          bi-person-workspace">
                                                </i>

                                            </div>

                                            <h5 class="fw-bold">
                                                I'm a Mentor
                                            </h5>

                                            <p class="small text-muted">
                                                Share knowledge and experience.
                                            </p>

                                            <span
                                                class="btn
                                                       gradient-btn
                                                       btn-sm
                                                       w-100">

                                                Join as Mentor

                                            </span>

                                        </div>

                                    </div>


                                    <!-- MENTEE CARD -->

                                    <div class="col-md-6">

                                        <div
                                            class="role-card
                                                   text-center
                                                   p-4"
                                            data-role="mentee"
                                            role="button">

                                            <div class="role-icon">

                                                <i class="bi
                                                          bi-mortarboard-fill">
                                                </i>

                                            </div>

                                            <h5 class="fw-bold">
                                                I'm a Mentee
                                            </h5>

                                            <p class="small text-muted">
                                                Find a mentor and achieve your goals.
                                            </p>

                                            <span
                                                class="btn
                                                       btn-outline-success
                                                       btn-sm
                                                       w-100">

                                                Join as Mentee

                                            </span>

                                        </div>

                                    </div>

                                </div>

                            </div>


                            <!-- =================================================
                                 MENTOR REGISTRATION
                                 ================================================= -->

                            <div
                                id="reg-step-mentor"
                                class="registration-form-container"
                                style="display:none;">


                                <button
                                    type="button"
                                    class="btn btn-link reg-back">

                                    <i class="bi bi-arrow-left"></i>

                                    Back

                                </button>


                                <h2 class="fw-bold registration-title">

                                    <i class="bi
                                              bi-person-workspace
                                              form-icon-mentor
                                              me-2">
                                    </i>

                                    Mentor Registration

                                </h2>


                                <p class="text-muted">
                                    Fill in your details to create your mentor account.
                                </p>


                                <asp:Label
                                    ID="lblMentorMessage"
                                    runat="server"
                                    CssClass="d-block mb-3" />


                                <div class="row g-3">


                                    <!-- NAME -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Full Name *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMentorFullName"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Enter full name" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorFullName"
                                            runat="server"
                                            ControlToValidate="txtMentorFullName"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Full Name is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- EMAIL -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Email *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMentorEmail"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="Email"
                                            placeholder="Enter email" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorEmail"
                                            runat="server"
                                            ControlToValidate="txtMentorEmail"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Email is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- PASSWORD -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Password *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMentorPassword"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="Password"
                                            placeholder="Create password" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorPassword"
                                            runat="server"
                                            ControlToValidate="txtMentorPassword"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Password is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- PHONE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Phone *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMentorPhone"
                                            runat="server"
                                            CssClass="form-control"
                                            MaxLength="15"
                                            placeholder="Enter phone number" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorPhone"
                                            runat="server"
                                            ControlToValidate="txtMentorPhone"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Phone is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- PROFESSIONAL TITLE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Professional Title *
                                        </label>

                                        <asp:TextBox
                                            ID="txtProfessionalTitle"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="e.g. Software Engineer" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvProfessionalTitle"
                                            runat="server"
                                            ControlToValidate="txtProfessionalTitle"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Professional Title is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- COMPANY -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Company / Organization
                                        </label>

                                        <asp:TextBox
                                            ID="txtCompany"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Company name" />

                                    </div>


                                    <!-- EXPERIENCE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Experience *
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlExperience"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem
                                                Text="Select experience"
                                                Value="" />

                                            <asp:ListItem
                                                Text="0-1 years"
                                                Value="0-1 years" />

                                            <asp:ListItem
                                                Text="2-4 years"
                                                Value="2-4 years" />

                                            <asp:ListItem
                                                Text="5-9 years"
                                                Value="5-9 years" />

                                            <asp:ListItem
                                                Text="10+ years"
                                                Value="10+ years" />

                                        </asp:DropDownList>


                                        <asp:RequiredFieldValidator
                                            ID="rfvExperience"
                                            runat="server"
                                            ControlToValidate="ddlExperience"
                                            InitialValue=""
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Select experience."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- EXPERTISE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Expertise *
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlExpertise"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem
                                                Text="Select domain"
                                                Value="" />

                                            <asp:ListItem
                                                Text="Data Science"
                                                Value="Data Science" />

                                            <asp:ListItem
                                                Text="Software Engineering"
                                                Value="Software Engineering" />

                                            <asp:ListItem
                                                Text="Product Management"
                                                Value="Product Management" />

                                            <asp:ListItem
                                                Text="UI/UX Design"
                                                Value="UI/UX Design" />

                                            <asp:ListItem
                                                Text="Marketing"
                                                Value="Marketing" />

                                            <asp:ListItem
                                                Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>


                                        <asp:RequiredFieldValidator
                                            ID="rfvExpertise"
                                            runat="server"
                                            ControlToValidate="ddlExpertise"
                                            InitialValue=""
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Select expertise."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- SKILLS -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Skills
                                        </label>

                                        <asp:TextBox
                                            ID="txtMentorSkills"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="C#, SQL, Python..." />

                                    </div>


                                    <!-- AVAILABILITY -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Availability *
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlAvailability"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem
                                                Text="Select availability"
                                                Value="" />

                                            <asp:ListItem
                                                Text="Weekdays"
                                                Value="Weekdays" />

                                            <asp:ListItem
                                                Text="Weekends"
                                                Value="Weekends" />

                                            <asp:ListItem
                                                Text="Flexible"
                                                Value="Flexible" />

                                        </asp:DropDownList>


                                        <asp:RequiredFieldValidator
                                            ID="rfvAvailability"
                                            runat="server"
                                            ControlToValidate="ddlAvailability"
                                            InitialValue=""
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Select availability."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- BIO -->

                                    <div class="col-12">

                                        <label class="form-label">
                                            Bio
                                        </label>

                                        <asp:TextBox
                                            ID="txtMentorBio"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="MultiLine"
                                            Rows="3"
                                            placeholder="Tell mentees about yourself..." />

                                    </div>


                                    <!-- PHOTO -->

                                    <div class="col-12">

                                        <label class="form-label">
                                            Profile Photo
                                        </label>

                                        <asp:FileUpload
                                            ID="fuMentorPhoto"
                                            runat="server"
                                            CssClass="form-control" />

                                    </div>


                                    <!-- TERMS -->

                                    <div class="col-12">

                                        <asp:CheckBox
                                            ID="chkMentorTerms"
                                            runat="server"
                                            Text=" I agree to the terms of service and privacy policy." />

                                        <asp:CustomValidator
                                            ID="cvMentorTerms"
                                            runat="server"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="You must agree to the terms."
                                            CssClass="validation-error"
                                            Display="Dynamic"
                                            OnServerValidate="cvMentorTerms_ServerValidate" />

                                    </div>


                                    <!-- REGISTER BUTTON -->

                                    <div class="col-12">

                                        <asp:Button
                                            ID="btnMentorRegister"
                                            runat="server"
                                            Text="Create Mentor Account"
                                            CssClass="btn gradient-btn w-100"
                                            ValidationGroup="MentorRegister"
                                            OnClick="btnMentorRegister_Click" />

                                    </div>

                                </div>

                            </div>


                            <!-- =================================================
                                 MENTEE REGISTRATION
                                 ================================================= -->

                            <div
                                id="reg-step-mentee"
                                class="registration-form-container"
                                style="display:none;">


                                <button
                                    type="button"
                                    class="btn btn-link reg-back">

                                    <i class="bi bi-arrow-left"></i>

                                    Back

                                </button>


                                <h2 class="fw-bold registration-title">

                                    <i class="bi
                                              bi-mortarboard-fill
                                              form-icon-mentee
                                              me-2">
                                    </i>

                                    Mentee Registration

                                </h2>


                                <p class="text-muted">
                                    Fill in your details to create your mentee account.
                                </p>


                                <asp:Label
                                    ID="lblMenteeMessage"
                                    runat="server"
                                    CssClass="d-block mb-3" />


                                <div class="row g-3">


                                    <!-- NAME -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Full Name *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMenteeFullName"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Enter full name" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteeFullName"
                                            runat="server"
                                            ControlToValidate="txtMenteeFullName"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Full Name is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- EMAIL -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Email *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMenteeEmail"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="Email"
                                            placeholder="Enter email" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteeEmail"
                                            runat="server"
                                            ControlToValidate="txtMenteeEmail"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Email is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- PASSWORD -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Password *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMenteePassword"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="Password"
                                            placeholder="Create password" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteePassword"
                                            runat="server"
                                            ControlToValidate="txtMenteePassword"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Password is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- PHONE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Phone *
                                        </label>

                                        <asp:TextBox
                                            ID="txtMenteePhone"
                                            runat="server"
                                            CssClass="form-control"
                                            MaxLength="15"
                                            placeholder="Enter phone number" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteePhone"
                                            runat="server"
                                            ControlToValidate="txtMenteePhone"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Phone is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- EDUCATION -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Education *
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlEducation"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem
                                                Text="Select education"
                                                Value="" />

                                            <asp:ListItem
                                                Text="High School"
                                                Value="High School" />

                                            <asp:ListItem
                                                Text="BCA"
                                                Value="BCA" />

                                            <asp:ListItem
                                                Text="B.Tech / B.E."
                                                Value="B.Tech / B.E." />

                                            <asp:ListItem
                                                Text="MCA"
                                                Value="MCA" />

                                            <asp:ListItem
                                                Text="M.Tech / M.E."
                                                Value="M.Tech / M.E." />

                                            <asp:ListItem
                                                Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>


                                        <asp:RequiredFieldValidator
                                            ID="rfvEducation"
                                            runat="server"
                                            ControlToValidate="ddlEducation"
                                            InitialValue=""
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Select education."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- COLLEGE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            College / University *
                                        </label>

                                        <asp:TextBox
                                            ID="txtCollege"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Enter college name" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvCollege"
                                            runat="server"
                                            ControlToValidate="txtCollege"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="College is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- CAREER GOAL -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Career Goal *
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlCareerGoal"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem
                                                Text="Select career goal"
                                                Value="" />

                                            <asp:ListItem
                                                Text="Software Developer"
                                                Value="Software Developer" />

                                            <asp:ListItem
                                                Text="Data Scientist"
                                                Value="Data Scientist" />

                                            <asp:ListItem
                                                Text="Product Manager"
                                                Value="Product Manager" />

                                            <asp:ListItem
                                                Text="UI/UX Designer"
                                                Value="UI/UX Designer" />

                                            <asp:ListItem
                                                Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>


                                        <asp:RequiredFieldValidator
                                            ID="rfvCareerGoal"
                                            runat="server"
                                            ControlToValidate="ddlCareerGoal"
                                            InitialValue=""
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Select career goal."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- LEARNING GOAL -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Learning Goal *
                                        </label>

                                        <asp:TextBox
                                            ID="txtLearningGoal"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="What do you want to learn?" />

                                        <asp:RequiredFieldValidator
                                            ID="rfvLearningGoal"
                                            runat="server"
                                            ControlToValidate="txtLearningGoal"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Learning Goal is required."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- SKILLS -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Skills / Interests
                                        </label>

                                        <asp:TextBox
                                            ID="txtSkillsInterests"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Python, Java, UI/UX..." />

                                    </div>


                                    <!-- DOMAIN -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Preferred Domain *
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlPreferredDomain"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem
                                                Text="Select preferred domain"
                                                Value="" />

                                            <asp:ListItem
                                                Text="Data Science"
                                                Value="Data Science" />

                                            <asp:ListItem
                                                Text="Software Engineering"
                                                Value="Software Engineering" />

                                            <asp:ListItem
                                                Text="Product Management"
                                                Value="Product Management" />

                                            <asp:ListItem
                                                Text="UI/UX Design"
                                                Value="UI/UX Design" />

                                            <asp:ListItem
                                                Text="Marketing"
                                                Value="Marketing" />

                                            <asp:ListItem
                                                Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>


                                        <asp:RequiredFieldValidator
                                            ID="rfvPreferredDomain"
                                            runat="server"
                                            ControlToValidate="ddlPreferredDomain"
                                            InitialValue=""
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Select preferred domain."
                                            CssClass="validation-error"
                                            Display="Dynamic" />

                                    </div>


                                    <!-- BIO -->

                                    <div class="col-12">

                                        <label class="form-label">
                                            Bio
                                        </label>

                                        <asp:TextBox
                                            ID="txtMenteeBio"
                                            runat="server"
                                            CssClass="form-control"
                                            TextMode="MultiLine"
                                            Rows="3"
                                            placeholder="Tell mentors about yourself..." />

                                    </div>


                                    <!-- PHOTO -->

                                    <div class="col-12">

                                        <label class="form-label">
                                            Profile Photo
                                        </label>

                                        <asp:FileUpload
                                            ID="fuMenteePhoto"
                                            runat="server"
                                            CssClass="form-control" />

                                    </div>


                                    <!-- TERMS -->

                                    <div class="col-12">

                                        <asp:CheckBox
                                            ID="chkMenteeTerms"
                                            runat="server"
                                            Text=" I agree to the terms of service and privacy policy." />

                                        <asp:CustomValidator
                                            ID="cvMenteeTerms"
                                            runat="server"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="You must agree to the terms."
                                            CssClass="validation-error"
                                            Display="Dynamic"
                                            OnServerValidate="cvMenteeTerms_ServerValidate" />

                                    </div>


                                    <!-- REGISTER BUTTON -->

                                    <div class="col-12">

                                        <asp:Button
                                            ID="btnMenteeRegister"
                                            runat="server"
                                            Text="Create Mentee Account"
                                            CssClass="btn btn-mentee-green w-100"
                                            ValidationGroup="MenteeRegister"
                                            OnClick="btnMenteeRegister_Click" />

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- =========================================================
             REGISTERED USERS
             ========================================================= -->

        <div
            id="registeredUsersSection"
            class="registered-users-section hidden">


            <!-- =====================================================
                 MENTOR GRID
                 ===================================================== -->

            <div class="registered-section-card">

                <div class="registered-section-header">

                    <h4>
                        <i class="bi bi-person-workspace me-2"></i>
                        Registered Mentors
                    </h4>

                    <span class="small-count">
                        Mentor List
                    </span>

                </div>


                <div class="registered-table-container">

                    <asp:GridView
                        ID="gvMentors"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="registered-grid"
                        EmptyDataText="No mentors registered yet."
                        GridLines="Both">

                        <Columns>

                            <asp:BoundField
                                DataField="MentorID"
                                HeaderText="ID" />

                            <asp:BoundField
                                DataField="FullName"
                                HeaderText="Name" />

                            <asp:BoundField
                                DataField="Email"
                                HeaderText="Email" />

                            <asp:BoundField
                                DataField="Phone"
                                HeaderText="Phone" />

                            <asp:BoundField
                                DataField="ProfessionalTitle"
                                HeaderText="Professional Title" />

                            <asp:BoundField
                                DataField="Company"
                                HeaderText="Company" />

                            <asp:BoundField
                                DataField="Experience"
                                HeaderText="Experience" />

                            <asp:BoundField
                                DataField="Expertise"
                                HeaderText="Expertise" />

                            <asp:BoundField
                                DataField="Skills"
                                HeaderText="Skills" />

                            <asp:BoundField
                                DataField="Availability"
                                HeaderText="Availability" />

                            <asp:BoundField
                                DataField="Status"
                                HeaderText="Status" />

                            <asp:BoundField
                                DataField="RegistrationDate"
                                HeaderText="Registered Date"
                                DataFormatString="{0:dd-MM-yyyy}" />

                        </Columns>

                    </asp:GridView>

                </div>

            </div>


            <!-- =====================================================
                 MENTEE GRID
                 ===================================================== -->

            <div class="registered-section-card">

                <div class="registered-section-header mentee-header">

                    <h4>
                        <i class="bi bi-mortarboard-fill me-2"></i>
                        Registered Mentees
                    </h4>

                    <span class="small-count">
                        Mentee List
                    </span>

                </div>


                <div class="registered-table-container">

                    <asp:GridView
                        ID="gvMentees"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="registered-grid mentee-grid"
                        EmptyDataText="No mentees registered yet."
                        GridLines="Both">

                        <Columns>

                            <asp:BoundField
                                DataField="MenteeID"
                                HeaderText="ID" />

                            <asp:BoundField
                                DataField="FullName"
                                HeaderText="Name" />

                            <asp:BoundField
                                DataField="Email"
                                HeaderText="Email" />

                            <asp:BoundField
                                DataField="Phone"
                                HeaderText="Phone" />

                            <asp:BoundField
                                DataField="Education"
                                HeaderText="Education" />

                            <asp:BoundField
                                DataField="College"
                                HeaderText="College" />

                            <asp:BoundField
                                DataField="CareerGoal"
                                HeaderText="Career Goal" />

                            <asp:BoundField
                                DataField="LearningGoal"
                                HeaderText="Learning Goal" />

                            <asp:BoundField
                                DataField="SkillsInterests"
                                HeaderText="Skills / Interests" />

                            <asp:BoundField
                                DataField="PreferredDomain"
                                HeaderText="Preferred Domain" />

                            <asp:BoundField
                                DataField="Status"
                                HeaderText="Status" />

                            <asp:BoundField
                                DataField="RegistrationDate"
                                HeaderText="Registered Date"
                                DataFormatString="{0:dd-MM-yyyy}" />

                        </Columns>

                    </asp:GridView>

                </div>

            </div>

        </div>

    </div>


    <!-- =========================================================
         BOOTSTRAP JS
         ========================================================= -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    <!-- =========================================================
         JAVASCRIPT
         ========================================================= -->

    <script type="text/javascript">

        (function () {

            var roleStep =
                document.getElementById("reg-step-role");

            var mentorStep =
                document.getElementById("reg-step-mentor");

            var menteeStep =
                document.getElementById("reg-step-mentee");

            var gridSection =
                document.getElementById("registeredUsersSection");

            var selectedRole =
                document.getElementById(
                    "<%= SelectedRole.ClientID %>"
                );

            var registrationSuccess =
                document.getElementById(
                    "<%= RegistrationSuccess.ClientID %>"
                );


            /* =====================================================
               HIDE GRID
               ===================================================== */

            function hideGrid() {

                if (gridSection) {

                    gridSection.classList.add("hidden");

                }

            }


            /* =====================================================
               SHOW GRID
               ===================================================== */

            function showGrid() {

                if (gridSection) {

                    gridSection.classList.remove("hidden");

                }

            }


            /* =====================================================
               ROLE SELECTION
               ===================================================== */

            function showRoleSelection() {

                if (roleStep) {
                    roleStep.style.display = "";
                }

                if (mentorStep) {
                    mentorStep.style.display = "none";
                }

                if (menteeStep) {
                    menteeStep.style.display = "none";
                }

                hideGrid();

                if (selectedRole) {
                    selectedRole.value = "";
                }

            }


            /* =====================================================
               SHOW MENTOR
               ===================================================== */

            function showMentor() {

                if (roleStep) {
                    roleStep.style.display = "none";
                }

                if (mentorStep) {
                    mentorStep.style.display = "";
                }

                if (menteeStep) {
                    menteeStep.style.display = "none";
                }

                if (selectedRole) {
                    selectedRole.value = "mentor";
                }

            }


            /* =====================================================
               SHOW MENTEE
               ===================================================== */

            function showMentee() {

                if (roleStep) {
                    roleStep.style.display = "none";
                }

                if (mentorStep) {
                    mentorStep.style.display = "none";
                }

                if (menteeStep) {
                    menteeStep.style.display = "";
                }

                if (selectedRole) {
                    selectedRole.value = "mentee";
                }

            }


            /* =====================================================
               ROLE CARD CLICK
               ===================================================== */

            document
                .querySelectorAll(".role-card")
                .forEach(function (card) {

                    card.addEventListener(
                        "click",
                        function () {

                            var role =
                                card.getAttribute("data-role");

                            if (role === "mentor") {

                                showMentor();

                            }

                            else if (role === "mentee") {

                                showMentee();

                            }

                        }
                    );

                });


            /* =====================================================
               BACK BUTTON
               ===================================================== */

            document
                .querySelectorAll(".reg-back")
                .forEach(function (button) {

                    button.addEventListener(
                        "click",
                        function () {

                            showRoleSelection();

                        }
                    );

                });


            /* =====================================================
               LOGIN -> SIGN UP
               ===================================================== */

            document
                .querySelectorAll(".js-tab-switch")
                .forEach(function (link) {

                    link.addEventListener(
                        "click",
                        function (e) {

                            e.preventDefault();

                            var target =
                                document.getElementById(
                                    link.getAttribute(
                                        "data-target-tab"
                                    )
                                );

                            if (
                                target &&
                                window.bootstrap
                            ) {

                                var tab =
                                    bootstrap.Tab
                                        .getOrCreateInstance(
                                            target
                                        );

                                tab.show();

                            }

                        }
                    );

                });


            /* =====================================================
               SIGN UP TAB
               ===================================================== */

            var registerTab =
                document.getElementById("register-tab");

            if (registerTab) {

                registerTab.addEventListener(
                    "shown.bs.tab",
                    function () {

                        var signInPanel =
                            document.getElementById(
                                "leftpanel-signin"
                            );

                        var signUpPanel =
                            document.getElementById(
                                "leftpanel-signup"
                            );

                        if (signInPanel) {

                            signInPanel.style.display =
                                "none";

                        }

                        if (signUpPanel) {

                            signUpPanel.style.display =
                                "";

                        }

                    }
                );

            }


            /* =====================================================
               SIGN IN TAB
               ===================================================== */

            var loginTab =
                document.getElementById("login-tab");

            if (loginTab) {

                loginTab.addEventListener(
                    "shown.bs.tab",
                    function () {

                        var signInPanel =
                            document.getElementById(
                                "leftpanel-signin"
                            );

                        var signUpPanel =
                            document.getElementById(
                                "leftpanel-signup"
                            );

                        if (signInPanel) {

                            signInPanel.style.display =
                                "";

                        }

                        if (signUpPanel) {

                            signUpPanel.style.display =
                                "none";

                        }

                        hideGrid();

                    }
                );

            }


            /* =====================================================
               RESTORE GRID AFTER POSTBACK
               ===================================================== */

            if (
                registrationSuccess &&
                registrationSuccess.value === "1"
            ) {

                showGrid();

            }

            else {

                hideGrid();

            }


            /* =====================================================
               RESTORE SELECTED ROLE
               ===================================================== */

            if (
                selectedRole &&
                selectedRole.value === "mentor"
            ) {

                showMentor();

            }

            else if (
                selectedRole &&
                selectedRole.value === "mentee"
            ) {

                showMentee();

            }

        })();

    </script>

</asp:Content>
