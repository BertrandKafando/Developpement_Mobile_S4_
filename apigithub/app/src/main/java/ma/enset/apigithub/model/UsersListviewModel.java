package ma.enset.apigithub.model;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

import ma.enset.apigithub.R;

public class UsersListviewModel extends ArrayAdapter<GitUser> {
    private List<GitUser>users;
    private int resource;

    public UsersListviewModel(@NonNull Context context, int resource,List<GitUser>data) {
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
            listViewItem= LayoutInflater.from(getContext()).inflate(resource,parent,false);
        }
        ImageView imageView=listViewItem.findViewById(R.id.imageView);
        TextView txtlog=listViewItem.findViewById(R.id.login);
        TextView txtscor=listViewItem.findViewById(R.id.score);

        txtlog.setText(users.get(position).login);
        //attention text
        txtscor.setText(String.valueOf(users.get(position).score));

        return listViewItem;
    }
}
