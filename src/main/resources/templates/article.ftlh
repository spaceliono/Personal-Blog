
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/static/css/style.css" />
    <link rel="stylesheet" href="/static/css/editormd.preview.css" />
    <!-- <script src="js/zepto.min.js"></script>
<script>
    var jQuery = Zepto;  // 为了避免修改flowChart.js和sequence-diagram.js的源码，所以使用Zepto.js时想支持flowChart/sequenceDiagram就得加上这一句
</script> -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/lib/marked.min.js"></script>
    <script src="/static/lib/prettify.min.js"></script>

    <script src="/static/lib/raphael.min.js"></script>
    <script src="/static/lib/underscore.min.js"></script>
    <script src="/static/lib/sequence-diagram.min.js"></script>
    <script src="/static/lib/flowchart.min.js"></script>
    <script src="/static/lib/jquery.flowchart.min.js"></script>

    <script src="/static/js/editormd.js"></script>
    <style>
        /*.editormd-html-preview {*/
        /*    width: 90%;*/
        /*    margin: 0 auto;*/
        /*}*/
        #article_nav{
            width: 60%;
            margin: 0 auto 80px auto;
            padding: 20px;
            font-size: 20px;
        }
        #article_nav #next{
            float: left;
        }
        #article_nav #prev{
            float: right;
        }
    </style>
</head>
<#include "head.ftlh">
<div id="article_id" style="font-size: 25px;margin: 4rem auto 2rem auto;">${article.article_title}</div>
<div id="layout" style="width: 50%; margin: 0 auto;">

    <div id="test-editormd-view2">
        <textarea id="append-test" style="display:none;">  ${article.content} </textarea>
    </div>
</div>
<div id="article_nav">
    <#if next??>
        <div id="next">
            <span>上一篇：</span><a href="/article/${next.article_title}">${next.article_title}</a>
        </div>
    </#if>
    <#if last??>
        <div id="prev">
            <span>下一篇：</span><a href="/article/${last.article_title}">${last.article_title}</a>
        </div>
    </#if>
</div>

<script type="text/javascript">
    $(function() {
        var testEditormdView2;
        testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
            //markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
            //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            //toc             : false,
            tocm            : true,    // Using [TOCM]
            //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
            //gfm             : false,
            //tocDropdown     : true,
            // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
    });
</script>

</body>
</html>