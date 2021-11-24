<#import '../index.ftlh' as i>
<#import 'profileAdminActions.ftlh' as admin>
<#import 'loadProfileImg.ftlh' as img>

<@i.page>

    <style>

        .cover {
            background-size: cover;
            background: #885a89 no-repeat;
        }

    </style>

    <div class="row py-5 px-4">
        <div class="col-md-8 mx-auto">
            <!-- Profile widget -->
            <div class="bg-white shadow rounded overflow-hidden">
                <div class="p-4 cover">
                    <div class="media align-items-start profile-head">
                        <div class="media-body m-5 text-white">
                            <#if profile.getImage()??>
                                <img src="${profile.getImage()}"
                                     alt="Photo" class="rounded-circle mx-auto d-block img-fluid"
                                     style="width: 150px; height: 150px;">
                            <#else>
                                <img src="https://res.cloudinary.com/dwfvcpiak/image/upload/v1637518434/%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5_2021-11-21_211351_dsj4fa.png"
                                     alt="Photo" class="rounded-circle mx-auto d-block img-fluid"
                                     style="width: 150px; height: 150px;">
                            </#if>
                            <#if user?? && profile.getEmail() == user.getEmail()>
                                <#if profile.getImage()??>
                                    <form action="/delete-user-image" method="post" style="display: inline-block;">
                                        <input type="hidden" name="userId" value="${user.getId()}">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <input type="submit" class="btn btn-primary" style="color: black;"
                                               value="<@spring.message "delete.image"/>">
                                    </form>
                                </#if>
                                <@img.loadImage user></@img.loadImage>
                            </#if>
                            <h4 class="m-1">${profile.getUsername()}</h4>
                            <#if user?? && user.getIsAdmin()>
                                <h5>
                                    ${profile.getLastName()} ${profile.getFirstName()} ${profile.getMiddleName()}
                                </h5>
                                <h6>${profile.getPhone()}</h6>
                                <h6>${profile.getEmail()}</h6>
                                <@admin.profileAdminActions user profile></@admin.profileAdminActions>
                            </#if>
                        </div>
                    </div>
                </div>
                <div class="bg-light p-4 d-flex justify-content-end text-center">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item">
                            <h5 class="font-weight-bold mb-0 d-block">0</h5><small class="text-muted">
                                <i class="fa fa-image mr-1"></i><@spring.message "home"/></small>
                        </li>
                    </ul>
                </div>

                <div class="py-4 px-4">

                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h5 class="mb-0"><@spring.message "home"/></h5>
                    </div>
                    <div class="row" id="table">
                        <table class="table">
                            <p>users tours list</p>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var optionsProfile = {
            valueNames: ['collection', 'topic']
        };

        var collectionList = new List('table', optionsProfile);
    </script>

</@i.page>