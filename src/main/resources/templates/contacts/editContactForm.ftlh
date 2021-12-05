<#import '../index.ftlh' as i>
<#import 'loadContactImg.ftlh' as img>

<@i.page>

    <div class="m-3">
        <div class="container rounded-top">
            <div class="row justify-content-center m-5">
                <div class="col-md-offset-3 col-md-8 text-center">
                    <h2>Edit contact</h2>
                    <#if contact.getImage()??>
                        <img src="${contact.getImage().getImage()}"
                             alt="Photo" class="rounded-circle mx-auto d-block img-fluid"
                             style="width: 150px; height: 150px;">
                    </#if>
                    <#if contact.getImage()??>
                        <form action="/delete-contact-image" method="post" style="display: inline-block;">
                            <input type="hidden" name="contactId" value="${contact.getId()}">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit" class="btn btn-primary" style="color: black;"
                                   value="<@spring.message "delete.image"/>">
                        </form>
                    </#if>
                    <@img.loadImage contact></@img.loadImage>

                    <form action="/edit-contact" method="post">

                        <input type="hidden" name="id" value="${contact.getId()}">
                        <div class="input-group mb-3">
                            <input required maxlength="40" type="text" name="firstName" class="form-control"
                                   placeholder="<@spring.message "firstName"/>" value="${contact.getFirstName()}"
                                   aria-label="Name" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input maxlength="40" type="text" name="lastName" class="form-control"
                                   placeholder="<@spring.message "lastName"/>" value="${contact.getLastName()}"
                                   aria-label="Tags through a space" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input maxlength="40" type="text" name="middleName" class="form-control"
                                   placeholder="<@spring.message "middleName"/>" value="${contact.getMiddleName()}"
                                   aria-label="Tags through a space" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input maxlength="20" type="text" name="phone" class="form-control"
                                   placeholder="+375(XX)XXXXXXX"
                                   pattern='\s{0,}\+{1,1}375\s{0,}\({0,1}(([2]{1}([5]{1}|[9]{1}))|([3]{1}[3]{1})|([4]{1}[4]{1}))\)\s{0,}[0-9]{3,3}\s{0,}[0-9]{4,4}'
                                   value="${contact.getPhone()}"
                                   aria-label="Tags through a space" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <select name="mobileOperator" required class="form-select" aria-label="Default select example">
                                <#list operators as operator>
                                    <#if operator == contact.getMobileOperator()>
                                        <option selected value="${operator}"><@spring.message "${operator}"/></option>
                                    <#else>
                                        <option value="${operator}"><@spring.message "${operator}"/></option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <input maxlength="500" name="email" class="form-control"
                                   placeholder="<@spring.message "email"/>" value="${contact.getEmail()}"
                                   aria-label="Tags through a space" aria-describedby="basic-addon1">
                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="input-group">
                            <input type="submit" class="btn m-1" value="<@spring.message "save"/>">
                            <input type="reset" class="btn m-1" value="<@spring.message "reset"/>">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

</@i.page>