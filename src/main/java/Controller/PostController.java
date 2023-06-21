package Controller;

import Dao.PostDao;
import Dao.UserDao;
import Models.User;
import Service.PostService;
import Models.Post;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("post")
public class PostController extends HttpServlet {

    //Mudar para postController
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

        String action = req.getParameter("action");
        System.out.println(action);
        if(action.equals("createPost")){
            this.createPost(req, res);
        }
        if (action.equals("follow")){
            this.followSomeone(req, res);
        }
        if (action.equals("delete")){
            this.deletePost(req, res);
        }
        if(action.equals("unfollow")){
            this.unfollow(req, res);
        }
        if(action.equals("getComments")){
            this.getComments(req, res);
        }
        if(action.equals("closeModal")){
            this.closeModal(req, res);
        }
        if(action.equals("getPost")){
            this.getPost(req, res);
        }
    }

    public void deletePost(ServletRequest req, ServletResponse res) throws ServletException, IOException {

        int postId = Integer.parseInt(req.getParameter("postId"));
        RequestDispatcher requestDispatcher;
        if(new PostDao().delete(postId)){
            requestDispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
        }else{
            requestDispatcher = req.getRequestDispatcher("/login.jsp");
        }

        requestDispatcher.forward(req, res);
    }

    public void followSomeone(ServletRequest req, ServletResponse res) throws ServletException, IOException{
        System.out.println("seguir alguem ai");

        int userId = Integer.parseInt(req.getParameter("userId"));
        int followedId = Integer.parseInt(req.getParameter("followedId"));
        System.out.println(followedId + "followedId");
        System.out.println(userId + "userId");

        RequestDispatcher requestDispatcher;

        if(new PostDao().follow(userId, followedId)){
            System.out.println("Seguido com sucesso");

        }else{
            System.out.println("Não deu bom");

        }
    }

    public void unfollow(ServletRequest req, ServletResponse res) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userId"));
        int followedId = Integer.parseInt(req.getParameter("followedId"));
        RequestDispatcher requestDispatcher;
        if(new UserDao().unfollowUser(userId, followedId)){

            requestDispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");

        }else{

            requestDispatcher = req.getRequestDispatcher("/login.jsp");
        }

        requestDispatcher.forward(req, res);
    }

    public void createPost(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        // Titulo, conteudo, userId
        System.out.println("Criando post");
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        String WhatIsHappen = req.getParameter("wih");
        String Title = "post";

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



    public void closeModal(ServletRequest req, ServletResponse res) throws ServletException, IOException{

        req.setAttribute("modal", false);
        RequestDispatcher dispatcher;
        dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
        System.out.println("merda");
        dispatcher.forward(req, res);

    }

    public void getPost(ServletRequest req, ServletResponse res) throws ServletException, IOException{

            int postId = Integer.parseInt(req.getParameter("postId"));
            System.out.println(postId);

            Post post = new PostDao().getById(postId);
            Gson gson = new Gson();
            String json = gson.toJson(post);

            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            res.getWriter().write(json);

    }
    public void getComments(ServletRequest req, ServletResponse res) throws ServletException, IOException{

        int postId = Integer.parseInt(req.getParameter("postId"));

        List<Post> posts = new PostDao().getPostComments(postId);

        String json = new Gson().toJson(posts);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(json);

    }

}
