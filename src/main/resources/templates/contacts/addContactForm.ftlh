<#macro addContact operators>

    <div class="m-3 mb-0">
        <button class="btn btn-primary" type="button" data-toggle="collapse"
                data-target="#collapseItemForm">
            <@spring.message "add.contact"/>
        </button>
        <div class="container rounded-top">
            <div class="row justify-content-center m-5">
                <div class="col-md-offset-3 col-md-8 text-center">
                    <div class="collapse m-5" id="collapseItemForm">
                        <form action="/add-contact" method="post">


                            <div class="input-group mb-3">
                                <input required maxlength="40" type="text" name="firstName" class="form-control"
                                       placeholder="<@spring.message "firstName"/>"
                                       aria-label="Name" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                    <input maxlength="40" type="text" name="lastName" class="form-control"
                                              placeholder="<@spring.message "lastName"/>"
                                              aria-label="Tags through a space" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                    <input maxlength="40" type="text" name="middleName" class="form-control"
                                              placeholder="<@spring.message "middleName"/>"
                                              aria-label="Tags through a space" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                    <input maxlength="20" type="text" name="phone" class="form-control"
                                              placeholder="<@spring.message "phone"/>"
                                              aria-label="Tags through a space" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <select name="mobileOperator" required class="form-select" aria-label="Default select example">
                                    <#list operators as operator>
                                        <#if operator?index == 0>
                                            <option selected value="${operator}"><@spring.message "${operator}"/></option>
                                        <#else>
                                            <option value="${operator}"><@spring.message "${operator}"/></option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <div class="input-group mb-3">
                                    <input maxlength="500" name="email" class="form-control"
                                              placeholder="<@spring.message "email"/>"
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
    </div>

</#macro>