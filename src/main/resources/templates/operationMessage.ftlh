<#import 'index.ftlh' as i>

<@i.page>
    <div>
        <#if operationMessage??>
            ${operationMessage}
        </#if>
    </div>
</@i.page>