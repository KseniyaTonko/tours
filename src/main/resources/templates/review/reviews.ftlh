<#macro reviews hotel>

    <#import 'modalDelReview.ftlh' as del>


    <style>
        a {
            text-decoration: none !important;
            color: inherit
        }

        a:hover {
            color: #455A64
        }

        .card {
            border-radius: 5px;
            background-color: #fff;
            padding-left: 60px;
            padding-right: 60px;
            margin-top: 30px;
            padding-top: 30px;
            padding-bottom: 30px
        }

        .rating-box {
            width: 130px;
            height: 130px;
            margin-right: auto;
            margin-left: auto;
            background-color: #FBC02D;
            color: #fff
        }

        .rating-label {
            font-weight: bold
        }

        .rating-bar {
            width: 300px;
            padding: 8px;
            border-radius: 5px
        }

        .bar-container {
            width: 100%;
            background-color: #f1f1f1;
            text-align: center;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            margin-bottom: 5px
        }

        .bar-5 {
            width: 70%;
            height: 13px;
            background-color: #FBC02D;
            border-radius: 20px
        }

        .bar-4 {
            width: 30%;
            height: 13px;
            background-color: #FBC02D;
            border-radius: 20px
        }

        .bar-3 {
            width: 20%;
            height: 13px;
            background-color: #FBC02D;
            border-radius: 20px
        }

        .bar-2 {
            width: 10%;
            height: 13px;
            background-color: #FBC02D;
            border-radius: 20px
        }

        .bar-1 {
            width: 0%;
            height: 13px;
            background-color: #FBC02D;
            border-radius: 20px
        }

        td {
            padding-bottom: 10px
        }

        .star-active {
            color: #FBC02D;
            margin-top: 10px;
            margin-bottom: 10px
        }

        .star-active:hover {
            color: #F9A825;
            cursor: pointer
        }

        .star-inactive {
            color: #CFD8DC;
            margin-top: 10px;
            margin-bottom: 10px
        }

        .blue-text {
            color: black;
        }

        .content {
            font-size: 18px
        }

        .profile-pic {
            width: 90px;
            height: 90px;
            border-radius: 100%;
        }

        .pic {
            width: 80px;
            height: 80px;
            margin-right: 10px
        }

        .vote {
            cursor: pointer
        }
    </style>

    <div class="container-fluid px-1 py-5 mx-auto">
        <div class="row justify-content-center">
            <div class="col-xl-7 col-lg-8 col-md-10 col-12 text-center mb-5">

                <div class="card">
                    <div class="row justify-content-left d-flex">
                        <div class="col-md-4 d-flex flex-column">
                            <div class="rating-box">
                                <h1 class="pt-4">${rating}</h1>
                                <p class="">out of 5</p>
                            </div>
                            <div>
                                <span class="fa fa-star <#if (rating > 0)>star-active<#else>star-inactive</#if>  mx-1"></span>
                                <span class="fa fa-star <#if (rating > 1)>star-active<#else>star-inactive</#if> mx-1"></span>
                                <span class="fa fa-star <#if (rating > 2)>star-active<#else>star-inactive</#if> mx-1"></span>
                                <span class="fa fa-star <#if (rating > 3)>star-active<#else>star-inactive</#if> mx-1"></span>
                                <span class="fa fa-star <#if (rating > 4)>star-active<#else>star-inactive</#if> mx-1"></span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="rating-bar0 justify-content-center">
                                <table class="text-left mx-auto">
                                    <tr>
                                        <td class="rating-label">Excellent</td>
                                        <td class="rating-bar">
                                            <div class="bar-container">
                                                <div class="bar-5"
                                                     style="width: calc(100% * (${fiveStars} / ${starsCount}))">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right">${fiveStars}</td>
                                    </tr>
                                    <tr>
                                        <td class="rating-label">Good</td>
                                        <td class="rating-bar">
                                            <div class="bar-container">
                                                <div class="bar-4"
                                                     style="width: calc(100% * (${fourStars} / ${starsCount}))">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right">${fourStars}</td>
                                    </tr>
                                    <tr>
                                        <td class="rating-label">Average</td>
                                        <td class="rating-bar">
                                            <div class="bar-container">
                                                <div class="bar-3"
                                                     style="width: calc(100% * (${threeStars} / ${starsCount}))">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right">${threeStars}</td>
                                    </tr>
                                    <tr>
                                        <td class="rating-label">Poor</td>
                                        <td class="rating-bar">
                                            <div class="bar-container">
                                                <div class="bar-2"
                                                     style="width: calc(100% * (${twoStars} / ${starsCount}))">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right">${twoStars}</td>
                                    </tr>
                                    <tr>
                                        <td class="rating-label">Terrible</td>
                                        <td class="rating-bar">
                                            <div class="bar-container">
                                                <div class="bar-1"
                                                     style="width: calc(100% * (${oneStar} / ${starsCount}))">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right">${oneStar}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid px-1 py-5 mx-auto" id="reviewsSection">
    <div class="row justify-content-center m-5 mt-0">
        <div class="col-md-8">

            <#list hotel.getReviews() as review>
                <div class="card justify-content-left text-left"
                     <#if review.getRecommend() == true>style="background: mediumseagreen;"
                     <#else>style="background: indianred;"</#if>>

                    <div class="row d-inline-flex">
                        <div class="col-3">
                            <#if review.getUser().getImage()??>
                                <img class="profile-pic" src="${review.getUser().getImage().getImage()}" alt="">
                            <#else>
                                <img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg" alt="">
                            </#if>
                        </div>
                        <div class="col-6 justify-content-left" style="display: inline-block;">
                            <h3 class="mt-2 mb-0 ml-0" style="display: inline-block; left: 0;">
                                <a href="/profile/${review.getUser().getId()}">${review.getUser().getUsername()}</a>
                            </h3>
                            <div>
                                <p class="text-left">
                                    <span class="text-muted">${review.getMark()}</span>
                                    <span class="fa fa-star star-active ml-3"></span>
                                    <span class="fa fa-star <#if (review.getMark() > 1)>star-active</#if>"></span>
                                    <span class="fa fa-star <#if (review.getMark() > 2)>star-active</#if>"></span>
                                    <span class="fa fa-star <#if (review.getMark() > 3)>star-active</#if>"></span>
                                    <span class="fa fa-star <#if (review.getMark() > 4)>star-active</#if>"></span>
                                </p>
                            </div>
                        </div>
                        <div class="ml-auto col-3">
                            <p class="text-muted pt-5 pt-sm-3" style="color: #333333;">${review.getDate()?string.short}</p>
                        </div>
                    </div>

                    <div class="row text-left" style="display: inline-block;">
                        <h4 class="blue-text mt-3" style="display: inline-block;">Time in hotel: ${review.getResidenceTime()}</h4>
                        <p class="content" style="display: inline-block;">${review.getText()}</p>
                    </div>
                    <!-- like -->
                    <div class="row text-left mt-4" style="display: inline-block;">
                        <div class="like mr-3 vote">
                            <a type="submit" href="/like/${review.getId()}/${hotel.getId()}" class="btn" style="background: none; border: none;">
                                ${review.getLikes()?size} <i class="fa fa-thumbs-up"
                                        <#if user?? && review.getLikes()?seq_contains(userFull)>
                                            style="color: var(--darkest-color)"
                                        </#if>></i>
                            </a>
                            <#if user?? && (user.getIsAdmin() || user.getId() == review.getUser().getId())>
                                 <@del.deleteReview review></@del.deleteReview>
                            </#if>
                        </div>
                    </div>
                </div>
            </#list>

        </div>
    </div>

    </div>
</#macro>