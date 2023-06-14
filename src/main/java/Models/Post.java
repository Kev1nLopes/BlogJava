package Models;

public class Post {

    public Post(){}

    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }
    private String title;
    private String Content;


    public User User;

    public Models.User getUser() {
        return User;
    }

    public void setUser(Models.User user) {
        User = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }


}
