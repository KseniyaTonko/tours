<#macro modalBuy user tour>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Buy
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Buy tour</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to buy tour?
                </div>
                <div class="modal-footer text-center">
                    <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                    <form action="/buy-tour" method="post">
                        <div class="input-group mb-3">Choose card:
                                <select name="cardId" required class="form-select">
                                    <#list user.getCards() as card>
                                        <#if card?index == 0>
                                            <option selected value="${card.getId()}">${card.getName()}</option>
                                        <#else>
                                            <option value="${card.getId()}">${card.getName()}</option>
                                        </#if>
                                    </#list>
                                </select>
                        </div>
                        <div class="input-group mb-3">
                            <input name="seats" type="number" min="1" max="${tour.getRemainingSeats()}"
                                   class="form-control"
                                   placeholder="Seats"/>
                        </div><br>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="userId" value="${user.getId()}"/>
                        <input type="hidden" name="tourId" value="${tour.getId()}"/>
                        <button type="submit" class="btn btn-primary">Buy</button>
                    </form>
                    <!--<button type="button" class="btn btn-primary">Buy</button>-->
                </div>
            </div>
        </div>
    </div>
</#macro>