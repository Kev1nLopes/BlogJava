package Service;

import Dao.UserDao;
import Models.User;

public class LoginService {

    public boolean autenticar(String login, String senha){
        User u = new UserDao().auth(login, senha);
        if(!u.getUserName().isEmpty() && u.getUserName().equals(login) && u.getPassword().equals(senha)) {

            System.out.println("true");
            return true;
        }else{
            System.out.println("false");
            return false;
//            dispatcher = req.getRequestDispatcher("/cadastroUsuario.jsp");
        }
    }

}
