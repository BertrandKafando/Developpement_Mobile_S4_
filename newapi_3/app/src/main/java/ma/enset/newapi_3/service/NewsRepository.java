package ma.enset.newapi_3.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import ma.enset.newapi_3.model.GlobalNews;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Path;
import retrofit2.http.Query;

public interface NewsRepository {
   //@Headers("apiKey:2b84bca18287417b9f34d9facdcab546")
    @GET("v2/everything")
    Call<GlobalNews> searchNews(@Query("q") String txt,@Query("date") LocalDate date ,@Query("apiKey") String api );
    @GET("v2/everything")
    Call<GlobalNews> searchNews(@Query("q") String txt,@Query("apiKey") String api );
    @GET("v2/everything")
    Call<GlobalNews> searchNews(@Query("date") LocalDate date ,@Query("apiKey") String api );
}
