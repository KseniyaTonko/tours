<#import "../index.ftlh" as i>
    <#import "modalPayBooked.ftlh" as pay>
    <#import "modalRevoke.ftlh" as revoke>

<@i.page>

    <style>
        body {
            background-color:  #eee;
        }
        .title {

            margin-bottom: 50px;
            text-transform: uppercase;
        }

        .card-block {
            font-size: 1em;
            position: relative;
            margin: 0;
            padding: 1em;
            border: none;
            border-top: 1px solid rgba(34, 36, 38, .1);
            box-shadow: none;

        }
        .card {
            font-size: 1em;
            overflow: hidden;
            padding: 5px;
            border: none;
            border-radius: .28571429rem;
            box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
            margin-top:20px;
        }
        .btn {
            margin-top: auto;
        }
    </style>

    <div class="container py-3">
        <div class="title h1 text-center">
            <#if title??>
                ${title}
            <#else>
                Tours
            </#if>
        </div>
        <#if message??>
            <div class="alert alert-info" role="alert">
                ${message}
            </div>
        </#if>
        <#list tours as userTour>
            <!-- Card Start -->
            <div class="card">
                <div class="row ">

                    <div class="col-md-7 px-3">
                        <div class="card-block px-6">
                            <h4 class="card-title">${userTour.getTour().getName()}</h4>
                            <p class="card-text">
                                <strong style="color: var(--darkest-color);">
                                    purchase: ${userTour.getPrice()}$ * ${userTour.getSeats()}(seats)
                                </strong>
                            </p>
                            <p class="card-text">${userTour.getTour().getStartTime()} - ${userTour.getTour().getEndDate()}</p>
                            <#if userTour.getEndBookDate()??>
                                <p style="color: darkred;">End booking time: ${userTour.getEndBookDate()}</p>
                            </#if>
                            <br>
                            <a href="/tour/${userTour.getTour().getId()}" class="mt-auto glo">Read More</a>
                            <#if userTour.getEndBookDate()??>
                                <@pay.modalPayBooked profile userTour></@pay.modalPayBooked>
                                <@revoke.modalRevoke profile userTour></@revoke.modalRevoke>
                            </#if>
                        </div>
                    </div>
                    <!-- Carousel start -->
                    <div class="col-md-5">
                        <div id="CarouselTest" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <#list userTour.getTour().getImages() as image>
                                    <#if image?index==0>
                                        <li data-target="#CarouselTest" data-slide-to="${image?index}" class="active"></li>
                                    <#else>
                                        <li data-target="#CarouselTest" data-slide-to="${image?index}"></li>
                                    </#if>
                                </#list>
                            </ol>
                            <div class="carousel-inner" style="height: 300px;">
                                <#list userTour.getTour().getImages() as image>
                                    <#if image?index==0>
                                        <div class="carousel-item active">
                                            <img class="d-block" src="${image.getImage()}" alt="Tour image">
                                        </div>
                                    <#else>
                                        <div class="carousel-item">
                                            <img class="d-block" src="${image.getImage()}" alt="Tour image">
                                        </div>
                                    </#if>
                                </#list>
                                <#if userTour.getTour().getImages()?size == 0>
                                    <div class="carousel-item active">
                                        <img class="d-block" src="https://res.cloudinary.com/dwfvcpiak/image/upload/v1638268098/%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5_2021-11-30_132816_z17bqu.png"
                                             alt="Tour image">
                                    </div>
                                </#if>
                                <a class="carousel-control-prev" href="#CarouselTest" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#CarouselTest" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- End of carousel -->
                </div>
            </div>
            <!-- End of card -->
        </#list>
    </div>

    <#if tours?size == 0>
        <div class="card-body text-center">
            <div class="alert alert-info" role="alert">
                <p>No such tours</p>
            </div>
        </div>
    </#if>

</@i.page>