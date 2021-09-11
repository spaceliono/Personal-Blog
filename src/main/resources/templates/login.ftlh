<#include "./head.ftlh">

<head>
    <style>
        #login_container{
            margin: 4rem auto 2rem auto;
            text-align: center;
        }
        .form-signin{
            max-width: 330px;
            margin: 4rem auto 2rem auto;
        }
        .input_control{
            width: 300px;
            margin-top: 10px;
            font-size: 16px;
            padding: 10px;
            border: 1px solid rgba(0,0,0,.15);
            border-radius: 3px;
        }
        .btn_sbm{
            margin-top: 20px;
            width: 300px;
            background-color: #007bff;
            border: 1px solid #007bff;
            border-radius: 3px;
            font-size: 20px;
            padding: 10px;
            color: white;
        }
    </style>
</head>
<div id="login_container">
    <form class="form-signin" action="/login" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
<#--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
        <input type="text" name="username" class="input_control" placeholder="username"/>
        <input type="password" name="password" class="input_control" placeholder="password"/>
        <button class="btn_sbm" type="submit">Sign in</button>
    </form>
</div>
</body>
</html>