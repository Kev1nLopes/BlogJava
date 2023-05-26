package teste;

import Dao.PostDao;
import Dao.UserDao;
import Models.Post;
import Models.User;
import services.ConnectionFactory;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class ClienteTeste {

    public static void main(String[] args) throws SQLException {

        User user =  new User(100, "lUIZ","12345", new Timestamp(System.currentTimeMillis()), "pedro@gmail.com" );
        Post post = new Post(1, "Cade o luiz ?", "Não sei");

        PostDao dao = new PostDao();

    }

}
