package Models;

import java.sql.Timestamp;

public class User {

    public User(String userName, String password, Timestamp data_nasc, String email) {

        UserName = userName;
        Password = password;
        data_nasc = data_nasc;
        Email = email;

    }
    public User(int id,String userName, String password, Timestamp data_nasc, String email) {
        Id = id;
        UserName = userName;
        Password = password;
        data_nasc = data_nasc;
        Email = email;
    }
    public User(){}

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public Timestamp getData_nasc() {
        return data_nasc;
    }

    public void setData_nasc(Timestamp data_nasc) {
        this.data_nasc = data_nasc;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer Id;
    public String UserName;
    public String Password;
    public Timestamp data_nasc;
    public String Email;


}
