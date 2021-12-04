<#import '../index.ftlh' as i>

<@i.page>

    <div class="container rounded-top">
        <div class="row justify-content-center m-5 mx-md-0">
            <div class="col-md-offset-3 col-md-12 col-lg-8 text-center">
                <div class="m-5">
                    <form action="/add-tour" method="post">

                        <div class="input-group mb-3">
                            <input required maxlength="50" type="text" name="name" class="form-control"
                                   placeholder="<@spring.message "name"/>"
                                   aria-label="Name" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <select name="hotelId" required class="form-select" aria-label="Default select example">
                                <#list hotels as hotel>
                                    <#if hotel?index == 0>
                                        <option selected value="${hotel.getId()}">${hotel.getName()}</option>
                                    <#else>
                                        <option value="${hotel.getId()}">${hotel.getName()}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="50" type="text" name="country" class="form-control"
                                   placeholder="<@spring.message "country"/>"
                                   aria-label="Country" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="50" type="text" name="resort" class="form-control"
                                   placeholder="<@spring.message "resort"/>"
                                   aria-label="Resort" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="50" type="text" name="townFrom" class="form-control"
                                   placeholder="<@spring.message "town.from"/>"
                                   aria-label="townFrom" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="50" type="text" name="lasting" class="form-control"
                                   placeholder="<@spring.message "lasting"/>"
                                   aria-label="Lasting" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <label><@spring.message "start.date"/>
                            <input required maxlength="50" type="datetime-local"
                                   name="startTime" class="form-control"
                                   placeholder="<@spring.message "start.date"/>"
                                   aria-label="Start time" aria-describedby="basic-addon1"></label>
                        </div>
                        <div class="input-group mb-3">
                            <label><@spring.message "end.date"/>
                            <input required  maxlength="50" type="datetime-local" name="endDate" class="form-control"
                                   placeholder="<@spring.message "end.date"/>"
                                   aria-label="End time" aria-describedby="basic-addon1"></label>
                        </div>
                        <div class="input-group mb-3">
                            <select name="transport" required class="form-select" aria-label="Default select example">
                                <#list transports as transport>
                                    <#if transport?index == 0>
                                        <option selected value="${transport}">${transport}</option>
                                    <#else>
                                        <option value="${transport}">${transport}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <select name="type" required class="form-select" aria-label="Default select example">
                                <#list tourTypes as type>
                                    <#if type?index == 0>
                                        <option selected value="${type}">${type}</option>
                                    <#else>
                                        <option value="${type}">${type}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <select name="foodType" required class="form-select" aria-label="Default select example">
                                <#list foodTypes as food>
                                    <#if food?index == 0>
                                        <option selected value="${food}">${food}</option>
                                    <#else>
                                        <option value="${food}">${food}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <input required type="number" step="0.01" name="price" class="form-control"
                                   placeholder="<@spring.message "price"/>"
                                   aria-label="Price" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <textarea required maxlength="500" name="description" class="form-control"
                                   placeholder="<@spring.message "description"/>"
                                      aria-label="Description" aria-describedby="basic-addon1"></textarea>
                        </div>
                        <div class="input-group mb-3">
                            <input required type="number" name="remainingSeats" class="form-control"
                                   placeholder="<@spring.message "seats"/>"
                                   aria-label="Seats" aria-describedby="basic-addon1">
                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="input-group">
                            <input type="submit" class="btn m-1" value="<@spring.message "save"/>">
                            <input type="reset" class="btn m-1" value="<@spring.message "reset"/>">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@i.page>