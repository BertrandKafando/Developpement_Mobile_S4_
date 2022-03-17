package ma.enset.tp_4_basicactivity;

import static android.content.Context.MODE_PRIVATE;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import java.io.FileOutputStream;
import java.io.PrintWriter;

import ma.enset.tp_4_basicactivity.databinding.FragmentSecondBinding;

public class SecondFragment extends Fragment {

private FragmentSecondBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

      binding = FragmentSecondBinding.inflate(inflater, container, false);

      return binding.getRoot();

    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        EditText nom=view.findViewById(R.id.editTextTextPersonName);
        Button buttonSave=view.findViewById(R.id.buttonSave);
        Button buttonClear=view.findViewById(R.id.buttonClear);
        EditText editTextPrenom=view.findViewById(R.id.editTextTextPre323Name2);
        EditText editTextAge=view.findViewById(R.id.editTextTextAge);

        /*
        buttonSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences sh= getContext().getSharedPreferences("tpsharedprererences",getContext().MODE_PRIVATE);
                SharedPreferences.Editor editor=sh.edit();
                editor.putString("nom",nom.getText().toString());
                editor.putString("prenom",editTextPrenom.getText().toString());
                editor.putInt("age",Integer.parseInt(editTextAge.getText().toString()));
                editor.commit();

                Toast.makeText(view.getContext(),"Les données sont bien enregistrées !!",Toast.LENGTH_SHORT).show();
            }
        });

         */

        buttonSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    FileOutputStream fos= getContext().openFileOutput("text.txt", Context.MODE_APPEND);
                    PrintWriter pw=new PrintWriter(fos,true );

                    pw.println(nom.getText().toString()+"-"+ editTextPrenom.getText().toString()+"-"+editTextAge.getText().toString());
                    pw.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });

        buttonClear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                nom.setText("");
                editTextAge.setText("");
                editTextPrenom.setText("");
            }
        });

        binding.buttonSecond.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                NavHostFragment.findNavController(SecondFragment.this)
                        .navigate(R.id.action_SecondFragment_to_FirstFragment);
            }
        });
    }

@Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}