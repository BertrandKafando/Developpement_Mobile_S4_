package ma.enset.apigithub.model;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import ma.enset.apigithub.R;
//creation d'un layout
public class UsersListviewAdapter extends ArrayAdapter<GitUser> {  //extend adapter
    private List<GitUser>users;
    private int resource;

    public UsersListviewAdapter(@NonNull Context context, int resource, List<GitUser>data) {
        super(context, resource,data);
        this.users=data;
        this.resource=resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View listViewItem=convertView;
        //recup du layout des objets
        if(listViewItem==null){
            //contruire la vue  en fonction des elements du fihier xml==onsetview de oncreate
            listViewItem= LayoutInflater.from(getContext()).inflate(resource,parent,false);
        }
        ImageView imageView=listViewItem.findViewById(R.id.imageView);
        TextView txtlog=listViewItem.findViewById(R.id.login);
        TextView txtscor=listViewItem.findViewById(R.id.score);

        txtlog.setText(users.get(position).login);
        //attention text
        txtscor.setText(String.valueOf(users.get(position).score));

        //traitement thread
        try {
            URL url=new URL(users.get(position).avatarUrl);
            Bitmap bitmap= BitmapFactory.decodeStream(url.openStream());
            imageView.setImageBitmap(bitmap);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listViewItem;
    }
}
