package ma.enset.tp_1android;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    private Button button;
    private EditText saisie;
    private ListView listView;
    private List<String> listhistorique=new ArrayList<>();
    private ArrayAdapter<String> model;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //recuperer les elements
        button=findViewById(R.id.button);
        saisie=findViewById(R.id.saisie);
        listView=findViewById(R.id.listview);
        model=new ArrayAdapter<>(this, android.R.layout.simple_list_item_1,listhistorique);
        listView.setAdapter(model);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String text=saisie.getText().toString();

                listhistorique.add(text + "= "+ operation(text));
                System.out.println(operation(text));

            }
        });

    }
    private String operation(String op) {


        if (op.contains("+")) {
            String[] parse = op.split("\\+");
            double res = (Double.parseDouble(parse[0]) + Double.parseDouble(parse[1]));
            return res + "";

        }
        if (op.contains("-")) {
            String[] parse = op.split("-");
            double res = (Double.parseDouble(parse[0]) - Double.parseDouble(parse[1]));
            return res + "";
        }
        if (op.contains("/")) {
            String[] parse = op.split("/");
            double res = (Double.parseDouble(parse[0]) / Double.parseDouble(parse[1]));
            return res + "";
        }
        if (op.contains("*")) {
            String[] parse = op.split("\\*");
            double res = (Double.parseDouble(parse[0]) * Double.parseDouble(parse[1]));
            return res + "";
        }
        return "erreur";

    }


}