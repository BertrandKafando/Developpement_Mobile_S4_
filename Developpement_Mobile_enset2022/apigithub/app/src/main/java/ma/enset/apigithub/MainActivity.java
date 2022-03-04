package ma.enset.apigithub;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import ma.enset.apigithub.model.GitUser;
import ma.enset.apigithub.model.GitusersResponse;
import ma.enset.apigithub.model.UsersListviewAdapter;
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
        StrictMode.ThreadPolicy strictMode=new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(strictMode);

        EditText editText=findViewById(R.id.saisie);
        Button buttonSearch=findViewById(R.id.button2);

        ListView liste=findViewById(R.id.listeusers);


        liste.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(getApplicationContext(),listString.get(i).login,Toast.LENGTH_SHORT).show(); //meaasge en bas
                Intent intent=new Intent(getApplicationContext(),UserActivity.class);
                 //intent.putExtra("user",listString.get(i).login);
                 intent.putExtra("user",listString.get(i));
                startActivity(intent);
                //intent permet d'envoyer des données entre activities

            }
        });

        UsersListviewAdapter userAdapter=new UsersListviewAdapter(this,R.layout.listviewlayout,listString);
        liste.setAdapter(userAdapter);
        Retrofit retrofit=new Retrofit.Builder()
                .baseUrl("https://api.github.com/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();


        buttonSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                listString.clear();
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

