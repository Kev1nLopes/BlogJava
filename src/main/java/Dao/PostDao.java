package Dao;

import Models.Post;
import Models.User;
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

    public List<Post> get(int UserId) throws SQLException {

//        String sql = "select p.id, p.title, p.content, p.user_id, u.username, u.data_nasc, u.email  from posts p " +
//                " inner join users u on p.user_id = u.id  where p.id not in " +
//                " (select posts_r.post_atual  from posts_r  inner join posts on posts.id = posts_r.post_atual)";

//        String sql = "select p.id, p.title, p.content, p.user_id, u.username, u.data_nasc, u.email, count(curtida.post_id) as \"curtidas\" from posts p " +
//                " left join  curtida on curtida.post_id = p.id " +
//                " inner join users u on p.user_id = u.id where p.id not in  " +
//                " (select pr.post_atual from posts_r pr inner join posts on posts.id = pr.post_atual) " +
//                " group by 1, 5,6,7;";

        String sql = " SELECT  p.id, p.title, p.content, p.user_id, u.username, u.data_nasc, u.email, COUNT(curtida.post_id) AS \"curtidas\", " +
                "    CASE WHEN EXISTS (" +
                "        SELECT 1 FROM curtida " +
                "        WHERE post_id = p.id AND user_id = ?" +
                "    ) THEN 1 ELSE 0 END AS \"curtido_por_mim\"" +
                "FROM " +
                "    posts p " +
                "    LEFT JOIN curtida ON curtida.post_id = p.id " +
                "    INNER JOIN users u ON p.user_id = u.id " +
                "WHERE " +
                "    p.id NOT IN (" +
                "        SELECT pr.post_atual FROM posts_r pr " +
                "        INNER JOIN posts ON posts.id = pr.post_atual" +
                "    )" +
                "GROUP BY 1, 5, 6, 7";

        List<Post> posts = new ArrayList<Post>();
        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, UserId);
            ResultSet res = stmt.executeQuery();

            while(res.next()){
                Post post = new Post();
                post.User = new User();
                post.setId(res.getInt("id"));
                post.setTitle(res.getString("title"));
                post.setContent(res.getString("content"));
                post.setCurtidas(res.getInt("curtidas"));
                post.setILiked(res.getInt("curtido_por_mim"));
                post.User.setId(res.getInt("user_id"));
                post.User.setUserName(res.getString("username"));
                post.User.setData_nasc(res.getTimestamp("data_nasc"));
                post.User.setEmail(res.getString("email"));
                posts.add(post);

            }
            res.close();
            stmt.close();

            return  posts;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

    }


    public List<Post> getPostComments(int postMainId){


        String sql = "select posts.id, posts.user_id, posts.title, posts.\"content\", count(curtida.post_id) as \"curtidas\"   from posts inner join posts_r pr on pr.post_atual = posts.id and post_main = ?"
                + " left join curtida on posts.id = curtida.post_id group by 1 ; ";

        try{

            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, postMainId);
            ResultSet res = stmt.executeQuery();
            List<Post> posts = new ArrayList<Post>();

            while(res.next()){
                Post post = new Post();
                post.setId(res.getInt("id"));
                post.setTitle(res.getString( "title"));
                post.setContent(res.getString( "content"));
                post.setCurtidas(res.getInt("curtidas"));
                posts.add(post);
            }
            res.close();
            stmt.close();

            return posts;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean follow(int userId, int followedId){
        String sql = "insert into user_follow "
                + "values(?,?)";

        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, followedId);
            stmt.execute();
            stmt.close();

            return true;
        }catch(SQLException e){
            throw  new RuntimeException(e);

        }
    }


    public Post getById(int id){
        String sql = "select * from posts where id = ?";

        Post post = null;
        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet res = stmt.executeQuery();
            if(!res.next()){
                throw new SQLException("Não foi encontrado nenhum usuario com o id " + id + " !" );
            }

           post = new Post();
           post.setId(res.getInt("id"));
           post.setTitle(res.getString("title"));
           post.setContent(res.getString("content"));
           post.User.setId(res.getInt("user_id"));


            res.close();
            stmt.close();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return post;
    }

    /**
     *
     *
     * @param post
     * @return
     */
    public Post create(Post post){

        String sql = "INSERT INTO posts(title,content, user_id)"
                + "values (?,?,?)";


        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, post.getTitle());
            stmt.setString(2,post.getContent());
            stmt.setInt(3, post.User.getId());

            stmt.execute();
            stmt.close();

            return post;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public Post update(Post post){

        String sql = "update posts set "
                + "content=?, title=? where id = ?";


        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, post.getContent());
            stmt.setString(2, post.getTitle());
            stmt.setInt(3, post.getId());

            stmt.execute();
            stmt.close();;

            return post;


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean delete(int id){

        String sql = "delete from posts where id = ?";


        try{

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);

            stmt.execute();
            stmt.close();

            return true;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
