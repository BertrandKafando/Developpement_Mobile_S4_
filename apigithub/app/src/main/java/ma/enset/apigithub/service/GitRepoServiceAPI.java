package ma.enset.apigithub.service;

import ma.enset.apigithub.model.GitusersResponse;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface GitRepoServiceAPI {
    //envoie une requete ver search/users avec la paramete q=query
    @GET("search/users")
    public Call<GitusersResponse>searchesUsers(@Query("q") String query);
}
