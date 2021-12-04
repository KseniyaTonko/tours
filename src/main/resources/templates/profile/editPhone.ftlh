<#import '../index.ftlh' as i>

<@i.page>
    <div class="m-3 mb-0">
        <div class="container rounded-top">
            <div class="row justify-content-center m-5">
                <div class="col-md-offset-3 col-md-4 text-center">
                        <form action="/edit-phone" class="mt-5" method="post">

                            <h2><@spring.message 'edit.phone'/></h2>

                            <#if message??>
                                <div class="alert alert-info" role="alert">
                                    ${message}
                                </div>
                            </#if>


                            <div class="input-group mb-3">
                                <input required maxlength="15" type="tel" name="phone" class="form-control"
                                       placeholder="+375(XX)XXXXXXX" value="${profile.getPhone()}"
                                       title="Required format: +375(XX)XXXXXXX"
                                       pattern='\s{0,}\+{1,1}375\s{0,}\({0,1}(([2]{1}([5]{1}|[9]{1}))|([3]{1}[3]{1})|([4]{1}[4]{1}))\)\s{0,}[0-9]{3,3}\s{0,}[0-9]{4,4}'
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