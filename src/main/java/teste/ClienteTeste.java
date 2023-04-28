package teste;

import Dao.UserDao;
import Models.User;
import services.ConnectionFactory;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class ClienteTeste {

    public static void main(String[] args) throws SQLException {

        User user =  new User(100, "lUIZ","12345", new Timestamp(System.currentTimeMillis()), "pedro@gmail.com" );


            UserDao dao = new UserDao();
            dao.create(user);
            List<User> users = dao.get();


            for(User u: users){
                System.out.println(u.getUserName());
            }



    }

}
