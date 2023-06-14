package Service;

import Dao.UserDao;
import Models.User;

public class LoginService {

    public int autenticar(String login, String senha){
        User u = new UserDao().auth(login, senha);
        if(!u.getUserName().isEmpty() && u.getUserName().equals(login) && u.getPassword().equals(senha)) {


            return u.getId();
        }else{
            System.out.println("false");
            return 0;
//
        }
    }

}
