package ma.enset.newapi_3;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Adapter;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ma.enset.newapi_3.model.GlobalNews;
import ma.enset.newapi_3.service.NewsRepository;
import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {
   private List<String> strings=new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        EditText keyw=findViewById(R.id.key);
        EditText date=findViewById(R.id.date);
        Button button=findViewById(R.id.searchbutton);
        ListView listView=findViewById(R.id.listview);

        ArrayAdapter adapter=new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,strings);
        listView.setAdapter(adapter);


        //preparation
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://newsapi.org/v2/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();




        button.setOnClickListener(new View.OnClickListener() {
            //@RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            public void onClick(View view) {
                NewsRepository newsrepo=retrofit.create(NewsRepository.class);
                String txt=keyw.getText().toString();
               // Date dat=date.getText().toString()
               // LocalDate dat = LocalDate.parse(date.getText().toString(), DateTimeFormatter.ISO_DATE);
                Call<GlobalNews> callnews=newsrepo.searchNews(txt);

                callnews.enqueue(new Callback<GlobalNews>() {
                    @Override
                    public void onResponse(Call<GlobalNews> call, Response<GlobalNews> response) {
                        Log.i("Info","ok");
                        GlobalNews news=response.body();
                        Log.i("head",response.headers().toString());
                        if(!response.isSuccessful()){

                            Log.i("indo",String.valueOf(response.code()));
                            return;
                        }
                        strings.add(news.articles.get(0).getTitle());
                        Log.i("data",news.articles.get(0).getTitle());

                    }

                    @Override
                    public void onFailure(Call<GlobalNews> call, Throwable t) {
                        Log.i("Info","erreur");
                    }
                });

            }
        });

    }
}