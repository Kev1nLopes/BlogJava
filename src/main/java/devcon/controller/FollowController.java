package devcon.controller;

import devcon.dao.UserDao;
import devcon.models.User;
import devcon.services.LoginService;
import org.apache.juli.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;

@Controller
@RequestMapping("/follow")
public class FollowController {

    final HttpSession _session;


    final LoginService _loginService;

    public FollowController(HttpSession session){

        _session = session;
        _loginService = new LoginService(_session);
    }

    @GetMapping("")
    public String getFollowing(Model model){
        System.out.println("bom dia");
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            List<User> following = new UserDao().getUserThatIFollow(user.getId());
            model.addAttribute("following", following);
            model.addAttribute("userId", user.getId());
            return "seguindo";
        }else{
            return "login";
        }


    }

    @GetMapping("{id}")
    public RedirectView follow(Model model, @PathVariable("id") String id){
        RedirectView rv;

        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            new UserDao().follow(user.getId(), Integer.parseInt(id));
            model.addAttribute("following", new UserDao().getUserThatIFollow(user.getId()));

             rv= new RedirectView("/follow/not", true);
            return rv;
        }else{
            rv = new RedirectView("/login", true);
            return rv;
        }

    }

    @GetMapping("/not")
    public String notFollow(Model model){
        System.out.println("not");
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            List<User> users = new UserDao().GetUsersThatINotFollow(user.getId());
            model.addAttribute("not_following", users);
            model.addAttribute("userId", user.getId());

            return "naoseguindo";
        }
        return "login";

    }

    @GetMapping("/stop/{id}")
    public RedirectView stopFollow(Model model, @PathVariable int id){
        RedirectView rv;
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            new UserDao().unfollowUser(user.getId(), id);

           rv = new RedirectView("/follow", true);

            return rv;
        }else{
            rv = new RedirectView("/login", true);
            return rv;
        }

    }

    @GetMapping("/me")
    public String followers(Model model){
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            List<User> users = new UserDao().getFollowers(user.getId());
            model.addAttribute("followers", users);
            model.addAttribute("userId", user.getId());
            return "seguidores";
        }
        return "login";

    }

    @GetMapping("/remove-follower/{id}")
    public RedirectView removeFollower(Model model, @PathVariable("id") int id){
        RedirectView rv;
        if(_loginService.verifyAuth()){
            var user = (User) _session.getAttribute("authUser");
            boolean removido = new UserDao().deleteFollower(user.getId(), id);
            rv = new RedirectView("/follow/me", true);
            System.out.println("Seguidor Removido");

            return rv;
        }else{
            rv = new RedirectView("/api/login");
            return rv;
        }

    }
}
