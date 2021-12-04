<#macro modalPayBooked user userTour>
    <!-- Button trigger modal -->
    <button type="button" class="glo-small" data-toggle="modal" data-target="#exampleModal" style="display: inline-block;">
        Pay
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Pay</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to pay tour?
                </div>
                <div class="modal-footer text-center">
                    <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                    <form action="/pay" method="post">
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
                        <input name="seats" type="hidden" value="${userTour.getSeats()}"/>
                        <br>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="userId" value="${user.getId()}"/>
                        <input type="hidden" name="tourId" value="${userTour.getId()}"/>
                        <button type="submit" class="btn btn-primary">Pay</button>
                    </form>
                    <!--<button type="button" class="btn btn-primary">Buy</button>-->
                </div>
            </div>
        </div>
    </div>
</#macro>