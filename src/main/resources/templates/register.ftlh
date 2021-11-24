<#import 'index.ftlh' as i>

<@i.page>

    <div class="container rounded-top">
        <div class="row justify-content-center m-5">
            <div class="col-md-offset-1 col-md-12 col-lg-6 text-center">
                <div class="form-container ">
                    <form action="/register" method="post" class="form-horizontal rounded form-big">
                        <h3 class="heading align-middle"><@spring.message "create.account"/></h3>
                        <#if message??>
                            <div id="divMessage" class="alert alert-danger m-3" role="alert">
                                ${message}
                            </div>
                        </#if>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "username"/></label>
                            <input required name="username" type="text" class="form-control form-input" id="exampleInputUsername"
                                   aria-describedby="emailHelp" placeholder="<@spring.message "enter.username"/>">
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "firstName"/></label>
                            <input required name="firstName" type="text" class="form-control form-input" id="exampleInputUsername"
                                   placeholder="First name"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "lastName"/></label>
                            <input required name="lastName" type="text" class="form-control form-input" id="exampleInputUsername"
                                   placeholder="Last Name"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "middleName"/></label>
                            <input required name="middleName" type="text" class="form-control form-input" id="exampleInputUsername"
                                   placeholder="Middle Name"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "phone"/></label>
                            <input required name="phone" type="tel" class="form-control form-input" id="exampleInputUsername"
                                   placeholder="Phone number"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputEmail1"><@spring.message "email"/></label>
                            <input required name="email" type="email" class="form-control form-input" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="<@spring.message "enter.email"/>">
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputPassword1"><@spring.message "password"/></label>
                            <input required name="password" type="password" class="form-control form-input" id="exampleInputPassword1"
                                   placeholder="<@spring.message "password"/>">
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputPassword2"><@spring.message "password.confirm"/></label>
                            <input required name="passwordConfirm" type="password" class="form-control form-input" id="exampleInputPassword2"
                                   placeholder="<@spring.message "password.confirm"/>">
                        </div>
                        <div class="text-start m-3">
                            <a href="/login" class="form-a left"><@spring.message "already.have.acc"/></a>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="submit" class="btn form-btn m-2" value="<@spring.message "register"/>"/>
                        <input type="reset" class="btn btn-cancel m-2" value="<@spring.message "reset"/>"/>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@i.page>