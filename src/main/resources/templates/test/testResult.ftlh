<#import '../index.ftlh' as i>

<@i.page>

    <div class="card text-center m-5">
        <div class="card-body m-5">
            <h3 class="card-title">Test passed</h3>
            <p class="card-text">Tour category for you is: <@spring.message '${type}'/></p>
            <a href="/test-result/list/${index}" class="glo-small" style="display: inline-block;">See list</a>
            <a href="/test/1" class="glo-small" style="display: inline-block;">Go test again</a>
        </div>
    </div>


</@i.page>