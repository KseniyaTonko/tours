<#import 'index.ftlh' as i>

<@i.page>
    <form action="/admin" method="post">
        <div class="btn-group m-1" role="group" aria-label="Basic example">
            <input class="btn form-btn" type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" name="action" class="btn form-btn" value="block">
                <i class="fa fa-lock"></i>
            </button>
            <button type="submit" name="action" class="btn form-btn" value="unblock">
                <i class="fa fa-unlock"></i>
            </button>
            <button type="submit" name="action" class="btn form-btn" value="delete">
                <i class="fa fa-trash"></i>
            </button>
            <button type="submit" name="action" class="btn form-btn" value="admin">
                <@spring.message "make.admin"/>
            </button>
            <button type="submit" name="action" class="btn form-btn" value="not admin">
                <@spring.message "unmake.admin"/>
            </button>
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col"><input type="checkbox" id="selectAll"/></th>
                <th scope="col"><@spring.message "id"/></th>
                <th scope="col"><@spring.message "username"/></th>
                <th scope="col"><@spring.message "email"/></th>
                <th scope="col"><@spring.message "roles"/></th>
                <th scope="col"><@spring.message "status"/></th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                    <th scope="row"><input type="checkbox" name="checkbox" value="${user.getId()}"/></th>
                    <td>${user.getId()}</td>
                    <td><a href="/profile/${user.getId()}">${user.getUsername()}</a></td>
                    <td>
                        <#if user.getEmail()??>
                            ${user.getEmail()}
                        <#else>
                            -
                        </#if>
                        </td>
                    <td><#list user.getRoles() as role><@spring.message '${role.getName()}'/><#sep>, </#list></td>
                    <td><@spring.message '${user.getStatus()}'/></td>
                </tr>
            </#list>
            </tbody>
        </table>
    </form>
    <script>
        document.getElementById('selectAll')
            .addEventListener('click', function (e) {
                var els = document.querySelectorAll(
                    'input[name=checkbox]'
                );

                Array.prototype.forEach.call(els, function(cb){
                    cb.checked = e.target.checked;
                });
            })
        ;

    </script>
</@i.page>