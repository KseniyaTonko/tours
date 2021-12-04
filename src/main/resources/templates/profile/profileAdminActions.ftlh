<#macro profileAdminActions user profile>

    <div class="col">
        <a href="#" class="nav-link link-dark dropdown-toggle p-0" type="button" id="dropdownOptions"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px;">
            <@spring.message "options"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownOptions">
            <form class="row dropdown-item" action="/delete/${profile.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" class="btn-options" value="<@spring.message "delete.user"/>"/>
            </form>
            <#if user?? && user.getIsAdmin()>
            <form class="row dropdown-item" action="/lock/${profile.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <#if profile.getStatus() == "BLOCKED">
                    <input type="hidden" name="option" value="1">
                    <input type="submit" class="btn-options" value="<@spring.message "unlock.user"/>"/>
                <#else>
                    <input type="hidden" name="option" value="0">
                    <input type="submit" class="btn-options" value="<@spring.message "lock.user"/>"/>
                </#if>

            </form>
            <form class="row dropdown-item" action="/changeRole/${profile.getId()}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <#if profile.getIsAdmin()>
                    <input type="submit" class="btn-options" value="<@spring.message "make.user"/>"/>
                <#else>
                    <input type="submit" class="btn-options" value="<@spring.message "make.user.admin"/>"/>
                </#if>
            </form>
            </#if>

        </div>
    </div>

</#macro>