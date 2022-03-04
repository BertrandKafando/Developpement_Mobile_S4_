package ma.enset.apigithub;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import java.net.URL;

import ma.enset.apigithub.model.GitUser;

public class UserActivity extends AppCompatActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.userlayout);
        ImageView imageView=findViewById(R.id.imageview2);
        TextView login=findViewById(R.id.textViewlogin2);
        TextView score=findViewById(R.id.textViewscore2);

        Intent intent=getIntent();
        GitUser user=(GitUser) intent.getSerializableExtra("user");
        login.setText(user.login);
        score.setText(String.valueOf(user.score));
        try {
            URL url=new URL(user.avatarUrl);
            Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
            imageView.setImageBitmap(bitmap);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
