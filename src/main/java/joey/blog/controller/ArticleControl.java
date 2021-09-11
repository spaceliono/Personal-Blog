package joey.blog.controller;

import joey.blog.mapping.ArticleDao;
import joey.blog.vo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class ArticleControl {

    @Autowired
    private ArticleDao articleDao;

    @GetMapping("/newArticle")
    @ResponseBody()
    public Article createArticle(){
        //Article article = new Article("title1", "content");
        Article article = articleDao.createArticle("title1", "content");
        return article;
    }

    @RequestMapping("/article/{title}")
    public String getArticle(@PathVariable("title") String id, Model m, HttpServletRequest request) {
        Article article = articleDao.getArticleByTitle(id);

        if (article==null){
            request.setAttribute("javax.servlet.error.status_code",404);
            return "forword:/error";
        }else {
            Date date = article.getCreate_date();
            Article next = articleDao.getNextArticle(date);
            Article last = articleDao.getLastArticle(date);
            m.addAttribute("article", article);
            m.addAttribute("next", next);
            m.addAttribute("last", last);
            return "article";
        }
    }


}
