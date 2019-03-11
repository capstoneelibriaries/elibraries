package models;

public class User {

    private long id;
    private String username;
    private String email;
    private String phone;
    private String password;
    double rating;

    public User(){
        // default
    }

    public long getId(){
        return id;
    }

    public String getUsername(){
        return username;
    }

    public String getEmail(){
        return email;
    }

    public String getPhone(){
        return phone;
    }

    public String getPassword(){
        return password;
    }

    public double getRating(){
        return rating;
    }

    public void setId(long id){
        this.id = id;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public void setRating(Double rating){
        this.rating = rating;
    }

    public String toString(){
        return "";
    }
}