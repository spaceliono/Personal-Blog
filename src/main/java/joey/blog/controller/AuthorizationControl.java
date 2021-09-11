package joey.blog.controller;

import joey.blog.mapping.ArticleDao;
import joey.blog.vo.Article;
import joey.blog.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class AuthorizationControl {

    @Value("${Joey.userName}")
    private String userName;

    @Value("${Joey.password}")
    private String password;

    @Autowired
    private ArticleDao articleDao;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session) {
        if(!StringUtils.isEmpty(username) && this.userName.equals(userName) && this.password.equals(password)){
            User user = new User(username,password);
            session.setAttribute("loginUser",user);
            return "redirect:admin";
        }else{
            return  "login";
        }
    }

    @RequestMapping("/admin")
    public String admin(ModelMap m) {
        List<Article> articles = articleDao.getAllArticle();
        m.addAttribute("articles",articles);
        return "admin/admin";
    }

    @RequestMapping("/admin/article_delete/{id}")
    @ResponseBody
    public String articleDelete(@PathVariable("id") String id) {
        articleDao.removeById(id);
        return "success";
    }
    @RequestMapping("/admin/editArticle/{title}")
    public String articleEdit(@PathVariable("title") String title,ModelMap m){
        Article article = articleDao.getArticleByTitle(title);
        m.addAttribute("article",article);
        return "admin/editArticle";
    }

    @RequestMapping("/admin/editArticle")
    public String articleAdd(){
        return "admin/editArticle";
    }

    @RequestMapping("/admin/saveArticle")
    @ResponseBody
    public String saveArticle(Article article){
        if( article.getId() == null){
            articleDao.createArticle(article.getArticle_title(),article.getContent());
        }else{
            articleDao.updateArticle(article);
        }
        return "/article/"+ article.getArticle_title();

    }

}
