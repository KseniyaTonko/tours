<#import '../index.ftlh' as i>
<#import '../hotels/loadHotelImg.ftlh' as img>
<#import '../review/reviews.ftlh' as rev>
<#import '../review/addReview.ftlh' as addRev>

<@i.page>

    <style>
        .card-img-top {
            height: 300px
        }

        .checked {
            color: orange;
        }
    </style>

    <#if user?? && user.getIsAdmin()>
        <div class="m-2">
            <form action="/edit-hotel" method="get" style="display: inline-block;">
                <input type="hidden" name="id" value="${hotel.getId()}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary" style="color: black;">
                    <@spring.message "edit"></@spring.message>
                </button>
            </form>
            <#if hotel.getImage()??>
                <form action="/delete-hotel-image" method="post" style="display: inline-block;">
                    <input type="hidden" name="hotelId" value="${hotel.getId()}">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="submit" class="btn btn-primary" style="color: black;"
                           value="<@spring.message "delete.image"/>">
                </form>
            </#if>
            <@img.loadImage hotel></@img.loadImage>
        </div>
    </#if>

    <div class="row justify-content-center m-5">
        <div class="col-md-8">
            <!-- Column -->
            <div class="card">
                <#if hotel.getImage()??>
                    <img class="card-img-top" src="${hotel.getImage()}" alt="Holel photo">
                    <!--<img class="col-6" src="{hotel.getImage()}" alt="image"/><br>-->
                </#if>
                <div class="card-body little-profile text-center m-2">
                    <h3 class="m-b-0">${hotel.getName()}</h3>
                    <div>
                        <span class="fa fa-star <#if (hotel.getStarsCount() > 0)>checked</#if>"></span>
                        <span class="fa fa-star <#if (hotel.getStarsCount() > 1)>checked</#if>"></span>
                        <span class="fa fa-star <#if (hotel.getStarsCount() > 2)>checked</#if>"></span>
                        <span class="fa fa-star <#if (hotel.getStarsCount() > 3)>checked</#if>"></span>
                        <span class="fa fa-star <#if (hotel.getStarsCount() > 4)>checked</#if>"></span>
                    </div><br>
                    <p>Rating: ${hotel.getRating()}</p>
                    <p>Location: ${hotel.getLocation()}</p>
                    <p>Location type: ${hotel.getLocationType()}</p>
                </div>
            </div>
        </div>
    </div>
    <#if user?? && wasInHotel??>
        <@addRev.addReview user hotel></@addRev.addReview>
    </#if>
    <@rev.reviews hotel></@rev.reviews>
</@i.page>