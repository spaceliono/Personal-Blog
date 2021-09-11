package joey.blog.mapping;

import com.mongodb.client.result.UpdateResult;
import joey.blog.vo.Article;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Component
public class ArticleDao {
    @Resource
    private MongoTemplate mongoTemplate;

    public Article createArticle(String article_title, String content){
        Article article = new Article(article_title,content);
        Article insert = mongoTemplate.insert(article);
        return insert;
    }
    public Article getArticleById(String id){
        Query query = new Query(Criteria.where("id").is(id));
        Article Article = mongoTemplate.findOne(query, Article.class);
        return Article;
    }
    public Article getArticleByTitle(String title){
        Query query = new Query(Criteria.where("article_title").is(title));
        Article Article = mongoTemplate.findOne(query, Article.class);
        return Article;
    }

    public Article getNextArticle(Date create_date){
        Query query = new Query(Criteria.where("create_date").gt(create_date));
        query.with(Sort.by(new Order(Sort.Direction.ASC, "create_date")));
        Article Article = mongoTemplate.findOne(query, Article.class);
        return Article;
    }
    public Article getLastArticle(Date create_date){
        Query query = new Query(Criteria.where("create_date").lt(create_date));
        query.with(Sort.by(new Order(Sort.Direction.DESC, "create_date")));
        Article Article = mongoTemplate.findOne(query, Article.class);
        return Article;
    }

    public List<Article> getAllArticle(){

        List<Article> Articles = mongoTemplate.findAll(Article.class);
        return Articles;
    }

    public void removeByTitle(String title){
        Query query = new Query(Criteria.where("article_title").is(title));
        mongoTemplate.remove(query,Article.class);
    }
    public void removeById(String id){
        Query query = new Query(Criteria.where("id").is(id));
        mongoTemplate.remove(query,Article.class);
    }

    public void updateArticle(Article article){

        Query query = new Query(Criteria.where("id").is(article.getId()));
        Update update = new Update();
        update.set("article_title",article.getArticle_title());
        update.set("content",article.getContent());
        UpdateResult updateResult = mongoTemplate.updateFirst(query,update,Article.class);

    }

}
