package devcon.services;

import devcon.dao.UserDao;
import devcon.models.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class LoginService {

    private HttpSession _session;
    public LoginService(HttpSession session){
        _session = session;
    }
    public LoginService(){

    }

    public int autenticar(String login, String senha){
        User u = new UserDao().auth(login, senha);
        if(!u.getUserName().isEmpty() && u.getUserName().equals(login) && u.getPassword().equals(senha)) {


            return u.getId();
        }else{
            System.out.println("false");
            return 0;
        }
    }

    public boolean verifyAuth(){
        var user = (User) _session.getAttribute("authUser");

        if(user.getId() == null){
            System.out.println("não logado");
            return false;
        }
        System.out.println("logado");
        return  true;
    }

}
