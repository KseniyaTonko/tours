<#macro modalBook user tour>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalBook">
    Book
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalBook" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Book</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure to book tour?
            </div>
            <div class="modal-footer text-center">
                <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                <form action="/book-tour" method="post">
                    <div class="input-group mb-3">
                        <input name="seats" type="number" min="1" max="${tour.getRemainingSeats()}"
                               class="form-control"
                               placeholder="Seats"/>
                    </div><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="hidden" name="userId" value="${user.getId()}"/>
                    <input type="hidden" name="tourId" value="${tour.getId()}"/>
                    <button type="submit" class="btn btn-primary">Book</button>
            </form>
            <!--<button type="button" class="btn btn-primary">Buy</button>-->
        </div>
    </div>
</div>
</div>
</#macro>