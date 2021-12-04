<#import 'index.ftlh' as i>

<@i.page>

    <div class="container rounded-top">
        <div class="row justify-content-center m-5">
            <div class="col-md-offset-1 col-md-12 col-lg-6 text-center">
                <div class="form-container col-md-12 col-lg-8">
                    <form action="/register" method="post" class="">
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
                                   pattern="^[A-Za-zА-Яа-яЁё]+$"
                                   placeholder="First name"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "lastName"/></label>
                            <input required name="lastName" type="text" class="form-control form-input" id="exampleInputUsername"
                                   pattern="^[A-Za-zА-Яа-яЁё]+$"
                                   placeholder="Last Name"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "middleName"/></label>
                            <input required name="middleName" type="text" class="form-control form-input" id="exampleInputUsername"
                                   pattern="^[A-Za-zА-Яа-яЁё]+$"
                                   placeholder="Middle Name"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputUsername"><@spring.message "phone"/></label>
                            <input required name="phone" type="tel" class="form-control form-input" id="exampleInputUsername"
                                   pattern='\s{0,}\+{1,1}375\s{0,}\({0,1}(([2]{1}([5]{1}|[9]{1}))|([3]{1}[3]{1})|([4]{1}[4]{1}))\)\s{0,}[0-9]{3,3}\s{0,}[0-9]{4,4}'
                                   placeholder="+375(XX)XXXXXXX"/>
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputEmail1"><@spring.message "email"/></label>
                            <input required name="email" type="email" class="form-control form-input" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" placeholder="<@spring.message "enter.email"/>">
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputPassword1"><@spring.message "password"/></label>
                            <input required name="password" type="password" class="form-control form-input" id="exampleInputPassword1"
                                   placeholder="<@spring.message "password"/>"
                                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                        </div>
                        <div class="form-group m-3">
                            <label for="exampleInputPassword2"><@spring.message "password.confirm"/></label>
                            <input required name="passwordConfirm" type="password" class="form-control form-input" id="exampleInputPassword2"
                                   placeholder="<@spring.message "password.confirm"/>"
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
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