<#macro modalRevoke user>
    <!-- Button trigger modal -->
    <button type="button" class="glo-small text-center" data-toggle="modal" data-target="#modalDelAvatar" style="display: inline-block;">
        Delete avatar
    </button>

    <!-- Modal -->
    <div class="modal fade" id="modalDelAvatar" tabindex="-1" aria-labelledby="modalDelAvatar" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete avatar</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to remove photo?
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <form action="/delete-user-image" method="post">
                        <input type="hidden" name="userId" value="${user.getId()}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-primary" style="display: inline-block;"
                               value="<@spring.message "delete.image"/>">
                    </form>
                </div>
            </div>
        </div>
    </div>
</#macro>