package ma.enset.newapi_3;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ma.enset.newapi_3.model.AdapterList;
import ma.enset.newapi_3.model.Articles;
import ma.enset.newapi_3.model.GlobalNews;
import ma.enset.newapi_3.service.NewsRepository;
import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {
   private List<Articles> strings=new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);
        StrictMode.ThreadPolicy strictMode=new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(strictMode);

        setContentView(R.layout.activity_main);
        EditText keyw=findViewById(R.id.key);
        EditText date=findViewById(R.id.date);
        Button button=findViewById(R.id.searchbutton);
        ListView listView=findViewById(R.id.listview);

        AdapterList adapter=new AdapterList(this,R.layout.listviewlayout,strings);
        listView.setAdapter(adapter);



        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Intent intent=new Intent(getApplicationContext(),NewsDetailsActivity.class);
                intent.putExtra("new",strings.get(i));
                startActivity(intent);
            }
        });








        //preparation
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://newsapi.org/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();




        button.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            public void onClick(View view) {
                NewsRepository newsrepo=retrofit.create(NewsRepository.class);
                String txt=keyw.getText().toString();
                String d=date.getText().toString();
                if(txt.equals("")){
                    System.out.println("enter");
                    Toast.makeText(getApplicationContext(),"Put a Keyword",Toast.LENGTH_SHORT).show(); //meaasge en bas

                }else if(d.equals("")){  //pas de date saisie
                    Call<GlobalNews> callnews=newsrepo.searchNews(txt,"2b84bca18287417b9f34d9facdcab546");

                    callnews.enqueue(new Callback<GlobalNews>() {
                        @Override
                        public void onResponse(Call<GlobalNews> call, Response<GlobalNews> response) {
                            Log.i("Info","ok");
                            GlobalNews news=response.body();

                            if(!response.isSuccessful()){

                                Log.i("indo",String.valueOf(response.code()));
                                return;
                            }

                            news.articles.forEach(p->{
                                strings.add(p);
                            });


                            //strings.add(news.articles.get(0).getTitle());
                            // Log.i("data",news.getTotalResults()+"");
                            //Log.i("data",news.articles.get(0).getTitle());

                        }

                        @Override
                        public void onFailure(Call<GlobalNews> call, Throwable t) {
                            Log.i("Info","erreur");
                        }
                    });

                } else{
                    LocalDate dat = LocalDate.parse(date.getText().toString(), DateTimeFormatter.ISO_DATE);
                    Call<GlobalNews> callnews=newsrepo.searchNews(txt,dat,"2b84bca18287417b9f34d9facdcab546");

                    callnews.enqueue(new Callback<GlobalNews>() {
                        @Override
                        public void onResponse(Call<GlobalNews> call, Response<GlobalNews> response) {
                            Log.i("Info","ok");
                            GlobalNews news=response.body();

                            if(!response.isSuccessful()){

                                Log.i("indo",String.valueOf(response.code()));
                                return;
                            }

                            news.articles.forEach(p->{
                                strings.add(p);
                            });


                            //strings.add(news.articles.get(0).getTitle());
                            // Log.i("data",news.getTotalResults()+"");
                            //Log.i("data",news.articles.get(0).getTitle());

                        }

                        @Override
                        public void onFailure(Call<GlobalNews> call, Throwable t) {
                            Log.i("Info","erreur");
                        }
                    });
                    //
                }



            }
        });

    }
}