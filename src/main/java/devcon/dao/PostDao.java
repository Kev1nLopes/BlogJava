package devcon.dao;




import devcon.connection.BDConnection;
import devcon.models.Post;
import devcon.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection connection;
    public PostDao(){
        this.connection = new BDConnection().GetConnection();
    }

    public List<Post> get(int UserId) throws SQLException {

        String sql = "SELECT p.id, p.content, p.user_id, u.username, u.email,  COUNT(c.post_id) as curtidas,  CASE WHEN EXISTS (\n" +
                "        SELECT 1 FROM curtida \n" +
                "        WHERE curtida.post_id  = p.id  and curtida.author_id = ? " +
                "    ) THEN 1 ELSE 0 END AS \"curtido_por_mim\"" +
                " FROM posts p " +
                " left join users u on u.id  = p.user_id " +
                " LEFT JOIN curtida c ON c.post_id = p.id " +
                " WHERE " +
                "    p.id NOT IN (" +
                "        SELECT pr.post_atual FROM posts_r pr " +
                "        INNER JOIN posts ON posts.id = pr.post_atual" +
                "    )" +
                "GROUP BY p.id, p.content, p.user_id, u.id, u.username, u.email";

        List<Post> posts = new ArrayList<Post>();
        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, UserId);
            ResultSet res = stmt.executeQuery();

            while(res.next()){
                Post post = new Post();
                post.User = new User();
                post.setId(res.getInt("id"));
                post.setContent(res.getString("content"));
                post.setCurtidas(res.getInt("curtidas"));
                post.setILiked(res.getInt("curtido_por_mim"));
                post.User.setId(res.getInt("user_id"));
                post.User.setUserName(res.getString("username"));
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

    public Post GetById(int UserAuthId, int idPost){

        String sql = "select p.id ,p.user_id, p.\"content\", users.username , count(c2.post_id) as curtidas, case when exists(" +
                " select 1 from curtida c  where c.post_id =p.id and c.author_id = ? " +
                " ) then 1 else 0 end as \"curtido_por_mim\" " +
                " from posts p left join curtida c2 on c2.post_id = p.id left join users on p.user_id = users.id where p.id = ? group by 1,4;";

        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, UserAuthId);
            stmt.setInt(2, idPost);
            ResultSet res  = stmt.executeQuery();
            Post post = new Post();
            while(!res.next()){

            }
                User user = new User();
                user.setUserName(res.getString("username"));
                user.setId(res.getInt("user_id"));
                post.setContent(res.getString("content"));
                post.setCurtidas(res.getInt("curtidas"));
                post.setILiked(res.getInt("curtido_por_mim"));
                post.setUser(user);

                res.close();
                stmt.close();
                return post;


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean removeLike(int AuthUserId, int postId){
        String sql = " delete from curtida where curtida.author_id = ? and curtida.post_id = ?";


        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, AuthUserId);
            stmt.setInt(2, postId);
            stmt.execute();

            stmt.close();

            return true;
        } catch (SQLException e) {
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


    public boolean like(int AuthUserId, int PostId){

        String sql = "insert into curtida(author_id, post_id) values(?, ?);";

        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, AuthUserId);
            stmt.setInt(2, PostId);
            stmt.execute();

            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
