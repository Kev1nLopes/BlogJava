package Dao;

import Models.User;
import services.ConnectionFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection connection;

    public UserDao() {
        this.connection = new ConnectionFactory().getConnection();
    }

    public void create(User user) {
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

/*
        String sql = "select * from users";

        try{
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet res = stmt.executeQuery();
            System.out.println(res);
            while(res.next()){
                String nome = res.getString("username");
                String email = res.getString("email");
                System.out.println(nome + " " + email);
            }
            res.close();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

 */
    }
}
