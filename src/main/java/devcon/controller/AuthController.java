package devcon.controller;

import devcon.dao.PostDao;
import devcon.dao.UserDao;
import devcon.models.Post;
import devcon.models.User;
import devcon.services.LoginService;
import org.apache.juli.logging.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;

@Controller
public class AuthController {

    final HttpSession _session;

    final LoginService _loginService;

    public AuthController(HttpSession session) {

        _session = session;
        _loginService = new LoginService(_session);
    }
    @GetMapping("/login")
    public String LoginView(Model model){
        System.out.println("chegou aqui");
        model.addAttribute("user", new User());
        return "login";
    }

    @GetMapping("/")
    public String HomeView(Model model) throws SQLException {


        if(_loginService.verifyAuth()){
            var user = (User) model.getAttribute("authUser");
            if(user == null){
                user = (User) _session.getAttribute("authUser");
            }
            model.addAttribute("authUser", user);
            model.addAttribute("user", new User());
            model.addAttribute("post", new Post());
            model.addAttribute("posts", new PostDao().get(user.Id));
            return "index";
        }

        return "login";
    }


    @PostMapping("/auth")
    public RedirectView Login(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) throws SQLException {

        System.out.println("bateu no login");
        System.out.println(user.UserName);
        System.out.println(user.getPassword());
        final RedirectView redirectView = new RedirectView("/", true);
        int userId = new LoginService().autenticar(user.UserName, user.getPassword());
        user.setId(userId);
        redirectAttributes.addFlashAttribute("authUser",  user);
        _session.setAttribute("authUser", new UserDao().getById(userId));

        return redirectView;
    }

    @GetMapping("/profile")
    public String profile(Model model){

        if(_loginService.verifyAuth()){
            System.out.println("chegou aqui");
            var user = (User) _session.getAttribute("authUser");

            model.addAttribute("user", user);
            return "perfil";
        }
        return "login";

    }


    @PostMapping("/updateProfile")
    public RedirectView update(@ModelAttribute("user") User user) throws SQLException {


        RedirectView rv;

        if(_loginService.verifyAuth()){
            var authUser = (User) _session.getAttribute("authUser");
            var newUser = new UserDao().update(user, authUser.getId());
            newUser.setId(authUser.getId());
            _session.setAttribute("authUser", newUser);

            rv = new RedirectView("/", true);
            return rv;
        }

        rv = new RedirectView("/login", true);
        return rv;
    }


    @GetMapping("/cadastro")
    public String cadastro(Model model){

        model.addAttribute("user", new User());
        return "cadastro";
    }


    @PostMapping("/register")
    public RedirectView register(@ModelAttribute("user") User user){

        new UserDao().create(user);
        RedirectView rv = new RedirectView("/login", true);
        return rv;
    }

}
