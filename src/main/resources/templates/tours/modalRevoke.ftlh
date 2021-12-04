<#macro modalRevoke user userTour>
    <!-- Button trigger modal -->
    <button type="button" class="glo-small" data-toggle="modal" data-target="#modalRevoke" style="display: inline-block;">
        Revoke
    </button>

    <!-- Modal -->
    <div class="modal fade" id="modalRevoke" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Revoke</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to revoke booking?
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <form action="/revoke" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="userId" value="${user.getId()}"/>
                        <input type="hidden" name="tourId" value="${userTour.getId()}"/>
                        <button type="submit" class="btn btn-primary">Revoke</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</#macro>