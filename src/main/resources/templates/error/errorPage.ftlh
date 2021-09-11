<#include "../head.ftlh">
<head>
    <style>
        #error-container{
            margin: 100px auto 0 auto;
            width: 50%;
            font-size: 1.3rem;
            text-align: center;
        }
    </style>
</head>
<body>
<div id="error-container">
    <#if errorCode??>
    <h1>${errorCode}</h1>
    </#if>
    <#if errorMsg??>
        <p>${errorMsg}</p>
    </#if>
</div>
</body>
</html>