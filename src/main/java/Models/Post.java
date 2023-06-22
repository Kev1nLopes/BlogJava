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

    private int ILiked;

    public int getILiked() {
        return ILiked;
    }

    public void setILiked(int ILiked) {
        this.ILiked = ILiked;
    }

    public int getCurtidas() {
        return Curtidas;
    }

    public void setCurtidas(int curtidas) {
        Curtidas = curtidas;
    }

    private int Curtidas;


    public User User = new User();

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
