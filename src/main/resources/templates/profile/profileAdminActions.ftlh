<#macro profileAdminActions user profile>

    <div class="col">
        <a href="#" class="nav-link link-light dropdown-toggle p-0" type="button" id="dropdownOptions"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <@spring.message "options"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownOptions">
            <form class="row dropdown-item m-0" action="/delete/${profile.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" class="btn-options" value="<@spring.message "delete.user"/>"/>
            </form>
            <form class="row dropdown-item m-0" action="/lock/${profile.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <#if profile.getStatus() == "BLOCKED">
                    <input type="hidden" name="option" value="1">
                    <input type="submit" class="btn-options" value="<@spring.message "unlock.user"/>"/>
                <#else>
                    <input type="hidden" name="option" value="0">
                    <input type="submit" class="btn-options" value="<@spring.message "lock.user"/>"/>
                </#if>

            </form>
            <form class="row dropdown-item m-0" action="/changeRole/${profile.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <#if profile.getIsAdmin()>
                    <input type="submit" class="btn-options" value="<@spring.message "make.user"/>"/>
                <#else>
                    <input type="submit" class="btn-options" value="<@spring.message "make.user.admin"/>"/>
                </#if>
            </form>
        </div>
    </div>

</#macro>