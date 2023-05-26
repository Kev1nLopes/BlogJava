package Controller;

import Dao.UserDao;
import Models.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@WebServlet("register")
public class RegisterController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("Usuario");
        String email = req.getParameter("Email");
        String password = req.getParameter("Senha");
        Timestamp DataNasc = new Timestamp(System.currentTimeMillis());
        RequestDispatcher dispatcher;
        User u = new User(username, password, DataNasc, email);
        if(new UserDao().create(u) != null){
            dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
        }else{
            dispatcher = req.getRequestDispatcher("/cadastroUsuario.jsp");
        }
        dispatcher.forward(req, resp);

        System.out.println("Usuario criado");
    }
}
