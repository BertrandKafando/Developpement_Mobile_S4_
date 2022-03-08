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
   @Headers("apiKey:2b84bca18287417b9f34d9facdcab546")
    @GET("everything")
    Call<GlobalNews> searchNews(@Query("q") String txt );
  //  URL= https://newsapi.org/v2/everything?q={key}&from={date}&apiKey=3cf8c4eb320946bf9d88200dd85311b3
}
