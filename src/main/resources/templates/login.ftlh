<#import 'index.ftlh' as i>

<@i.page>


    <div class="container rounded-top">
        <div class="row justify-content-center m-md-5 mx-xl-0">
            <div class="col-md-offset-1 col-md-12 col-lg-6 text-center">

                <div class="form-container col-md-12 col-lg-7">
                    <form action="/login" method="post" class="form-horizontal rounded form-big">
                        <h3 class="heading align-middle"><@spring.message "login"/></h3>
                        <#if message??>
                            <div class="alert alert-danger m-3" role="alert">
                                ${message}
                            </div>
                        </#if>
                        <div class="form-group m-3">
                            <input required name="email" type="email" class="form-control form-input"
                                   aria-describedby="emailHelp" placeholder="<@spring.message "enter.email"/>">
                        </div>
                        <div class="form-group m-3">
                            <input required name="password" type="password" class="form-control form-input"
                                   placeholder="<@spring.message "password"/>">
                        </div>
                        <div class="text-start m-3">
                            <a href="/register" class="form-a left"><@spring.message "create.account"/></a>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-primary form-btn m-1" value="<@spring.message "login"/>"/><br>
                    </form>

                </div>

            </div>
        </div><!-- /.row -->
    </div><!-- /.container -->

</@i.page>