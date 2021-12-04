<#import '../index.ftlh' as i>

<@i.page>
    <div class="m-3 mb-0">
        <div class="container rounded-top">
            <div class="row justify-content-center m-5">
                <div class="col-md-offset-3 col-md-4 text-center">
                    <form action="/edit-name" class="mt-5" method="post">

                        <h2><@spring.message 'edit.name'/></h2>

                        <#if message??>
                            <div class="alert alert-info" role="alert">
                                ${message}
                            </div>
                        </#if>


                        <div class="input-group mb-3">
                            <input required maxlength="40" type="text" name="username" class="form-control"
                                   placeholder="<@spring.message 'username'/>" value="${profile.getUsername()}"
                                   pattern="^[0-9A-Za-z]+$"
                                   title="Only numbers and english letters"
                                   aria-label="<@spring.message 'username'/>" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="40" type="text" name="lastName" class="form-control"
                                   placeholder="<@spring.message 'lastName'/>" value="${profile.getLastName()}"
                                   pattern="^[A-Za-zА-Яа-яЁё]+$"
                                   title="Only english or russian letters"
                                   aria-label="<@spring.message 'lastName'/>" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="40" type="text" name="firstName" class="form-control"
                                   pattern="^[A-Za-zА-Яа-яЁё]+$"
                                   title="Only english or russian letters"
                                   placeholder="<@spring.message 'firstName'/>" value="${profile.getFirstName()}"
                                   aria-label="<@spring.message 'firstName'/>" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="40" type="text" name="middleName" class="form-control"
                                   pattern="^[A-Za-zА-Яа-яЁё]+$"
                                   title="Only english or russian letters"
                                   placeholder="<@spring.message 'middleName'/>" value="${profile.getMiddleName()}"
                                   aria-label="<@spring.message 'middleName'/>" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input maxlength="60" type="password" name="password" class="form-control"
                                   placeholder="<@spring.message "password"/>"
                                   aria-label="Password" aria-describedby="basic-addon1">
                        </div>

                        <input type="hidden" value="${profile.getId()}" name="id"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="btn-group" role="group">
                            <input type="submit" class="btn" value="<@spring.message "save"/>">
                            <a type="button" class="btn" href="/profile/${profile.getId()}">
                                <@spring.message 'back'/></a>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</@i.page>