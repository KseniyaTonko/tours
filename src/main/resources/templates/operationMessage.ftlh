<#import 'index.ftlh' as i>

<@i.page>
    <div>
        <#if message??>
            <div class="alert alert-info" role="alert">
                ${message}
            </div>
        </#if>
    </div>
</@i.page>