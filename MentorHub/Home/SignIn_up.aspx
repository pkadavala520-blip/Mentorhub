<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="SignIn_up.aspx.cs" Inherits="MentorHub.Home.SignIn_up" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:HiddenField
        ID="RegistrationSuccess"
        runat="server"
        Value="0" />

    <div class="container-fluid login-scene">

        <div class="particle p1"></div>
        <div class="particle p2"></div>
        <div class="particle p3"></div>


        <!-- ORB -->

        <div class="mentor-orb">

            <div class="orb-ring"></div>

            <div class="orb-core">

                <i class="bi bi-people-fill"></i>

            </div>

        </div>


        <div class="row justify-content-center align-items-center g-4">


            <!-- LEFT PANEL -->

            <div class="col-lg-5 d-none d-lg-block">

                <div class="auth-side p-5 h-100 position-relative overflow-hidden">

                    <div class="floating-shapes">

                        <span class="shape shape1"></span>
                        <span class="shape shape2"></span>
                        <span class="shape shape3"></span>

                    </div>


                    <div id="leftpanel-signin">

                        <h3 class="fw-bold mb-3">Connect. Learn. Grow.
                        </h3>

                        <p class="mb-4">
                            Build meaningful mentorship connections
                            and achieve your goals with MentorHub.
                       
                        </p>

                        <ul class="list-unstyled position-relative">

                            <li class="mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                Access your session dashboard
                            </li>

                            <li class="mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                Chat with your matched mentor or mentee
                            </li>

                            <li class="mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                Track goals and completed milestones
                            </li>

                        </ul>

                    </div>


                    <div id="leftpanel-signup"
                        style="display: none;">

                        <h3 class="fw-bold mb-3">Join MentorHub today
                        </h3>

                        <p class="mb-4">
                            It only takes a couple of minutes
                            to get started.
                       
                        </p>

                        <div class="d-flex align-items-center gap-2 mb-3">

                            <span class="stat-pill">

                                <i class="bi bi-star-fill"></i>
                                98%

                            </span>

                            <small>satisfaction rate
                            </small>

                        </div>

                        <ul class="list-unstyled position-relative">

                            <li class="mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                Free to join as mentor or mentee
                            </li>

                            <li class="mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                2.4k+ mentors across every domain
                            </li>

                            <li class="mb-3">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                Structured dashboards from day one
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- AUTH CARD -->

            <div class="col-lg-5">

                <div class="glass-card p-4 p-md-5 auth-card-3d">


                    <!-- TABS -->

                    <ul class="nav nav-tabs justify-content-center mb-4"
                        id="authTab"
                        role="tablist">

                        <li class="nav-item"
                            role="presentation">

                            <button class="nav-link active"
                                id="login-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#login-pane"
                                type="button"
                                role="tab">
                                Sign In

                           
                            </button>

                        </li>

                        <li class="nav-item"
                            role="presentation">

                            <button class="nav-link"
                                id="register-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#register-pane"
                                type="button"
                                role="tab">
                                Sign Up

                           
                            </button>

                        </li>

                    </ul>


                    <div class="tab-content"
                        id="authTabContent">


                        <!-- ================= LOGIN ================= -->

                        <div class="tab-pane fade show active"
                            id="login-pane"
                            role="tabpanel">

                            <div class="text-center mb-4">

                                <h2 class="fw-bold">Sign In to MentorHub
                                </h2>

                                <p class="text-muted">
                                    Choose your role to continue
                               
                                </p>

                            </div>


                            <div id="loginForm">


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
                                        placeholder="you@example.com">
                                    </asp:TextBox>

                                </div>


                                <!-- PASSWORD -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Password
                                   
                                    </label>

                                    <asp:TextBox
                                        ID="txtLoginPassword"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Password"
                                        placeholder="********">
                                    </asp:TextBox>

                                </div>


                                <!-- REMEMBER -->

                                <div class="mb-3 d-flex justify-content-between">

                                    <div class="form-check">

                                        <input
                                            class="form-check-input"
                                            type="checkbox"
                                            id="rememberMe" />

                                        <label
                                            class="form-check-label"
                                            for="rememberMe">
                                            Remember me

                                       
                                        </label>

                                    </div>

                                    <a href="#"
                                        class="small">Forgot password?

                                    </a>

                                </div>


                                <!-- LOGIN BUTTONS -->

                                <div class="d-grid gap-2 mb-3">


                                    <asp:Button
                                        ID="btnAdminLogin"
                                        runat="server"
                                        Text="Sign In as Admin"
                                        CssClass="btn gradient-btn"
                                        CausesValidation="false"
                                        OnClick="btnAdminLogin_Click" />


                                    <asp:Button
                                        ID="btnMentorLogin"
                                        runat="server"
                                        Text="Sign In as Mentor"
                                        CssClass="btn btn-outline-primary"
                                        CausesValidation="false"
                                        OnClick="btnMentorLogin_Click" />


                                    <asp:Button
                                        ID="btnMenteeLogin"
                                        runat="server"
                                        Text="Sign In as Mentee"
                                        CssClass="btn btn-outline-secondary"
                                        CausesValidation="false"
                                        OnClick="btnMenteeLogin_Click" />

                                </div>


                                <asp:Label
                                    ID="lblLoginMessage"
                                    runat="server"
                                    CssClass="small text-danger">
                                </asp:Label>


                                <p class="text-center small text-muted mt-3 mb-0">
                                    Don't have an account?

                                   

                                    <a href="#"
                                        class="js-tab-switch"
                                        data-target-tab="register-tab">Sign Up

                                    </a>

                                </p>

                            </div>

                        </div>


                        <!-- ================= REGISTER ================= -->

                        <div class="tab-pane fade"
                            id="register-pane"
                            role="tabpanel">


                            <!-- ROLE -->

                            <div id="reg-step-role">

                                <div class="text-center mb-4">

                                    <h2 class="fw-bold">Create your account
                                    </h2>

                                    <p class="text-muted">
                                        Choose how you want to join MentorHub
                                   
                                    </p>

                                </div>


                                <div class="row g-3 mb-3">


                                    <!-- MENTOR -->

                                    <div class="col-6">

                                        <div class="role-card text-center p-3 p-md-4"
                                            data-role="mentor"
                                            role="button"
                                            tabindex="0">

                                            <div class="role-icon">

                                                <i class="bi bi-person-workspace"></i>

                                            </div>

                                            <h6 class="fw-bold mb-1">I'm a Mentor
                                            </h6>

                                            <p class="small text-muted mb-3">
                                                Share your knowledge,
                                                experience and help others grow.
                                           
                                            </p>

                                            <span class="btn gradient-btn btn-sm w-100">Join as Mentor
                                            </span>

                                        </div>

                                    </div>


                                    <!-- MENTEE -->

                                    <div class="col-6">

                                        <div class="role-card text-center p-3 p-md-4"
                                            data-role="mentee"
                                            role="button"
                                            tabindex="0">

                                            <div class="role-icon">

                                                <i class="bi bi-mortarboard-fill"></i>

                                            </div>

                                            <h6 class="fw-bold mb-1">I'm a Mentee
                                            </h6>

                                            <p class="small text-muted mb-3">
                                                Find the right mentor
                                                and achieve your learning goals.
                                           
                                            </p>

                                            <span class="btn btn-outline-primary btn-sm w-100">Join as Mentee
                                            </span>

                                        </div>

                                    </div>

                                </div>


                                <p class="text-center small text-muted mb-0">
                                    Already have an account?

                                   

                                    <a href="#"
                                        class="js-tab-switch"
                                        data-target-tab="login-tab">Sign In

                                    </a>

                                </p>

                            </div>


                            <!-- ================= MENTOR REGISTER ================= -->

                            <div id="reg-step-mentor"
                                style="display: none;">

                                <button type="button"
                                    class="btn btn-link reg-back btn-sm px-0 mb-2">

                                    <i class="bi bi-arrow-left"></i>
                                    Back

                               
                                </button>


                                <div class="mb-3">

                                    <h2 class="fw-bold mb-1">

                                        <i class="bi bi-person-workspace me-2 form-icon-mentor"></i>

                                        Mentor Registration

                                    </h2>

                                    <p class="text-muted">
                                        Fill in your details to create mentor account
                                   
                                    </p>

                                </div>


                                <asp:Label
                                    ID="lblMentorMessage"
                                    runat="server">
                                </asp:Label>


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
                                            placeholder="Enter full name">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorFullName"
                                            runat="server"
                                            ControlToValidate="txtMentorFullName"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Full Name is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Enter email">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorEmail"
                                            runat="server"
                                            ControlToValidate="txtMentorEmail"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Email is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            ID="revMentorEmail"
                                            runat="server"
                                            ControlToValidate="txtMentorEmail"
                                            ValidationGroup="MentorRegister"
                                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                            ErrorMessage="Enter a valid email address."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>

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
                                            placeholder="Create password">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorPassword"
                                            runat="server"
                                            ControlToValidate="txtMentorPassword"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Password is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            ID="revMentorPassword"
                                            runat="server"
                                            ControlToValidate="txtMentorPassword"
                                            ValidationGroup="MentorRegister"
                                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d).{6,}$"
                                            ErrorMessage="Password must be at least 6 characters and contain a number."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>

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
                                            placeholder="Enter phone number">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMentorPhone"
                                            runat="server"
                                            ControlToValidate="txtMentorPhone"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Phone number is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            ID="revMentorPhone"
                                            runat="server"
                                            ControlToValidate="txtMentorPhone"
                                            ValidationGroup="MentorRegister"
                                            ValidationExpression="^[0-9]{10,15}$"
                                            ErrorMessage="Phone must contain 10 to 15 digits."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>

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
                                            placeholder="e.g. Data Science Manager">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvProfessionalTitle"
                                            runat="server"
                                            ControlToValidate="txtProfessionalTitle"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Professional Title is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="e.g. Microsoft">
                                        </asp:TextBox>

                                    </div>


                                    <!-- EXPERIENCE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Experience (Years) *
                                       
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlExperience"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem Text="Select experience"
                                                Value="" />

                                            <asp:ListItem Text="0-1 years"
                                                Value="0-1 years" />

                                            <asp:ListItem Text="2-4 years"
                                                Value="2-4 years" />

                                            <asp:ListItem Text="5-9 years"
                                                Value="5-9 years" />

                                            <asp:ListItem Text="10+ years"
                                                Value="10+ years" />

                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator
                                            ID="rfvExperience"
                                            runat="server"
                                            ControlToValidate="ddlExperience"
                                            InitialValue=""
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Please select experience."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                    </div>


                                    <!-- EXPERTISE -->

                                    <div class="col-md-6">

                                        <label class="form-label">
                                            Expertise / Domain *
                                       
                                        </label>

                                        <asp:DropDownList
                                            ID="ddlExpertise"
                                            runat="server"
                                            CssClass="form-select">

                                            <asp:ListItem Text="Select domain"
                                                Value="" />

                                            <asp:ListItem Text="Data Science"
                                                Value="Data Science" />

                                            <asp:ListItem Text="Software Engineering"
                                                Value="Software Engineering" />

                                            <asp:ListItem Text="Product Management"
                                                Value="Product Management" />

                                            <asp:ListItem Text="UI/UX Design"
                                                Value="UI/UX Design" />

                                            <asp:ListItem Text="Marketing"
                                                Value="Marketing" />

                                            <asp:ListItem Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator
                                            ID="rfvExpertise"
                                            runat="server"
                                            ControlToValidate="ddlExpertise"
                                            InitialValue=""
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Please select expertise."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Add skills (comma separated)">
                                        </asp:TextBox>

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

                                            <asp:ListItem Text="Select availability"
                                                Value="" />

                                            <asp:ListItem Text="Weekdays"
                                                Value="Weekdays" />

                                            <asp:ListItem Text="Weekends"
                                                Value="Weekends" />

                                            <asp:ListItem Text="Flexible"
                                                Value="Flexible" />

                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator
                                            ID="rfvAvailability"
                                            runat="server"
                                            ControlToValidate="ddlAvailability"
                                            InitialValue=""
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="Please select availability."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Tell mentees about your experience...">
                                        </asp:TextBox>

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

                                        <small class="text-muted">JPG, JPEG, PNG only. Maximum 2 MB.
                                        </small>

                                    </div>


                                    <!-- TERMS -->

                                    <div class="col-12">

                                        <div class="form-check">

                                            <asp:CheckBox
                                                ID="chkMentorTerms"
                                                runat="server" />

                                            <label class="form-check-label small text-muted">
                                                I agree to the terms of service and privacy policy.
                                           
                                            </label>

                                        </div>

                                        <asp:CustomValidator
                                            ID="cvMentorTerms"
                                            runat="server"
                                            ValidationGroup="MentorRegister"
                                            ErrorMessage="You must agree to the terms."
                                            CssClass="validation-error"
                                            Display="Dynamic"
                                            OnServerValidate="cvMentorTerms_ServerValidate">
                                        </asp:CustomValidator>

                                    </div>


                                    <!-- BUTTON -->

                                    <div class="col-12">

                                        <asp:Button
                                            ID="btnMentorRegister"
                                            runat="server"
                                            Text="Create Mentor Account"
                                            CssClass="btn gradient-btn w-100"
                                            ValidationGroup="MentorRegister"
                                            OnClick="btnMentorRegister_Click" />

                                    </div>


                                    <div class="col-12">

                                        <p class="text-center small text-muted mb-0">
                                            Already have an account?

                                           

                                            <a href="#"
                                                class="js-tab-switch"
                                                data-target-tab="login-tab">Sign In

                                            </a>

                                        </p>

                                    </div>

                                </div>

                            </div>


                            <!-- ================= MENTEE REGISTER ================= -->

                            <div id="reg-step-mentee"
                                style="display: none;">

                                <button type="button"
                                    class="btn btn-link reg-back btn-sm px-0 mb-2">

                                    <i class="bi bi-arrow-left"></i>
                                    Back

                               
                                </button>


                                <div class="mb-3">

                                    <h2 class="fw-bold mb-1">

                                        <i class="bi bi-mortarboard-fill me-2 form-icon-mentee"></i>

                                        Mentee Registration

                                    </h2>

                                    <p class="text-muted">
                                        Fill in your details to create mentee account
                                   
                                    </p>

                                </div>


                                <asp:Label
                                    ID="lblMenteeMessage"
                                    runat="server">
                                </asp:Label>


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
                                            placeholder="Enter full name">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteeFullName"
                                            runat="server"
                                            ControlToValidate="txtMenteeFullName"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Full Name is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Enter email">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteeEmail"
                                            runat="server"
                                            ControlToValidate="txtMenteeEmail"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Email is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            ID="revMenteeEmail"
                                            runat="server"
                                            ControlToValidate="txtMenteeEmail"
                                            ValidationGroup="MenteeRegister"
                                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                            ErrorMessage="Enter a valid email address."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>

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
                                            placeholder="Create password">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteePassword"
                                            runat="server"
                                            ControlToValidate="txtMenteePassword"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Password is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            ID="revMenteePassword"
                                            runat="server"
                                            ControlToValidate="txtMenteePassword"
                                            ValidationGroup="MenteeRegister"
                                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d).{6,}$"
                                            ErrorMessage="Password must be at least 6 characters and contain a number."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>

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
                                            placeholder="Enter phone number">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvMenteePhone"
                                            runat="server"
                                            ControlToValidate="txtMenteePhone"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Phone number is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            ID="revMenteePhone"
                                            runat="server"
                                            ControlToValidate="txtMenteePhone"
                                            ValidationGroup="MenteeRegister"
                                            ValidationExpression="^[0-9]{10,15}$"
                                            ErrorMessage="Phone must contain 10 to 15 digits."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>

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

                                            <asp:ListItem Text="Select education"
                                                Value="" />

                                            <asp:ListItem Text="High School"
                                                Value="High School" />

                                            <asp:ListItem Text="BCA"
                                                Value="BCA" />

                                            <asp:ListItem Text="B.Tech / B.E."
                                                Value="B.Tech / B.E." />

                                            <asp:ListItem Text="MCA"
                                                Value="MCA" />

                                            <asp:ListItem Text="M.Tech / M.E."
                                                Value="M.Tech / M.E." />

                                            <asp:ListItem Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator
                                            ID="rfvEducation"
                                            runat="server"
                                            ControlToValidate="ddlEducation"
                                            InitialValue=""
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Please select education."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Enter college name">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvCollege"
                                            runat="server"
                                            ControlToValidate="txtCollege"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="College / University is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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

                                            <asp:ListItem Text="Select career goal"
                                                Value="" />

                                            <asp:ListItem Text="Software Developer"
                                                Value="Software Developer" />

                                            <asp:ListItem Text="Data Scientist"
                                                Value="Data Scientist" />

                                            <asp:ListItem Text="Product Manager"
                                                Value="Product Manager" />

                                            <asp:ListItem Text="UI/UX Designer"
                                                Value="UI/UX Designer" />

                                            <asp:ListItem Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator
                                            ID="rfvCareerGoal"
                                            runat="server"
                                            ControlToValidate="ddlCareerGoal"
                                            InitialValue=""
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Please select career goal."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="What do you want to learn?">
                                        </asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            ID="rfvLearningGoal"
                                            runat="server"
                                            ControlToValidate="txtLearningGoal"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Learning Goal is required."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Add skills or interests">
                                        </asp:TextBox>

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

                                            <asp:ListItem Text="Select preferred domain"
                                                Value="" />

                                            <asp:ListItem Text="Data Science"
                                                Value="Data Science" />

                                            <asp:ListItem Text="Software Engineering"
                                                Value="Software Engineering" />

                                            <asp:ListItem Text="Product Management"
                                                Value="Product Management" />

                                            <asp:ListItem Text="UI/UX Design"
                                                Value="UI/UX Design" />

                                            <asp:ListItem Text="Marketing"
                                                Value="Marketing" />

                                            <asp:ListItem Text="Other"
                                                Value="Other" />

                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator
                                            ID="rfvPreferredDomain"
                                            runat="server"
                                            ControlToValidate="ddlPreferredDomain"
                                            InitialValue=""
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="Please select preferred domain."
                                            CssClass="validation-error"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>

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
                                            placeholder="Tell mentors about yourself...">
                                        </asp:TextBox>

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

                                        <small class="text-muted">JPG, JPEG, PNG only. Maximum 2 MB.
                                        </small>

                                    </div>


                                    <!-- TERMS -->

                                    <div class="col-12">

                                        <div class="form-check">

                                            <asp:CheckBox
                                                ID="chkMenteeTerms"
                                                runat="server" />

                                            <label class="form-check-label small text-muted">
                                                I agree to the terms of service and privacy policy.
                                           
                                            </label>

                                        </div>

                                        <asp:CustomValidator
                                            ID="cvMenteeTerms"
                                            runat="server"
                                            ValidationGroup="MenteeRegister"
                                            ErrorMessage="You must agree to the terms."
                                            CssClass="validation-error"
                                            Display="Dynamic"
                                            OnServerValidate="cvMenteeTerms_ServerValidate">
                                        </asp:CustomValidator>

                                    </div>


                                    <!-- BUTTON -->

                                    <div class="col-12">

                                        <asp:Button
                                            ID="btnMenteeRegister"
                                            runat="server"
                                            Text="Create Mentee Account"
                                            CssClass="btn btn-mentee-green w-100"
                                            ValidationGroup="MenteeRegister"
                                            OnClick="btnMenteeRegister_Click" />

                                    </div>


                                    <div class="col-12">

                                        <p class="text-center small text-muted mb-0">
                                            Already have an account?

                                           

                                            <a href="#"
                                                class="js-tab-switch"
                                                data-target-tab="login-tab">Sign In

                                            </a>

                                        </p>

                                    </div>

                                </div>

                            </div>


                            <!-- ================= SUCCESS ================= -->

                            <div id="reg-step-success"
                                style="display: none;"
                                class="text-center py-4">

                                <div class="success-check mb-3">

                                    <i class="bi bi-check-circle-fill"></i>

                                </div>

                                <h3 class="fw-bold mb-2">Registration Successful!
                                </h3>

                                <p class="text-muted mb-4">
                                    Your account has been created successfully.

                                   

                                    <br />

                                    Please login to continue.

                               
                                </p>

                                <a href="#"
                                    id="reg-goto-login"
                                    class="btn gradient-btn js-tab-switch"
                                    data-target-tab="login-tab">Go to Login Page

                                </a>

                                <p class="small text-muted mt-3 mb-0">
                                    Thank you for joining MentorHub!
                               
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- BOOTSTRAP JS -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- YOUR JS -->

    <script src="<%= ResolveUrl("~/Mentor/assets/js/main.js") %>"></script>


    <!-- REGISTRATION JS -->

    <script type="text/javascript">

        (function () {

            var stepRole =
                document.getElementById('reg-step-role');

            var stepMentor =
                document.getElementById('reg-step-mentor');

            var stepMentee =
                document.getElementById('reg-step-mentee');

            var stepSuccess =
                document.getElementById('reg-step-success');


            var allSteps = [
                stepRole,
                stepMentor,
                stepMentee,
                stepSuccess
            ];


            function showStep(step) {

                allSteps.forEach(function (item) {

                    if (item) {

                        item.style.display =
                            item === step ? '' : 'none';

                    }

                });

            }


            /* ROLE SELECTION */

            document
                .querySelectorAll('.role-card')
                .forEach(function (card) {

                    function selectRole() {

                        var role =
                            card.getAttribute('data-role');

                        if (role === 'mentor') {

                            showStep(stepMentor);

                        }
                        else if (role === 'mentee') {

                            showStep(stepMentee);

                        }

                    }


                    card.addEventListener(
                        'click',
                        selectRole
                    );


                    card.addEventListener(
                        'keydown',
                        function (event) {

                            if (
                                event.key === 'Enter' ||
                                event.key === ' '
                            ) {

                                event.preventDefault();

                                selectRole();

                            }

                        }
                    );

                });


            /* BACK BUTTON */

            document
                .querySelectorAll('.reg-back')
                .forEach(function (button) {

                    button.addEventListener(
                        'click',
                        function () {

                            showStep(stepRole);

                        }
                    );

                });


            /* TAB SWITCH */

            document
                .querySelectorAll('.js-tab-switch')
                .forEach(function (link) {

                    link.addEventListener(
                        'click',
                        function (event) {

                            event.preventDefault();

                            var targetId =
                                link.getAttribute(
                                    'data-target-tab'
                                );

                            var targetTab =
                                document.getElementById(
                                    targetId
                                );

                            if (
                                targetTab &&
                                window.bootstrap
                            ) {

                                var tab =
                                    bootstrap.Tab
                                        .getOrCreateInstance(
                                            targetTab
                                        );

                                tab.show();

                            }

                            if (
                                targetId ===
                                'register-tab'
                            ) {

                                showStep(stepRole);

                            }

                        }
                    );

                });


            /* REGISTER TAB */

            var registerTab =
                document.getElementById(
                    'register-tab'
                );


            if (registerTab) {

                registerTab.addEventListener(
                    'shown.bs.tab',
                    function () {

                        showStep(stepRole);

                    }
                );

            }


            /* REGISTRATION SUCCESS */

            var registrationSuccess =
                document.getElementById(
                    '<%= RegistrationSuccess.ClientID %>'
                );


            if (
                registrationSuccess &&
                registrationSuccess.value === '1'
            ) {

                showStep(stepSuccess);

            }

        })();

    </script>

</asp:Content>

