<#include "../head.ftlh">
    <head>
        <style>
            .images{
                width: 50%;
                margin: 4.5rem auto 0 auto;
            }
        </style>
    </head>

    <div class="images">
    <#list images as image>
        <div>
            <img src="/static/${image}" alt="">
        </div>
    </#list>
    </div>
