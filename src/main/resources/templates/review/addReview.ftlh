<#macro addReview user hotel>

    <div class="container rounded-top">
        <div class="row justify-content-center m-5">
            <div class="col-md-offset-3 col-md-8 text-center">
                <div class="m-5">
                    <form action="/add-review" method="post">

                        <input type="hidden" name="userId" value="${user.getId()}"/>
                        <input type="hidden" name="hotelId" value="${hotel.getId()}"/>

                        <div class="input-group mb-3 form-check">
                            <input class="form-check-input" type="checkbox" name="recommend0" placeholder="Recommend"
                                   value="0"
                                   onclick="document.getElementById('checkboxRecommend').value = this.checked ? 1 : 0;">
                            <input type="hidden" id="checkboxRecommend" name="recommend" value="0"/>
                            <label class="form-check-label" for="defaultCheck1">
                                 Recommend
                            </label>
                        </div>
                        <!--<div class="input-group mb-3">Recommend
                            <input type="checkbox" name="recommend" placeholder="Recommend" id="checkboxRecommend"
                                   value="0"
                                   onclick="document.getElementById('checkboxRecommend').value = 0 ? 1 : 0;">
                        </div>-->
                        <div class="input-group mb-3">
                            <input required maxlength="" type="text" name="residenceTime" class="form-control"
                                   placeholder="Residence time">
                        </div>
                        <div class="input-group mb-3">
                            <input required min="1" max="5" type="number" name="mark" class="form-control"
                                   placeholder="Mark">
                        </div>
                        <div class="input-group mb-3">
                            <textarea required maxlength="500" name="text" placeholder="Review"
                                    class="form-control"></textarea>
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

    <script>
        function setVal() {

        }
    </script>

</#macro>