package devcon.dao;

import devcon.connection.BDConnection;
import devcon.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDao {

    private Connection connection;

    public UserDao() {
        this.connection = new BDConnection().GetConnection();
    }


    public User auth(String login, String senha){

        String sql = "Select * from users where username = ? and password = ?";


        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setString(1, login);
            stmt.setString(2, senha);
            ResultSet res = stmt.executeQuery();
            User user = null;
            while(res.next()){
                user = new User();
                user.setId(res.getInt("id"));
                user.setUserName(res.getString("username"));
                user.setPassword(res.getString("password"));
                user.setEmail(res.getString("email"));
                user.setData_nasc(res.getTimestamp("data_nasc"));
            }
            res.close();
            stmt.close();

            return user;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public User create(User user) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        String sql = "insert into users" +
                "(username,password,data_nasc,email)" +
                "values (?,?,?,?)";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getPassword());
            stmt.setTimestamp(3, user.getData_nasc());
            stmt.setString(4, user.getEmail());

            stmt.execute();
            stmt.close();

            return user;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> get() throws SQLException {

        try {
            PreparedStatement stmt = this.connection.prepareStatement("select * from users");
            ResultSet res = stmt.executeQuery();
            List<User> users = new ArrayList<User>();

            while (res.next()) {
                User user = new User();
                user.setUserName(res.getString("username"));
                user.setPassword(res.getString("password"));
                user.setData_nasc(res.getTimestamp("data_nasc"));
                user.setEmail(res.getString("email"));
                users.add(user);

            }
            res.close();
            stmt.close();

            return users;

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
    public List<User> getUserThatIFollow(int AuthUserId){

        String sql = "SELECT users.id, users.username " +
                "FROM users " +
                "JOIN user_follow ON users.id = user_follow.user_id_followed " +
                "WHERE user_follow.user_id_following = ?";

        System.out.println(AuthUserId + "Usuario id logado");
        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, AuthUserId);
            List<User> usersThatIFollow = new ArrayList<User>();
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                User user = new User();
                user.setUserName(res.getString("username"));
                user.setId(res.getInt("id"));
                usersThatIFollow.add(user);
                System.out.println(user.UserName);
            }
            res.close();
            stmt.close();

            return usersThatIFollow;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public boolean unfollowUser(int idUser, int idFollowed){

        String sql = "delete from user_follow user_follow where" +
                " user_id_following = ? and user_id_followed = ? ";


        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, idUser);
            stmt.setInt(2, idFollowed);
            stmt.execute();
            stmt.close();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> getFollowers(int AuthUserId){

        String sql = "select  uf.user_id_following, u.username, u.email from user_follow uf inner join users u on uf.user_id_following = u.id and uf.user_id_followed = ?";


        try{
            List<User> users = new ArrayList<User>();
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, AuthUserId);

            ResultSet res = stmt.executeQuery();
            while(res.next()){
                User user = new User();
                user.setId(res.getInt("user_id_following"));
                user.setUserName(res.getString("username"));
                user.setEmail(res.getString("email"));
                users.add(user);
            }
            res.close();
            stmt.close();

            return users;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> GetUsersThatINotFollow(int AuthUserId){

        String sql = "SELECT id, username " +
                "FROM users " +
                "WHERE id NOT IN (" +
                "    SELECT user_id_followed" +
                "    FROM user_follow" +
                "    WHERE user_id_following = ? )";


        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, AuthUserId);
            List<User> usersThatIFollow = new ArrayList<User>();
            ResultSet res = stmt.executeQuery();
            while(res.next()){
                User user = new User();
                user.setUserName(res.getString("username"));
                user.setId(res.getInt("id"));
                usersThatIFollow.add(user);
                System.out.println(user.UserName);
            }
            res.close();
            stmt.close();

            return usersThatIFollow;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    };



    public User getById(int id) throws  SQLException{

        String sql = "select users.username, users.email, users.id, users.data_nasc from users where id = ?";

        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, id);

            ResultSet res = stmt.executeQuery();
            User user = new User();
            while(res.next()){
                user.setId(res.getInt("id"));
                user.setUserName(res.getString("username"));
                user.setEmail(res.getString("email"));
                user.setData_nasc(res.getTimestamp("data_nasc"));
            }
            res.close();
            stmt.close();
            return user;

        }catch(SQLException e){
            throw  new RuntimeException(e);
        }

    }

    public boolean deleteFollower(int authUserId, int idFollowerMe){
        String sql = "delete from user_follow where user_id_followed = ? and user_id_following = ?";


        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, authUserId);
            stmt.setInt(2, idFollowerMe);
            stmt.execute();

            stmt.close();
            return true;


        } catch (SQLException e) {
            return false;
        }
    }

    public User update(User user, int userId) throws SQLException{

        String sql = "update users set username = ?, password = ?, email = ? where id = ?";


        try{
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setInt(4, userId);
            stmt.execute();

            return user;

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }




}
