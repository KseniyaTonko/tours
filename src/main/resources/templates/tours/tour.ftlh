<#import '../index.ftlh' as i>
<#import '../hotels/loadHotelImg.ftlh' as img>
<#import 'loadTourImage.ftlh' as tourImg>
<#import 'deleteTourImage.ftlh' as delImg>
<#import 'modalBuy.ftlh' as buy>
<#import 'modalBook.ftlh' as book>

<@i.page>

    <style>
        .card-img-top {
            height: 300px
        }
        .img-carousel {
            max-height: 400px;
        }
    </style>

    <#if user?? && user.getIsAdmin()>
        <div class="m-2">
            <form action="/edit-tour" method="get" style="display: inline-block;">
                <input type="hidden" name="id" value="${tour.getId()}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary" style="color: black;">
                    <i class="fa fa-edit"></i>
                </button>
            </form>
            <@tourImg.loadImage tour></@tourImg.loadImage>
        </div>
    </#if>

    <div class="row justify-content-center m-5">
        <div class="col-md-8">
            <!-- Column -->
            <div class="card">
                <!--<img class="card-img-top" src="https://res.cloudinary.com/dwfvcpiak/image/upload/v1637921673/%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5_2021-11-26_131430_vfm3p1.png"
                     alt="Tour image">-->
                <#if tour.getImages()?size != 0>
                    <div>
                        <div id="CarouselTest" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <#list tour.getImages() as image>
                                    <#if image?index==0>
                                        <li data-target="#CarouselTest" data-slide-to="${image?index}" class="active"></li>
                                    <#else>
                                        <li data-target="#CarouselTest" data-slide-to="${image?index}"></li>
                                    </#if>
                                </#list>
                            </ol>
                            <div class="carousel-inner" style="height: 400px;">
                                <#list tour.getImages() as image>
                                    <#if image?index==0>
                                        <div class="carousel-item active text-center">
                                            <#if user?? && user.getIsAdmin()>
                                                <@delImg.deleteTourImg tour image></@delImg.deleteTourImg>
                                            </#if>
                                            <img class="img-carousel" src="${image.getImage()}" alt="Tour image">
                                        </div>
                                    <#else>
                                        <div class="carousel-item text-center">
                                            <#if user?? && user.getIsAdmin()>
                                                <@delImg.deleteTourImg tour image></@delImg.deleteTourImg>
                                            </#if>
                                            <img class="img-carousel" src="${image.getImage()}" alt="Tour image">
                                        </div>
                                    </#if>
                                </#list>
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
                </#if>

                <div class="card-body little-profile text-left m-2">
                    <#if message??>
                        <div class="alert alert-info" role="alert">
                            ${message}
                        </div>
                    </#if>

                    <h3 class="m-b-0 text-center">
                        ${tour.getName()}
                        <#if user?? && tour.getRemainingSeats() != 0 && canBuy??>
                            <@buy.modalBuy profile tour></@buy.modalBuy>
                            <#if canBook??>
                                <@book.modalBook profile tour></@book.modalBook>
                            </#if>
                        </#if>
                    </h3>

                    <p class="text-center"><a style="text-decoration: none;" class="form-a"
                                 href="/hotel/#{tour.getHotel().getId()}">${tour.getHotel().getName()}</a></p>
                    <div class="text-center">
                        <h4 id="priceLabel" style="display: inline-block;">${tour.getPrice()}$</h4>
                        <#if user?? && user.getIsAdmin()>
                            <button id="editBtn" class="btn form-btn" style="display: inline-block;"
                                    data-toggle="collapse" data-target="#collapseForm">
                                <i class="fa fa-edit"></i>
                            </button>
                            <div class="container rounded-top">
                                <div class="row justify-content-center m-1">
                                    <div class="col-md-offset-1 col-md-8 text-center">
                                        <div class="collapse m-1" id="collapseForm">
                                            <form method="post" action="/edit-price">
                                                <label>Price:
                                                    <input required type="number" min="0" max="1000000" step="0.01"
                                                           name="price" class="form-control"
                                                           id="inputPrice" value="${tour.getPrice()}"
                                                           placeholder="New price"/>
                                                </label>
                                                <input type="hidden" name="tourId" value="${tour.getId()}"/>
                                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                <button type="submit" class="btn form-btn" style="display: inline-block;">
                                                    Save
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="m-5">
                        <p><strong><@spring.message "country"></@spring.message>:</strong> ${tour.getCountry()}</p>
                        <p><strong><@spring.message "resort"></@spring.message>:</strong> ${tour.getResort()}</p>
                        <p><strong><@spring.message "town.from"></@spring.message>:</strong> ${tour.getTownFrom()}</p>
                        <p><strong><@spring.message "lasting"></@spring.message>:</strong> ${tour.getLasting()}</p>
                        <p><strong><@spring.message "start.date"></@spring.message>:</strong> ${tour.getStartTime()}</p>
                        <p><strong><@spring.message "end.date"></@spring.message>:</strong> ${tour.getEndDate()}</p>
                        <p><strong><@spring.message "transport"></@spring.message>:</strong> <@spring.message '${tour.getTransport()}'/></p>
                        <p><strong><@spring.message "tour.type"></@spring.message>:</strong> <@spring.message '${tour.getType()}'/></p>
                        <p><strong><@spring.message "food.type"></@spring.message>:</strong> <@spring.message '${tour.getFoodType()}'/></p>
                        <p>${tour.getDescription()}</p>
                        <p><strong><@spring.message "seats"></@spring.message>:</strong> ${tour.getRemainingSeats()}</p>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>
        let editBtn = document.getElementById('editBtn');
        if (editBtn != null) {
            editBtn.addEventListener('click', function (e) {
                    let label = document.getElementById("priceLabel");
                    if (label.style.visibility === "hidden") {
                        label.style.visibility = "visible";
                    } else {
                        label.style.visibility = "hidden";
                    }
                })
            ;
        }
    </script>
</@i.page>