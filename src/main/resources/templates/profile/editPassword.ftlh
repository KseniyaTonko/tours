<#import '../index.ftlh' as i>

<@i.page>
    <div class="m-3 mb-0">
        <div class="container rounded-top">
            <div class="row justify-content-center m-5">
                <div class="col-md-offset-3 col-md-4 text-center">
                    <form action="/edit-password" class="mt-5" method="post">

                        <h2><@spring.message 'edit.password'/></h2>

                        <#if message??>
                            <div class="alert alert-info" role="alert">
                                ${message}
                            </div>
                        </#if>


                        <div class="input-group mb-3">
                            <input required maxlength="60" type="password" name="oldPassword" class="form-control"
                                   placeholder="<@spring.message "old.password"/>"
                                   title="Current password"
                                   aria-label="<@spring.message "old.password"/>" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="60" minlength="8" type="password" name="newPassword" class="form-control"
                                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                                   placeholder="<@spring.message "new.password"/>"
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                   aria-label="<@spring.message "new.password"/>" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="60" minlength="8" type="password" name="newPasswordConfirm" class="form-control"
                                   title="Confirm new password"
                                   placeholder="<@spring.message "new.password.confirm"/>"
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                   aria-label="<@spring.message "new.password.confirm"/>" aria-describedby="basic-addon1">
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