<#import '../index.ftlh' as i>

<@i.page>

    <div class="container rounded-top">
        <div class="row justify-content-center m-5">
            <div class="col-md-offset-3 col-md-8 text-center">
                <div class="m-5">
                    <form action="/add-hotel" method="post">


                        <div class="input-group mb-3">
                            <input required maxlength="100" type="text" name="name" class="form-control"
                                   placeholder="<@spring.message "name"/>"
                                   aria-label="Name" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required min="1" max="5" type="number" name="starsCount" class="form-control"
                                   placeholder="<@spring.message "stars.count"/>"
                                   aria-label="Stars count" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="150" type="text" name="location" class="form-control"
                                   placeholder="<@spring.message "location"/>"
                                   aria-label="Location" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <input required maxlength="100" type="text" name="locationType" class="form-control"
                                   placeholder="<@spring.message "location.type"/>"
                                   aria-label="Location type" aria-describedby="basic-addon1">
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