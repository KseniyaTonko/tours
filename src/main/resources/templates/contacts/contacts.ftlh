<#import '../index.ftlh' as i>
<#import 'addContactForm.ftlh' as addForm>

<@i.page>
    <style>
        .round {
            border-radius: 100px; /* Радиус скругления */
            border: 3px solid green; /* Параметры рамки */
            box-shadow: 0 0 7px #666; /* Параметры тени */
            object-fit: cover;
        }
    </style>

    <div class="alert alert-info alert-dismissible fade show text-center m-4" role="alert">
        <h4>Contacts</h4>
        <p>You can ask all interested questions to our employees.</p>
        <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close"></button>
    </div>

    <#if user?? && user.getIsAdmin()>
        <@addForm.addContact operators></@addForm.addContact>
    </#if>
    <div class="container m-3">
        <!-- contacts card -->
        <!--
        <div class="alert alert-success text-center" role="alert">
            <h4 class="alert-heading">Contacts</h4>
            <p>You can ask all interested questions to our employees.</p>

        </div>-->
        <div class="card card-default" id="card_contacts">

            <div id="contacts" class="panel-collapse collapse show" aria-expanded="true" style="">
                <ul class="list-group pull-down" id="contact-list">

                    <#list contacts as contact>
                        <li class="list-group-item">
                            <#if user?? && user.getIsAdmin()>
                                <form action="/edit-contact" method="get" style="display: inline-block;">
                                    <input type="hidden" name="contactId" value="${contact.getId()}">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="submit" class="btn" value="<@spring.message "edit"/>">
                                </form>
                                <form action="/delete-contact" method="post" style="display: inline-block;">
                                    <input type="hidden" name="contactId" value="${contact.getId()}">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <input type="submit" class="btn" value="<@spring.message "delete"/>">
                                </form>
                            </#if>
                            <div class="row w-100">
                                <div class="col-12 col-sm-6 col-md-3 px-0">
                                    <#if contact.getImage()??>
                                        <img src="${contact.getImage()}"
                                             alt="Photo" class="rounded-circle mx-auto d-block img-fluid"
                                             style="width: 150px; height: 150px;">
                                        <#else>
                                            <img src="https://res.cloudinary.com/dwfvcpiak/image/upload/v1637518434/%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5_2021-11-21_211351_dsj4fa.png"
                                                 alt="Photo" class="rounded-circle mx-auto d-block img-fluid"
                                                 style="width: 150px; height: 150px;">
                                    </#if>

                                </div>

                                <div class="col-12 col-sm-6 col-md-9 text-center text-sm-left">
                                    <span class="text-success float-right pulse" title="online now"></span>
                                    <label class="name lead">${contact.getLastName()} ${contact.getFirstName()} ${contact.getMiddleName()}</label>
                                    <br>
                                    <!--<span class="fa fa-map-marker fa-fw text-muted" data-toggle="tooltip" title="" data-original-title="5842 Hillcrest Rd"></span>
                                    <span class="text-muted">5842 Hillcrest Rd</span>
                                    <br>-->
                                    <span class="fa fa-phone fa-fw text-muted" data-toggle="tooltip" title="" data-original-title="(870) 288-4149"></span>
                                    <span class="text-muted small">${contact.getMobileOperator()} ${contact.getPhone()}</span>
                                    <br>
                                    <span class="fa fa-envelope fa-fw text-muted" data-toggle="tooltip" data-original-title="" title=""></span>
                                    <span class="text-muted small text-truncate">${contact.getEmail()}</span>
                                </div>
                            </div>
                        </li>
                    </#list>


                </ul>
                <!--/contacts list-->
            </div>
        </div>
    </div>

</@i.page>