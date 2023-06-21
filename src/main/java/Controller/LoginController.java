package Controller;

import Service.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("login")
public class LoginController extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
//        super.service(req, res);
        System.out.println("Bateu no login");

        String login =  req.getParameter("Usuario");
        String senha =  req.getParameter("Senha");


        RequestDispatcher dispatcher;
        int idUser = new LoginService().autenticar(login,senha);

        if(idUser != 0){
            //Use session here
            HttpSession session = ((HttpServletRequest) req).getSession();
            session.setAttribute("Usuario", login);
            session.setAttribute("userId", idUser);
            req.setAttribute("modal", false);
            dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
        }else{

            dispatcher = req.getRequestDispatcher("/cadastroUsuario.jsp");
        }

        dispatcher.forward(req, res);
    }
}
