<#macro editActions user profile>

    <div class="col">
        <a href="#" class="nav-link link-dark dropdown-toggle p-0" type="button" id="dropdownOptions"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px;">
            <@spring.message "edit"/>
            </a>
        <div class="dropdown-menu" aria-labelledby="dropdownOptions">
            <form class="row dropdown-item m-0" action="/edit-password" method="get">
                <input type="hidden" name="userId" value="${profile.getId()}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" class="btn-options" value="<@spring.message "password"/>"/>
            </form>
            <form class="row dropdown-item m-0" action="/edit-email" method="get">
                <input type="hidden" name="userId" value="${profile.getId()}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" class="btn-options" value="<@spring.message "email"/>"/>
            </form>
            <form class="row dropdown-item m-0" action="/edit-phone" method="get">
                <input type="hidden" name="userId" value="${profile.getId()}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" class="btn-options" value="<@spring.message "phone"/>"/>
            </form>
            <form class="row dropdown-item m-0" action="/edit-name" method="get">
                <input type="hidden" name="userId" value="${profile.getId()}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" class="btn-options" value="<@spring.message "name"/>"/>
            </form>
        </div>
    </div>

</#macro>