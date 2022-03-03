package ma.enset.apigithub.model;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

public class GitusersResponse {
    @SerializedName("total_count")
    public int totalCount;
    @SerializedName("items")
    public List<GitUser>users=new ArrayList<>();
}
