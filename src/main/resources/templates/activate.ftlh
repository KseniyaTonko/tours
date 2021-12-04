<#import "index.ftlh" as i>

<@i.page>

    <div class="jumbotron m-5" style="background: linear-gradient(240deg, #885a89, #8AA8A1, #CBCBD4);">
        <h1 class="display-4 mt-5">${message}</h1>
        <hr class="my-4">
        <p class="lead">
            <a class="btn form-btn m-5" href="/"><@spring.message "to.main.page"/></a>
        </p>
    </div>

</@i.page>