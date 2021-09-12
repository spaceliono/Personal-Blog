<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello</title>
    <script src="/static/js/jquery-3.5.0.js"></script>
<#--    <script src="/static/js/jquery.min.js"></script>-->
    <link rel="stylesheet" href="/static/css/home.css">
    <link rel="stylesheet" type="text/css" href="/static/css/header.css">
    <link rel="icon" href="/static/image/favicon3.ico">

</head>
    <div id="header">
        <ul id="header_nav">
            <li class="header_menu"><a href="/">Home</a></li>
            <li class="header_menu"><a href="/#somewhere">Articles</a></li>
            <li class="header_menu"><a href="">Tags</a></li>
            <li class="header_menu"><a href="">Projects</a></li>
            <li class="header_menu"><a href="/about">About</a></li>
            <#if (Session.SPRING_SECURITY_CONTEXT.authentication.principal.username)??>
                <form id="logoutForm" action="/logout" method="post"
                      style="display: none;">
                    <input type="hidden" name="${(_csrf.parameterName)!}"
                           value="${(_csrf.token)!}">
                </form>
                <li class="header_menu right_m" id ="exit_m">
                    <a href="javascript:document.getElementById('logoutForm').submit();">Exit</a>
                </li>
            </#if>
            <li class="header_menu right_m"><a href="/admin">Admin</a></li>
        </ul>
    </div>
