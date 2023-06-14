package Controller;

import Dao.PostDao;
import Models.Post;
import Service.LoginService;
import Service.PostService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebServlet("createPost")
public class CreatePostController extends HttpServlet {

    //Mudar para postController
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

        System.out.println("Bateu no cadastro de post");
        String action = req.getParameter("action");
        System.out.println(action);
        if(action.equals("createPost")){
            this.createPost(req, res);
        }



    }



    public void createPost(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        // Titulo, conteudo, userId
        System.out.println("Criando post");
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        String WhatIsHappen = req.getParameter("wih");
        String Title = "post";

//        Post post = new Post();
//        post.setTitle(Title);
//        post.setContent(WhatIsHappen);
//        post.setId(idUser);


        RequestDispatcher dispatcher;

        if(new PostService().create(Title, WhatIsHappen, idUser)){
            req.setAttribute("userId", idUser);
            req.setAttribute("created", true);
            dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
        }else{
            req.setAttribute("created", false);
            dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
        }

        dispatcher.forward(req, res);





    }
}
