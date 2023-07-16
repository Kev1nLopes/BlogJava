package devcon.services;


import devcon.dao.PostDao;
import devcon.models.Post;
import devcon.models.User;

public class PostService {



    public boolean create(String title, String content, int idUser){
        Post post = new Post();
        User user = new User();
        user.setId(idUser);
        post.setUser(user);
        post.setContent(content);
        post.setTitle(title);

        Post postCriado =  new PostDao().create(post);

        if(!postCriado.getContent().isEmpty()){
            System.out.println("post criado");
            return  true;
        }else{
           return false;
        }


    }

}
