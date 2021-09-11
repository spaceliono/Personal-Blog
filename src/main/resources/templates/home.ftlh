<#include "head.ftlh">
<div id="home">
    <div id="show_info">
        <div id="home_cover_img"></div>
        <div id="word_info">
            <div class="blog_title">
                <span>祈愿每个此刻我更懂我</span>
            </div>
            <div class="tab">
                <span><a href="mailto:694773629@qq.com" target="_blank" rel="noopener">EMAIL</a></span>
                <span><a href="https://github.com/spaceliono" target="_blank" rel="noopener">GITHUB</a></span>
            </div>
        </div>
    </div>
    <div class="container" id="somewhere">
        <div class="all_articles">

            <#list articles as article>
                <div class="article_single">
                    <div class="article_title">
                        <a href="/article/${article.article_title}">${article.article_title}</a>
                    </div>
                    <div class = "article_date">${article.create_date?string('yyyy-MM-dd')}</div>

                </div>
            </#list>
        </div>
    </div>
</div>
</body>
</html>
<script>
    addFadeInBackground('../static/image/5.jpg', 'home_cover_img');

    function addFadeInBackground(url, domId) {
        var background = new Image();
        background.src = url;
        background.onload = function () {
            var loadbackground = document.getElementById(domId);
            var home = document.getElementById('home');
            home.style.display = 'block';
            loadbackground.style.backgroundImage = 'url(' + background.src + ')';

            loadbackground.style.animationName = 'slideshow--alt';
        }
    }
</script>