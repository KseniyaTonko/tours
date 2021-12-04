<#import '../index.ftlh' as i>

<@i.page>
    <div class="m-3 mb-0">
        <div class="container rounded-top">
            <div class="row justify-content-center m-5">
                <div class="col-md-offset-3 col-md-4 text-center">
                    <form action="/edit-email" class="mt-5" method="post">

                        <h2><@spring.message 'edit.email'/></h2>

                        <#if message??>
                            <div class="alert alert-info" role="alert">
                                ${message}
                            </div>
                        </#if>


                        <div class="input-group mb-3">
                            <input required maxlength="40" type="email" name="email" class="form-control"
                                   placeholder="Email" value="${profile.getEmail()}"
                                   aria-label="Phone" aria-describedby="basic-addon1">
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