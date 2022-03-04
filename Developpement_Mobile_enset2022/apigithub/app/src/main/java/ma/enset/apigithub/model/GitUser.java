package ma.enset.apigithub.model;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class GitUser implements Serializable {
    //declarer les champs qui nous interreses mm nom
    public int id;
    public String login;
    //si nom different
    @SerializedName("avatar_url")
    public String avatarUrl;

    public  int score;

}
