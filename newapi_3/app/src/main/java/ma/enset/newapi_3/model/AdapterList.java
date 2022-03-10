package ma.enset.newapi_3.model;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.net.URL;
import java.util.List;

import ma.enset.newapi_3.R;

public class AdapterList extends ArrayAdapter<Articles> {
    private List<Articles> news;
    private int ressource;

    public AdapterList(@NonNull Context context, int resource, @NonNull List<Articles> objects) {
        super(context, resource, objects);
        this.news=objects;
        this.ressource=resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View listViewItem=convertView;
        //recup du layout des objets
        if(listViewItem==null){
            //contruire la vue  en fonction des elements du fihier xml==onsetview de oncreate
            listViewItem= LayoutInflater.from(getContext()).inflate(ressource,parent,false);
        }

        ImageView img=listViewItem.findViewById(R.id.imageView);
        TextView titre=listViewItem.findViewById(R.id.titre);
        TextView des=listViewItem.findViewById(R.id.descri);

        titre.setText(news.get(position).getTitle());
        des.setText(news.get(position).getDescription());

        Runnable thread=new Runnable() {
            @Override
            public void run() {

                try {
                    Log.i("info",news.get(position).getUrlToImage().toString());
                    URL url=news.get(position).getUrlToImage();
                    Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
                    img.setImageBitmap(bitmap);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };

        Thread t=new Thread(thread);
        t.start();






        /*
        try {
            URL url=news.get(position).getUrlToImage();
            Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
            img.setImageBitmap(bitmap);
        } catch (Exception e) {
            e.printStackTrace();
        }

         */


        return listViewItem;
    }
}
