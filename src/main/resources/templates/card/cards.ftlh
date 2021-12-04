<#import '../index.ftlh' as i>
<#import 'modalDeleteCard.ftlh' as delCard>

<@i.page>

    <style>

        .glo-small{
            color: var(--darkest-color);
            padding: 5px 5px;
            width: auto;
            text-decoration:none;
            text-align:center;
            display: block;
            background: white;
            background-image: linear-gradient(to left,transparent,transparent 50%,var(--darkest-color) 50%, var(--darkest-color));
            background-position: 100% 0;
            background-size: 200% 100%;
            transition: all .25s ease-in;
            border: 1px solid var(--darkest-color);
        }
        .glo-small:hover {
            background-position: 0 0;
            color:#fff;
        }


    </style>

    <div class="btn-group m-3" role="group">
        <a class="btn btn-primary" href="/profile/${user.getId()}" style="color: black;">Back</a>
        <form action="/add-card" method="get" style="display: inline-block;">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" class="btn btn-primary" style="color: black;"
                   value="Add">
        </form>
    </div>


    <div class="py-5">
        <div class="container">
            <div class="row hidden-md-up">

                <#list cards as card>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-block m-3">
                                <h4 class="card-title ">${card.getName()}</h4>
                                <h6 class="card-subtitle text-muted">
                                    ****-****-****-${card.getNumber()?substring(15, 19)}
                                </h6><br>
                                <div>
                                    <!--<form action="/delete-card" method="post" style="display: inline-block;">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <input type="hidden" name="cardId" value="${card.getId()}"/>
                                        <input type="hidden" name="userId" value="${user.getId()}"/>
                                        <button type="submit" class="glo-small card-link" style="display: inline-block;">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>-->
                                    <@delCard.modalDelCArd user card></@delCard.modalDelCArd>
                                    <div style="display: inline-block;">
                                        <button class="glo-small card-link" type="button" data-toggle="collapse"
                                                data-target="#collapseMoney${card.getId()}" style="display: inline-block;">
                                            + <i class="fa fa-money"></i>
                                        </button>
                                        <div class="container rounded-top">
                                            <div class="row justify-content-center m-1">
                                                    <div class="collapse" id="collapseMoney${card.getId()}">
                                                        <form action="/add-money" method="post" style="display: inline-block;">
                                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                            <input type="hidden" name="cardId" value="${card.getId()}"/>
                                                            <input type="hidden" name="userId" value="${user.getId()}"/>
                                                            <div class="input-group mb-3">
                                                                <input required min="0" max="1000000" type="number"
                                                                       step="0.01" name="money" class="form-control"
                                                                       title="Money, $"
                                                                       placeholder="Money, $">
                                                            </div>
                                                            <input type="submit" class="glo-small card-link"
                                                                   style="display: inline-block;"
                                                                   value="Save">
                                                        </form>
                                                    </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>

            </div>
        </div>
    </div>

</@i.page>