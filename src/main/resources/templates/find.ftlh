<#macro find params>

<div class="accordion accordion-flush m-5" id="accordionFlushExample" style="background: white;">
    <div class="accordion-item" style="background: white;">
        <h2 class="accordion-header" id="flush-headingOne" style="background: white;">
            <button class="accordion-button collapsed" type="button" data-toggle="collapse" data-target="#flush-collapseOne"
                    aria-expanded="false" aria-controls="flush-collapseOne">
                Find tours by parameters
            </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">

                <form class="row gx-3 gy-2 align-items-center m-5" action="/find" method="post">
                    <div class="row g-3">
                        <!-- transport -->
                        <div class="col-sm">
                            <#list params.getTransports() as transport>
                               <div class="form-check">
                                <input class="form-check-input" name="transport" type="checkbox"
                                       <#if values?? && values.getTransport()?seq_contains(transport?index?string)>checked</#if>
                                       value="${transport?index}" id="transport${transport?index}">
                                <label class="form-check-label" for="transport${transport?index}">
                                    <@spring.message '${transport}'/>
                                </label>
                            </div>
                            </#list>
                            <input name="transport" type="hidden" value="-1"/>
                        </div>
                        <!-- tour type -->
                        <div class="col-sm">
                            <#list params.getTypes() as type>
                                <div class="form-check">
                                    <input class="form-check-input" name="type" type="checkbox"
                                           <#if values?? && values.getType()?seq_contains(type?index?string)>checked</#if>
                                           value="${type?index}" id="type${type?index}">
                                    <label class="form-check-label" for="type${type?index}">
                                        <@spring.message '${type}'/>
                                    </label>
                                </div>
                            </#list>
                            <input name="type" type="hidden" value="-1"/>
                        </div>
                        <!-- food type -->
                        <div class="col-sm">
                            <#list params.getFoodTypes() as food>
                                <div class="form-check">
                                    <input class="form-check-input" name="food" type="checkbox"
                                           <#if values?? && values.getFood()?seq_contains(food?index?string)>checked</#if>
                                           value="${food?index}" id="food${food?index}">
                                    <label class="form-check-label" for="food${food?index}">
                                        <@spring.message '${food}'/>
                                    </label>
                                </div>
                            </#list>
                            <input name="food" type="hidden" value="-1"/>
                        </div>
                    </div>

                    <div class="row g-5">
                        <!-- price -->
                        <div class="col-sm">
                            <label class="" for="inputMinPrice">Min price, $</label>
                            <input type="number" class="form-control" id="inputMinPrice" name="minPrice" step="0.01"
                                   min="${params.getMinPrice()}" max="${params.getMaxPrice()}"
                                   <#if values??>value="${values.getMinPrice()}"</#if>
                                   placeholder="${params.getMinPrice()}">
                        </div>
                        <div class="col-sm">
                            <label class="" for="inputMaxPrice">Max price, $</label>
                            <input type="number" class="form-control" id="inputMaxPrice" name="maxPrice" step="0.01"
                                   min="${params.getMinPrice()}" max="${params.getMaxPrice()}"
                                   <#if values??>value="${values.getMaxPrice()}"</#if>
                                   placeholder="${params.getMaxPrice()}">
                        </div>
                        <!-- seats -->
                        <div class="col-sm">
                            <label class="" for="inputMinSeats">Min seats</label>
                            <input type="number" class="form-control" id="inputMinSeats" name="minSeats" step="0.01"
                                   min="${params.getMinSeats()}" max="${params.getMaxSeats()}"
                                   <#if values??>value="${values.getMinSeats()}"</#if>
                                   placeholder="${params.getMinSeats()}">
                        </div>
                        <div class="col-sm">
                            <label class="" for="inputMaxSeats">Max seats</label>
                            <input type="number" class="form-control" id="inputMaxSeats" name="maxSeats" step="0.01"
                                   min="${params.getMinSeats()}" max="${params.getMaxSeats()}"
                                   <#if values??>value="${values.getMaxSeats()}"</#if>
                                   placeholder="${params.getMaxSeats()}">
                        </div>
                        <!-- min date -->
                        <div class="col-sm">
                            <label class="" for="inputMinDate">Min date</label>
                            <input type="datetime-local" class="form-control" name="minDate"
                                   <#if values??>value="${values.getMinDate()}"</#if>
                                   id="inputMinDate">
                        </div>
                        <!-- max date -->
                        <div class="col-sm">
                            <label class="" for="inputMaxDate">Max date</label>
                            <input type="datetime-local" class="form-control"  name="maxDate"
                                   <#if values??>value="${values.getMaxDate()}"</#if>
                                   id="inputMaxDate">
                        </div>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <div class="row m-1">
                        <a class="glo-small m-1" href="/reset-find">Reset</a>
                        <button class="glo-small m-1" type="submit">Search</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

</#macro>
