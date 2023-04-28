package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    private static final String url = "jdbc:postgresql://localhost:5432/blog2";

    private static final String login = "postgres";

    private static final String pass = "1234";
    public Connection getConnection(){
//            try{
//                Class.forName("org.postgresql.Driver");
//            }catch(ClassNotFoundException e){
//                throw new RuntimeException(e);
//            }
//            return null;
        try {
            return DriverManager.getConnection(url, login, pass
            );
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
