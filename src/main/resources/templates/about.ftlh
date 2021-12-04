<#import "index.ftlh" as i>

<@i.page>

    <style>
        .section_padding_130 {
            padding-top: 130px;
            padding-bottom: 130px;
        }
        .faq_area {
            position: relative;
            z-index: 1;
            background-color: #f5f5ff;
        }

        .faq-accordian {
            position: relative;
            z-index: 1;
        }
        .faq-accordian .card {
            position: relative;
            z-index: 1;
            margin-bottom: 1.5rem;
        }
        .faq-accordian .card:last-child {
            margin-bottom: 0;
        }
        .faq-accordian .card .card-header {
            background-color: #ffffff;
            padding: 0;
            border-bottom-color: #ebebeb;
        }
        .faq-accordian .card .card-header h6 {
            cursor: pointer;
            padding: 1.75rem 2rem;
            color: var(--second-dark-color);
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -ms-grid-row-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
        }
        .faq-accordian .card .card-header h6 span {
            font-size: 1.5rem;
        }
        .faq-accordian .card .card-header h6.collapsed {
            color: black;
        }
        .faq-accordian .card .card-header h6.collapsed span {
            -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
        }
        .faq-accordian .card .card-body {
            padding: 1.75rem 2rem;
        }
        .faq-accordian .card .card-body p:last-child {
            margin-bottom: 0;
        }

        @media only screen and (max-width: 575px) {
            .support-button p {
                font-size: 14px;
            }
        }

        .support-button i {
            color: var(--darkest-color);
            font-size: 1.25rem;
        }
        @media only screen and (max-width: 575px) {
            .support-button i {
                font-size: 1rem;
            }
        }

        .support-button a {
            text-transform: capitalize;
            color: var(--second-dark-color);
        }
        @media only screen and (max-width: 575px) {
            .support-button a {
                font-size: 13px;
            }
        }
        .support-button a:hover {
            color: var(--darkest-color);
        }
    </style>

    <div class="faq_area section_padding_130" id="faq">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-8 col-lg-6">
                    <!-- Section Heading-->
                    <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                        <h3><span>Frequently </span> Asked Questions</h3>
                        <p>Here you can find information about using our website.</p>
                        <div class="line"></div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <!-- FAQ Area-->
                <div class="col-12 col-sm-10 col-lg-8">
                    <div class="accordion faq-accordian" id="faqAccordion">
                        <div class="card border-0 wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                            <div class="card-header" id="headingOne">
                                <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Can I buy or book tour without creating an account?<span class="lni-chevron-up"></span></h6>
                            </div>
                            <div class="collapse" id="collapseOne" aria-labelledby="headingOne" data-parent="#faqAccordion">
                                <div class="card-body">
                                    <p>No, having an account is necessary.</p>
                                    <p>But you can see all enabled tours with hotels and reviews to hotels without it.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card border-0 wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                            <div class="card-header" id="headingTwo">
                                <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    How can I buy tours?<span class="lni-chevron-up"></span></h6>
                            </div>
                            <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo" data-parent="#faqAccordion">
                                <div class="card-body">
                                    <p>All you need is sign in, add credit card in your profile and press button "Buy" in the tour's page.</p>
                                    <p>After the purchase you can see the tour in your personal tour list in your profile.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card border-0 wow fadeInUp" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            <div class="card-header" id="headingThree">
                                <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                                    How I can booking tours?<span class="lni-chevron-up"></span></h6>
                            </div>
                            <div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#faqAccordion">
                                <div class="card-body">
                                    <p>Press button "Book" in the tour's page. Booked tours will appear in your booked list in profile.</p>
                                    <p>You don't need to pay to book tour.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card border-0 wow fadeInUp" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            <div class="card-header" id="headingFour">
                                <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                    When I need to pay for booked tour?<span class="lni-chevron-up"></span></h6>
                            </div>
                            <div class="collapse" id="collapseFour" aria-labelledby="headingFour" data-parent="#faqAccordion">
                                <div class="card-body">
                                    <p>Since booking time you have only <strong>one week</strong> to pay all price.</p>
                                    <p>Otherwise tour will be excluded from your booked tours.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card border-0 wow fadeInUp" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                            <div class="card-header" id="headingFive">
                                <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
                                    Why I can't write review to hotel with my account?<span class="lni-chevron-up"></span></h6>
                            </div>
                            <div class="collapse" id="collapseFive" aria-labelledby="headingFive" data-parent="#faqAccordion">
                                <div class="card-body">
                                    <p>Only people who really was in the hotel can make a review to it.</p>
                                    <p>Also you can't make more than one review to one hotel.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Support Button-->
                    <div class="support-button text-center d-flex align-items-center justify-content-center mt-4 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <i class="lni-emoji-sad"></i>
                        <p class="mb-0 px-2">Can't find your answers?</p>
                        <a href="/contacts"> Contact us</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@i.page>