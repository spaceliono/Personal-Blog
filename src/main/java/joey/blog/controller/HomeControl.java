package joey.blog.controller;

import joey.blog.mapping.ArticleDao;
import joey.blog.vo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeControl {
    @Autowired()
    private ArticleDao articleDao;
    @RequestMapping("/")
    public String index(ModelMap m) {
        List<Article> articles = articleDao.getAllArticle();
        m.addAttribute("articles",articles);
        return "home";
    }

}
