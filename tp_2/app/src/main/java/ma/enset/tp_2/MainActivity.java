package ma.enset.tp_2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TableLayout;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private EditText saisie;
    private Button plus;private  Button moins; private  Button div;private Button mul;
    private Button un; private Button deux;private Button trois; private  Button quatre;
    private  Button cinq;private  Button six; private Button sept; private  Button huit;
    private  Button vider; private  Button neuf; private Button zero; private  Button egal;
    private TextView operation;
    private  String text="";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //decla
         operation=findViewById(R.id.operation);
         saisie=findViewById(R.id.saisie);
         plus=findViewById(R.id.addition);moins=findViewById(R.id.sous);div=findViewById(R.id.div);mul=findViewById(R.id.mul);
         un=findViewById(R.id.un); deux=findViewById(R.id.deux); trois=findViewById(R.id.trois); quatre=findViewById(R.id.quatre);
         cinq=findViewById(R.id.cinq);six=findViewById(R.id.six);sept=findViewById(R.id.sept);huit=findViewById(R.id.huit);
         vider=findViewById(R.id.vider); neuf=findViewById(R.id.neuf); zero=findViewById(R.id.zero);egal=findViewById(R.id.egal);
         un.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {

                 saisie.setText(saisie.getText().toString()+un.getText());


             }
         });
         deux.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {
                 saisie.setText(saisie.getText().toString()+deux.getText());


             }
         });
        trois.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+trois.getText());


            }
        });
        quatre.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+quatre.getText());


            }
        });
        cinq.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+cinq.getText());


            }
        });
        six.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+six.getText());


            }
        });
        sept.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+sept.getText());


            }
        });
        huit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+huit.getText());


            }
        });
        neuf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+neuf.getText());


            }
        });
        zero.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText(saisie.getText().toString()+zero.getText());


            }
        });
        vider.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                saisie.setText("");
                text="";
                operation.setText("");
            }
        });

         egal.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {
                 if(saisie.getText().toString()==null){
                     String txt=text;
                     saisie.setText(operation(txt));operation.setText(txt+"=");
                 }else{
                     String txt=text+saisie.getText().toString();
                     saisie.setText(operation(txt));operation.setText(txt+"=");
                 }


             }
         });

         plus.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {
                 try {
                     Double.parseDouble(saisie.getText().toString());
                     saisie.setText(saisie.getText().toString()+plus.getText());
                     text=saisie.getText().toString();
                     saisie.setText("0"); operation.setText(text);
                 }catch(NumberFormatException e) {
                     saisie.setText(saisie.getText().toString()+plus.getText());
                     text="0"+plus.getText();
                     saisie.setText(""); operation.setText(text);
                 }
             }



         });
        moins.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                try {
                    Double.parseDouble(saisie.getText().toString());
                    saisie.setText(saisie.getText().toString()+moins.getText());
                    text=saisie.getText().toString();
                    saisie.setText("0"); operation.setText(text);
                }catch(NumberFormatException e) {
                    saisie.setText(saisie.getText().toString()+moins.getText());
                    text="0"+moins.getText();
                    saisie.setText(""); operation.setText(text);
                }
            }
        });
        div.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    Double.parseDouble(saisie.getText().toString());
                    saisie.setText(saisie.getText().toString()+div.getText());
                    text=saisie.getText().toString();
                    saisie.setText("0"); operation.setText(text);
                }catch(NumberFormatException e) {
                    saisie.setText(saisie.getText().toString()+div.getText());
                    text="0"+div.getText();
                    saisie.setText(""); operation.setText(text);
                }
            }
        });
        mul.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                try {
                    Double.parseDouble(saisie.getText().toString());
                    saisie.setText(saisie.getText().toString()+mul.getText());
                    text=saisie.getText().toString();
                    saisie.setText("0"); operation.setText(text);
                }catch(NumberFormatException e) {
                    saisie.setText(saisie.getText().toString()+mul.getText());
                    text="0"+mul.getText();
                    saisie.setText(""); operation.setText(text);
                }
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