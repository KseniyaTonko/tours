<#import "index.ftlh" as i>

<@i.page>

    <#if user?? && user.getIsAdmin()>
        <a href="/add-hotel" class="btn btn-primary m-1" style="color: black;">
            <@spring.message "add.hotel"></@spring.message>
        </a>
        <a href="/add-tour" class="btn btn-primary m-1" style="color: black;">
            <@spring.message "add.tour"></@spring.message>
        </a>
    </#if>



    <p>// tours list will be here</p>

    <!--
    <div class="container rounded-top">
        <div class="row justify-content-center m-5">
            <div class="col-md-offset-3 col-md-12 col-lg-6 text-center">
                <div class="jumbotron m-5">
                    <h1 class="display-4"><@spring.message "hello"/></h1>
                    <p class="lead"><@spring.message "hello.message"/></p>
                </div>
            </div>
        </div>
    </div>-->

</@i.page>