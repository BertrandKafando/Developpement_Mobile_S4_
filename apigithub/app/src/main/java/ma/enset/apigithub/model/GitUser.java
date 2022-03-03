package ma.enset.apigithub.model;

import com.google.gson.annotations.SerializedName;

public class GitUser {
    //declarer les champs qui nous interreses mm nom
    public int id;
    public String login;
    //si nom different
    @SerializedName("avatar_url")
    public String avatarUrl;
    public  int score;

}
