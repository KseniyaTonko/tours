<#import '../index.ftlh' as i>

<@i.page>
    <style>
        .credit-card-div span {
            padding-top:10px;
        }
        .credit-card-div img {
            padding-top:30px;
        }
        .credit-card-div .small-font {
            font-size:9px;
        }
        .credit-card-div .pad-adjust {
            padding-top:10px;
        }
    </style>

    <div class="container">
        <div class="row justify-content-center m-5">
            <div class="col-md-4 col-md-offset-4 text-canter">
                <h2>Add card</h2>
                <div class="credit-card-div">
                    <div class="panel panel-default" >
                        <div class="panel-heading">

                            <form action="/add-card" method="post">

                                <input type="hidden" name="userId" value="${user.getId()}">

                                <div class="row ">
                                    <div class="col-md-12">
                                        <input required maxlength="30" type="text" class="form-control"
                                               placeholder="Enter Card Name" name="name"
                                        />
                                    </div>
                                </div><br>

                                <div class="row ">
                                    <div class="col-md-12">
                                        <input required minlength="19" maxlength="19" type="text" class="form-control"
                                               placeholder="Card number" name="number"
                                               pattern="\d{4,4}-\d{4,4}-\d{4,4}-\d{4,4}"
                                               title="Format: XXXX-XXXX-XXXX-XXXX"
                                        />
                                    </div>
                                </div>

                                <div class="row ">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <span class="help-block text-muted small-font" > Expiry Month</span>
                                        <input required minlength="2" maxlength="2"
                                               type="text" name="month" class="form-control" placeholder="MM"
                                            pattern="(([0]{1}[1-9]{1})|([1]{1}[0-2]{1}))" title="Format: MM"/>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <span class="help-block text-muted small-font" > Expiry Year</span>
                                        <input required type="text" name="year" class="form-control" placeholder="YY"
                                               minlength="2" maxlength="2"
                                               pattern="\d{2,2}" title="Format: YY"/>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <span class="help-block text-muted small-font" > CCV</span>
                                        <input required minlength="3" maxlength="3"
                                               type="text" name="ccv" class="form-control" placeholder="CCV"
                                               pattern="\d{3,3}" title="Format: CCV"/>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <img src="https://bootstraptema.ru/snippets/form/2016/form-card/card.png" class="img-rounded" alt=""/>
                                    </div>
                                </div>

                                <div class="row ">
                                    <div class="col-md-12 pad-adjust">
                                        <input required type="text" name="manName" class="form-control" placeholder="Name On The Card" />
                                    </div>
                                </div>

                                <!--<div class="row">
                                    <div class="col-md-12 pad-adjust">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" checked class="text-muted"> Save details for fast payments <a href="#"> learn how ?</a>
                                            </label>
                                        </div>
                                    </div>
                                </div>-->

                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                                <div class="row ">
                                    <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                        <input type="reset" class="btn btn-danger" value="Reset" />
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                        <input type="submit" class="btn btn-warning btn-block" value="Save" />
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div><!-- ./credit-card-div -->

            </div>
        </div>
    </div><!-- /.container -->

</@i.page>