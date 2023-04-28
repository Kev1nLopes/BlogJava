package Dao;

import Models.Post;
import services.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection connection;
    public PostDao(){
        this.connection = new ConnectionFactory().getConnection();
    }



    public List<Post> get() throws SQLException {

        String sql = "select * from posts";
        List<Post> posts = new ArrayList<Post>();
        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet res = stmt.executeQuery();

            while(res.next()){
                Post post = new Post();
                post.Id = res.getInt("id");
                post.Author_id = res.getInt("user_id");
                post.title = res.getString("titulo");
                post.Content = res.getString("content");
                posts.add(post);

            }

            stmt.close();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return null;

    }

}
