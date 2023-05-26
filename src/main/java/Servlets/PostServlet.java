package Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

<<<<<<< HEAD
=======

>>>>>>> 3da768a712f55e030cce49049070d16ab1da814e
public class PostServlet extends HttpServlet {

    //Metodo resposável por atender requisições e gerar as respostas adequadasaa
    @Override
    protected  void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body");
            out.println("Primeira servlet");
            out.println("</body>");
            out.println("</html>");
        RequestDispatcher rd = request.getRequestDispatcher("/style.jsp");
        rd.forward(request, response);
        }
    }

