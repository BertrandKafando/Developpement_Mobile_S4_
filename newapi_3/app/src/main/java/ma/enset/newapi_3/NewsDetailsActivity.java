package ma.enset.newapi_3;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import java.net.URL;

import ma.enset.newapi_3.model.Articles;

public class NewsDetailsActivity extends AppCompatActivity {
    private  ImageView img2;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.newsdetailsactivity);


        TextView titre=findViewById(R.id.titre2);
           img2=findViewById(R.id.imageView2);
        TextView des=findViewById(R.id.des2);
        TextView content=findViewById(R.id.cont);
        TextView auth=findViewById(R.id.auth);
        TextView date=findViewById(R.id.publish);

        Intent intent=getIntent();
        Articles article=(Articles) intent.getSerializableExtra("new");
        titre.setText(article.getTitle());
        des.setText(article.getDescription());
        content.setText(article.getContent());
        auth.setText(article.getAuthor());
        date.setText("publishedAt :"+article.getPublishedAt());




       Thread thread = new Thread(){
           @Override
           public void run() {
               runOnUiThread(new Runnable() {
                   @Override
                   public void run() {
                       try {
                           Log.i("info2",article.getUrlToImage().toString());
                           URL url=article.getUrlToImage();
                           Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
                           img2.setImageBitmap(bitmap);


                       } catch (Exception e) {
                           e.printStackTrace();
                       }
                   }
               });
           }
       };  thread.start();




    }
}
