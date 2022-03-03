package ma.enset.apigithub;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Adapter;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import ma.enset.apigithub.model.GitUser;
import ma.enset.apigithub.model.GitusersResponse;
import ma.enset.apigithub.model.UsersListviewModel;
import ma.enset.apigithub.service.GitRepoServiceAPI;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {
    List<GitUser>listString=new ArrayList<>();//liste objets
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        EditText editText=findViewById(R.id.saisie);
        Button buttonSearch=findViewById(R.id.button2);
        ListView liste=findViewById(R.id.listeusers);

        UsersListviewModel userAdapter=new UsersListviewModel(this,R.layout.listviewlayout,listString);
        liste.setAdapter(userAdapter);
        Retrofit retrofit=new Retrofit.Builder()
                .baseUrl("https://api.github.com/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        buttonSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String query=editText.getText().toString();
                GitRepoServiceAPI gitRepoServiceAPI=retrofit.create(GitRepoServiceAPI.class);
                Call<GitusersResponse>callusersresponse=gitRepoServiceAPI.searchesUsers(query);

                callusersresponse.enqueue(new Callback<GitusersResponse>() {
                    @Override
                    public void onResponse(Call<GitusersResponse> call, Response<GitusersResponse> response) {

                        Log.i("info",call.request().url().toString());
                        if(!response.isSuccessful()){

                            Log.i("indo",String.valueOf(response.code()));
                            return;
                        }
                        GitusersResponse gitusersResponse=response.body();
                        for (GitUser gituser:gitusersResponse.users
                             ) {
                            listString.add(gituser);
                        }
                        userAdapter.notifyDataSetChanged();
                    }

                    @Override
                    public void onFailure(Call<GitusersResponse> call, Throwable t) {
                        Log.e("error","Error");
                    }
                });
            }
        });

    }
}

