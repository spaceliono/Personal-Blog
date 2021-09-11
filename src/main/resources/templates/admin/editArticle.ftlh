<#include "../head.ftlh">
<head>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/editormd.js"></script>
    <link rel="stylesheet" href="/static/css/style.css" />
    <link rel="stylesheet" href="/static/css/editormd.css" />
    <style>
        #article_title{
            font-size: 25px;
            margin: 4rem auto 2rem auto;
            text-align: center;
        }
        #article_title input{
            font-size: 25px;
        }
        #submit{
            padding: 5px;
            color: #fff;
            margin-left: 30px;
            border-radius: 5px;
            background: #8AC007;
            cursor: pointer;
        }
    </style>
</head>
<div id="article_title">
    标题
    <input type="text" name="" id="input_title" value="${(article.article_title)!}">
<#--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="hidCSRF">-->
    <span id="submit">提交</span>
    <div id = "article_id" style="display: none">${(article.id)!}</div>
</div>
<div id="layout">

    <div id="test-editormd">
                <textarea style="display:none;">${(article.content)!}</textarea>
    </div>
</div>
<script type="text/javascript">
    var testEditor;

    $(function() {
        testEditor = editormd("test-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            emoji: true,
            path    : "/static/lib/"
        });
    });

    $("#submit").click(function(){
        var id = $("#article_id").text();
        var article_title = $("#input_title").val();
        var content = $("#test-editormd").children().val();
        if(!id){
            $.ajax({
                url:"/admin/saveArticle",
                type: 'post',
                data: {
                    article_title : article_title,
                    content : content
                },
                // beforeSend:function(xhr){
                //     xhr.setRequestHeader('X-CSRF-TOKEN',$("#hidCSRF").val());
                // },
                success: function (res) {
                    window.location.href = res;
                },
                error: function (xhr) {
                    // 隐藏 loading
                    // 只有请求不正常（状态码不为200）才会执行
                    console.log('error', xhr)
                },
                complete: function (xhr) {
                    // 不管是成功还是失败都是完成，都会执行这个 complete 函数
                    console.log('complete', xhr)
                }
            });
        }else {
        $.ajax({
            url:"/admin/saveArticle",
            type: 'post',
            data: {
                id : id,
                article_title : article_title,
                content : content
            },
            // beforeSend:function(xhr){
            //     xhr.setRequestHeader('X-CSRF-TOKEN',$("#hidCSRF").val());
            // },
            success: function (res) {
                //console.log(res);
                window.location.href = res;
            },
            error: function (xhr) {
                // 隐藏 loading
                // 只有请求不正常（状态码不为200）才会执行
                console.log('error', xhr)
            },
            complete: function (xhr) {
                // 不管是成功还是失败都是完成，都会执行这个 complete 函数
                console.log('complete', xhr)
            }
        });
        }
    });
</script>
</body>
</html>