<#macro modalDelCArd user card>
    <!-- Button trigger modal -->
    <button type="button" class="glo-small card-link" data-toggle="modal" data-target="#modalDelCard"
            style="display: inline-block;">
        <i class="fa fa-trash"></i>
    </button>

    <!-- Modal -->
    <div class="modal fade" id="modalDelCard" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete card</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete the card?
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="glo-small card-link" data-dismiss="modal">Close</button>
                    <form action="/delete-card" method="post" style="display: inline-block;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="cardId" value="${card.getId()}"/>
                        <input type="hidden" name="userId" value="${user.getId()}"/>
                        <button type="submit" class="glo-small card-link" style="display: inline-block;">
                            Delete
                        </button>
                    </form>
                <!--<button type="button" class="btn btn-primary">Buy</button>-->
            </div>
        </div>
    </div>
    </div>
</#macro>