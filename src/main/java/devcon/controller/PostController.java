package devcon.controller;


import devcon.dao.PostDao;
import devcon.models.Post;
import devcon.models.User;
import devcon.services.LoginService;
import devcon.services.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class PostController {
    final HttpSession _session;

    final LoginService _loginService;

    public PostController(HttpSession session) {
        _session = session;
        _loginService = new LoginService(_session);
    }
    @GetMapping("/get")
    public String ViewPosts(Model model){


        model.addAttribute("posts", (List<Post>) model.getAttribute("posts"));
        model.addAttribute("post", new Post());
        System.out.println(model.getAttribute("posts"));
        return "index";
    }

    @PostMapping ("/add")
    public RedirectView addPosts(@ModelAttribute("post") Post post, RedirectAttributes redirectAttributes) throws SQLException {
        System.out.println("chamou o trem aqui");

        var user = (User) _session.getAttribute("authUser");
        post.getUser().setId(user.getId());
        new PostDao().create(post);

        var posts = new PostDao().get(user.getId());
        final RedirectView rv = new RedirectView("/get", true);
        redirectAttributes.addFlashAttribute("posts", posts);

        return rv;
    }


    @GetMapping("/like/{id}")
    public RedirectView likePost(Model model, @PathVariable("id") int id) throws SQLException {

        RedirectView rv;
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            boolean curtiu = new PostDao().like(user.getId(), id);

            rv = new RedirectView("/", true);

            return rv;
        }

        return new RedirectView("/login", true);
    }

    @GetMapping("/deslike/{id}")
    public RedirectView unlinePost(Model model, @PathVariable("id")  int id){
        RedirectView rv;
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            boolean descurtir = new PostDao().removeLike(user.getId(), id);
            rv = new RedirectView("/", true);
            return rv;
        }else{
            rv = new RedirectView("/login", true);
            return rv;
        }
    }


    @GetMapping("/comentarios/{id}")
    public String viewPostComments(Model model, @PathVariable("id") int id){

        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            model.addAttribute("post", new PostDao().GetById(user.getId(), id));
            model.addAttribute("comments", new PostDao().getPostComments(id));
            return "comentarios";

        }
        return "index";
    }

    @GetMapping("/delete/{id}")
    public RedirectView deletePost(Model model, @PathVariable("id") int id){
        RedirectView rv;

        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            var deletou = new PostDao().delete(id);
            rv = new RedirectView("/", true);
            return rv;

        }
        rv = new RedirectView("/login", true);
        return rv;
    }
}
