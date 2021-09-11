<#include "../head.ftlh">
<head>
    <style>
        #showArticles{
            width: 50%;
            margin: 2.5rem auto 0 auto;
        }
        #new-article{
            text-align: center;
            padding: 10px;
            font-size: 17px;
            background: #00aaaa;
        }
        .art_menu{
            height: 40px;
            border-bottom: 1px solid #555;
            line-height: 40px;
            font-size: 17px;
            padding-top: 20px;
        }
        .art_connect{
            float: left;
        }
        .art_delete{
            float: right;
            cursor: pointer;
        }
        .art_edit{
            float: right;
            margin-right: 10px;
            cursor: pointer;
        }
        .art_menu div a{
            color: #000;
        }
    </style>
</head>

<div id="showArticles">
    <div id="new-article">
        <a href="/admin/editArticle">新建文章</a>
    </div>
        <#list articles as article>
            <div class="art_menu">
                <div class="art_connect">
                    <a href="/article/${article.article_title}">${article.article_title}</a>
                </div>
                <div class="art_delete" id="${article.id}">删除</div>
                <div class="art_edit">
                    <a href="/admin/editArticle/${article.article_title}">编辑</a>
                </div>
            </div>
        </#list>
</div>

</body>
</html>
<script>
    $(".art_delete").click(function(){
        var url ="/admin/article_delete/" + $(this).attr("id") ;
        $.ajax({
            url:url,
            type: 'get',
            success: function (res) {
                // 隐藏 loading
                // 只有请求成功（状态码为200）才会执行这个函数
                console.log(res);
                location.reload();
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
    });
</script>