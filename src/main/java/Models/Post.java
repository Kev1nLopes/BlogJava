package Models;

public class Post {

    public Post(int id, int author_id, String title, String content) {
        Id = id;
        Author_id = author_id;
        this.title = title;
        Content = content;
    }
    public Post( int author_id, String title, String content) {

        Author_id = author_id;
        this.title = title;
        Content = content;
    }

    public Post(){}


    private int Id;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    private int Author_id;
    private String title;
    private String Content;
    public int getAuthor_id() {
        return Author_id;
    }

    public void setAuthor_id(int author_id) {
        Author_id = author_id;
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
