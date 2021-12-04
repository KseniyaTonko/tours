<#import '../index.ftlh' as i>

<@i.page>

    <style>

        .radio-item {
            display: inline-block;
            position: relative;
            padding: 0 6px;
            margin: 10px 0 0;
        }

        .radio-item input[type='radio'] {
            display: none;
        }

        .radio-item label {
            color: #666;
            font-weight: normal;
        }

        .radio-item label:before {
            content: " ";
            display: inline-block;
            position: relative;
            top: 5px;
            margin: 0 5px 0 0;
            width: 20px;
            height: 20px;
            border-radius: 11px;
            border: 2px solid #004c97;
            background-color: transparent;
        }

        .radio-item input[type=radio]:checked + label:after {
            border-radius: 11px;
            width: 12px;
            height: 12px;
            position: absolute;
            top: 9px;
            left: 10px;
            content: " ";
            display: block;
            background: #004c97;
        }

    </style>

    <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10 col-lg-10">
                <div class="card mb-3">
                    <div class="card-body" style="color: #666;">
                        <p>If you don't know what tours do you need, this test can offer some tour type</p>
                        <p>Only one answer allowed.</p>
                    </div>
                </div>
                <form action="/test" method="post">
                <div class="border">
                    <div class="question bg-white p-3 border-bottom">
                        <div class="d-flex flex-row justify-content-between align-items-center mcq">
                            <h4>Helping Quiz</h4><span>(${number} of 10)</span>
                        </div>
                    </div>
                    <div class="question bg-white p-3 border-bottom">
                        <div class="d-flex flex-row align-items-center question-title">
                            <h3 class="text-danger">Q.</h3>
                            <h5 class="mt-1 ml-2">
                                <#if number == 1>What is your favorite sport is?</#if>
                                <#if number == 2>Which animal do you more prefer?</#if>
                                <#if number == 3>Your favourite colour is?</#if>
                                <#if number == 4>What is your favorite dish?</#if>
                                <#if number == 5>Your favourite music is?</#if>
                                <#if number == 6>What kind of whether do you prefer?</#if>
                                <#if number == 7>The perfect outfit consists of...</#if>
                                <#if number == 8>What is your favourite book genre?</#if>
                                <#if number == 9>What is your favourite drink?</#if>
                                <#if number == 10>What would be your perfect date would be?</#if>
                            </h5>
                        </div>

                        <input type="hidden" name="number" value="${number}"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                        <div class="radio-item">
                            <input type="radio" id="answer1" name="answer" value="1">
                            <label for="answer1">
                                <#if number == 1>Sports aren't my thing</#if>
                                <#if number == 2>Some that doesn't real</#if>
                                <#if number == 3>Black or white</#if>
                                <#if number == 4>Simple home kitchen</#if>
                                <#if number == 5>Touching music</#if>
                                <#if number == 6>It doesn't matter</#if>
                                <#if number == 7>Dull casual wear</#if>
                                <#if number == 8>No one</#if>
                                <#if number == 9>Alcohol</#if>
                                <#if number == 10>Walk in a park</#if>
                            </label>
                        </div><br>
                        <div class="radio-item">
                            <input type="radio" id="answer2" name="answer" value="2">
                            <label for="answer2">
                                <#if number == 1>Skis or skates</#if>
                                <#if number == 2>Bear or deer</#if>
                                <#if number == 3>Yellow ot light blue</#if>
                                <#if number == 4>Salads</#if>
                                <#if number == 5>Angry and screamy and unromantic</#if>
                                <#if number == 6>Lovely snowy whether</#if>
                                <#if number == 7>Uggs, skinny jeans, velour sweatshirt</#if>
                                <#if number == 8>Horror or thriller</#if>
                                <#if number == 9>Hot chocolate</#if>
                                <#if number == 10>Go to the rink</#if>
                            </label>
                        </div><br>
                        <div class="radio-item">
                            <input type="radio" id="answer3" name="answer" value="3">
                            <label for="answer3">
                                <#if number == 1>Volleyball</#if>
                                <#if number == 2>Cats. Home or wild</#if>
                                <#if number == 3>Red or orange</#if>
                                <#if number == 4>Warm soup</#if>
                                <#if number == 5>The newest pop/rap mix that everyone's downloading</#if>
                                <#if number == 6>Warm and sunny</#if>
                                <#if number == 7>Denim short shorts and a cute Tee</#if>
                                <#if number == 8>Comedy</#if>
                                <#if number == 9>Juice</#if>
                                <#if number == 10>Hanging with your crew</#if>
                            </label>
                        </div><br>
                        <div class="radio-item">
                            <input type="radio" id="answer4" name="answer" value="4">
                            <label for="answer4">
                                <#if number == 1>Badminton or tennis</#if>
                                <#if number == 2>Hare or hedgehog</#if>
                                <#if number == 3>Green</#if>
                                <#if number == 4>Complex dishes from a restaurant</#if>
                                <#if number == 5>Electronic</#if>
                                <#if number == 6>Cloudy</#if>
                                <#if number == 7>Black with lots of spiky-shiny add ons</#if>
                                <#if number == 8>Romantic</#if>
                                <#if number == 9>Tea</#if>
                                <#if number == 10>A movie and ice cream. Classic.</#if>
                            </label>
                        </div><br>
                        <div class="radio-item">
                            <input type="radio" id="answer5" name="answer" value="5">
                            <label for="answer5">
                                <#if number == 1>Baseball or basketball</#if>
                                <#if number == 2>Coyote or ram</#if>
                                <#if number == 3>Purple or pink</#if>
                                <#if number == 4>Junk</#if>
                                <#if number == 5>The most popular pop music</#if>
                                <#if number == 6>Rainy</#if>
                                <#if number == 7>Yoga pants and a pretty solid color tank</#if>
                                <#if number == 8>Young Adult</#if>
                                <#if number == 9>Carbonated drinks</#if>
                                <#if number == 10>Frappucinos in a city cafe</#if>
                            </label>
                        </div><br>
                        <div class="radio-item">
                            <input type="radio" id="answer6" name="answer" value="6">
                            <label for="answer6">
                                <#if number == 1>Football</#if>
                                <#if number == 2>Lion or elephant</#if>
                                <#if number == 3>Brown or grey</#if>
                                <#if number == 4>Exotic meal</#if>
                                <#if number == 5>Relaxing music</#if>
                                <#if number == 6>Hot</#if>
                                <#if number == 7>Skinny jeans, polos</#if>
                                <#if number == 8>Adventure</#if>
                                <#if number == 9>Just water</#if>
                                <#if number == 10>Going out on a hike</#if>
                            </label>
                        </div>

                    </div>
                    <div class="d-flex flex-row justify-content-between align-items-center p-3 bg-white">
                        <#if number != 1>
                            <a href="/test/${number-1}" class="glo-small d-flex align-items-center" type="button">
                                <i class="fa fa-angle-left mt-1 mr-1"></i>&nbsp;Previous
                            </a>
                        </#if>

                        <button id="nextBtn" class="glo-small align-items-center" type="submit" disabled>
                            <#if number != 10>Next<#else>Finish</#if><i class="fa fa-angle-right ml-2"></i>
                        </button>
                    </div>
                </div>
                </form>

            </div>
        </div>
    </div>

    <script>
        function change() {
            document.getElementById('nextBtn').disabled = false;
        }
        document.getElementById('answer1').addEventListener('click', function (e) {
            change();
        });
        document.getElementById('answer2').addEventListener('click', function (e) {
            change();
        });
        document.getElementById('answer3').addEventListener('click', function (e) {
            change();
        });
        document.getElementById('answer4').addEventListener('click', function (e) {
            change();
        });
        document.getElementById('answer5').addEventListener('click', function (e) {
            change();
        });
        document.getElementById('answer6').addEventListener('click', function (e) {
            change();
        });

    </script>

</@i.page>