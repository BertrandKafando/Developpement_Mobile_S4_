package ma.enset.apirestapp;

import java.util.List;

import ma.enset.apirestapp.model.UsersModel;
import retrofit2.Call;
import retrofit2.http.GET;

public interface RestServiceApi {
    @GET("users/")
    Call<List<UsersModel>>listUers();
}
