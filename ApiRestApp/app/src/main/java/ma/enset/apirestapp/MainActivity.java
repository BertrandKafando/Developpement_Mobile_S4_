package ma.enset.apirestapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import ma.enset.apirestapp.model.UsersModel;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {
    List<String>data=new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ListView listView=findViewById(R.id.liste);
        ArrayAdapter adapter=new ArrayAdapter(this, android.R.layout.simple_list_item_1,data);
        listView.setAdapter(adapter);

        Retrofit retrofit=new Retrofit
                .Builder()
                .baseUrl("https://jsonplaceholder.typicode.com/")
                .addConverterFactory(GsonConverterFactory.create()).build();

        //
        RestServiceApi serviceApi=retrofit.create(RestServiceApi.class); //instanciation dynamique

        Call<List<UsersModel>> callUsers=serviceApi.listUers();  //appel

        callUsers.enqueue(new Callback<List<UsersModel>>() {
            @Override
            public void onResponse(Call<List<UsersModel>> call, Response<List<UsersModel>> response) {
                Log.i("info","sucess");
                List<UsersModel> users=response.body();
                for (UsersModel a:users){
                    data.add(a.getName());
                }
                adapter.notifyDataSetChanged(); //attention adapter
            }

            @Override
            public void onFailure(Call<List<UsersModel>> call, Throwable t) {
                Log.i("info","echec");

            }
        });


    }
}