package ma.enset.tp_4_basicactivity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import ma.enset.tp_4_basicactivity.databinding.FragmentFirstBinding;

public class FirstFragment extends Fragment {

private FragmentFirstBinding binding;
private Fragment ffirst=FirstFragment.this;

    public Fragment getFfirst() {
        return ffirst;
    }

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

      binding = FragmentFirstBinding.inflate(inflater, container, false);
      return binding.getRoot();

    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        List<String> data=new ArrayList<>();
        ListView liste=view.findViewById(R.id.listview);
         Button buttonLoad=view.findViewById(R.id.buttonload);
        ArrayAdapter adapter=new ArrayAdapter(getContext(),android.R.layout.simple_list_item_1,data);

        liste.setAdapter(adapter);
        try {
            FileInputStream fis= getContext().openFileInput("text.txt");
            InputStreamReader isr=new InputStreamReader(fis);
            BufferedReader br=new BufferedReader(isr);
            StringBuilder text=new StringBuilder();
            String ligne="";
            while ((ligne=br.readLine())!=null){
                String tab[]=ligne.split("-");
                String ab="Nom      :"+tab[0]+"\n"+"Prenom :"+tab[1]+"\n"+"Age       :"+tab[2];
                data.add(ab);
                System.out.println(ab);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        buttonLoad.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    FileInputStream fis= getContext().openFileInput("text.txt");
                    InputStreamReader isr=new InputStreamReader(fis);
                    BufferedReader br=new BufferedReader(isr);
                    StringBuilder text=new StringBuilder();
                    String ligne="";
                    data.clear();
                    while ((ligne=br.readLine())!=null){
                        String tab[]=ligne.split("-");
                        String ab="Nom      :"+tab[0]+"\n"+"Prenom :"+tab[1]+"\n"+"Age       :"+tab[2];
                        data.add(ab);
                        System.out.println(ab);
                        adapter.notifyDataSetChanged();
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });


        binding.buttonFirst.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                NavHostFragment.findNavController(FirstFragment.this)
                        .navigate(R.id.action_FirstFragment_to_SecondFragment);
            }
        });
    }

@Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}