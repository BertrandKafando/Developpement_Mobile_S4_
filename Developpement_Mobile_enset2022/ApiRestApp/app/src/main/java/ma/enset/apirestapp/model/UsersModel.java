package ma.enset.apirestapp.model;

import com.google.gson.annotations.SerializedName;

public class UsersModel {
    private String name;
    @SerializedName("username")
    private String UserName;
    private String email;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
