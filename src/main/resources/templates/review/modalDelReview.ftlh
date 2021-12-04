<#macro deleteReview review>
    <!-- Button trigger modal -->
    <button type="button" class="glo-small" data-toggle="modal" data-target="#modalDelRev" style="display: inline-block;
            background: none;">
        Delete
    </button>

    <!-- Modal -->
    <div class="modal fade" id="modalDelRev" tabindex="-1" aria-labelledby="modalDelRev" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete review?
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <form action="/delete-review" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="reviewId" value="${review.getId()}"/>
                        <input type="hidden" name="hotelId" value="${review.getHotel().getId()}"/>
                        <button type="submit" class="btn btn-primary">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</#macro>