<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="MentorHub.Home.faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="py-5">
        <div class="container">

            <div class="page-header">
                <span class="page-badge">
                    <i class="bi bi-question-circle"></i>
                    Frequently asked questions
                </span>

                <h1 class="display-6 fw-bold mt-3">
                    Everything you need to know before you begin.
                </h1>

                <p class="text-muted mt-2 mb-0">
                    Clear answers for mentors, mentees, and admins exploring the matching journey.
                </p>
            </div>

            <div class="row g-4 align-items-start">

                <div class="col-lg-8">

                    <div class="accordion" id="faqAccordion">

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingOne">
                                <button type="button"
                                    class="accordion-button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqOne"
                                    aria-expanded="true"
                                    aria-controls="faqOne">

                                    How does MentorHub recommend mentors?

                                </button>
                            </h2>

                            <div id="faqOne"
                                class="accordion-collapse collapse show"
                                aria-labelledby="headingOne"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    We match users by skills, industry experience,
                                    availability, and goals so the connection feels
                                    relevant and practical.
                                </div>

                            </div>
                        </div>

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingTwo">
                                <button type="button"
                                    class="accordion-button collapsed"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqTwo"
                                    aria-expanded="false"
                                    aria-controls="faqTwo">

                                    Can I switch mentors later?

                                </button>
                            </h2>

                            <div id="faqTwo"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingTwo"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    Yes. Requests can be updated and managed from
                                    the dashboard, and admins can approve or redirect
                                    matches as needed.
                                </div>

                            </div>
                        </div>

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingThree">
                                <button type="button"
                                    class="accordion-button collapsed"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqThree"
                                    aria-expanded="false"
                                    aria-controls="faqThree">

                                    How are sessions tracked?

                                </button>
                            </h2>

                            <div id="faqThree"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingThree"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    Sessions, feedback, and progress are recorded
                                    through the dashboard so both parties can monitor
                                    learning outcomes.
                                </div>

                            </div>
                        </div>

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingFour">
                                <button type="button"
                                    class="accordion-button collapsed"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqFour"
                                    aria-expanded="false"
                                    aria-controls="faqFour">

                                    Is MentorHub free to join?

                                </button>
                            </h2>

                            <div id="faqFour"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingFour"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    Yes, creating an account and browsing mentor profiles
                                    is completely free for students and professionals.
                                </div>

                            </div>
                        </div>

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingFive">
                                <button type="button"
                                    class="accordion-button collapsed"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqFive"
                                    aria-expanded="false"
                                    aria-controls="faqFive">

                                    Who approves mentor requests?

                                </button>
                            </h2>

                            <div id="faqFive"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingFive"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    Admins review each request to make sure the pairing
                                    is a good fit before it's confirmed and scheduled.
                                </div>

                            </div>
                        </div>

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingSix">
                                <button type="button"
                                    class="accordion-button collapsed"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqSix"
                                    aria-expanded="false"
                                    aria-controls="faqSix">

                                    Can mentors set their own availability?

                                </button>
                            </h2>

                            <div id="faqSix"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingSix"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    Yes, mentors control their own schedule and mentees
                                    can only book within those open slots.
                                </div>

                            </div>
                        </div>

                        <div class="accordion-item border-0 dashboard-card mb-3">

                            <h2 class="accordion-header" id="headingSeven">
                                <button type="button"
                                    class="accordion-button collapsed"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#faqSeven"
                                    aria-expanded="false"
                                    aria-controls="faqSeven">

                                    What if I'm not satisfied with a match?

                                </button>
                            </h2>

                            <div id="faqSeven"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingSeven"
                                data-bs-parent="#faqAccordion">

                                <div class="accordion-body text-muted">
                                    You can end a mentorship and request a new match
                                    at any time from your dashboard settings.
                                </div>

                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-lg-4">

                    <div class="dashboard-card p-4">

                        <h5 class="fw-semibold mb-3">
                            Need help?
                        </h5>

                        <p class="text-muted">
                            Contact our support team for onboarding, account setup,
                            or mentor matching assistance.
                        </p>

                        <a href="contact.aspx" class="btn gradient-btn">
                            Get in touch
                        </a>

                    </div>

                </div>

            </div>

        </div>
    </section>

</asp:Content>