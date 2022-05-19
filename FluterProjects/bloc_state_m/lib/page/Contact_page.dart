
import 'package:bloc_state_m/bloc/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactValue extends StatelessWidget{
  TextEditingController textController = new TextEditingController();

  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    print("***** Context *****");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:BlocBuilder<ContactBloc,ContactState>(
            builder: (context,state){
              return Text("Value => ${state.nbr}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18));
            }),
        ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.contacts),
                          hintText: "Entrez un nom",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      controller: textController,
                    )),
                IconButton(
                    onPressed: () {
                      context.read<ContactBloc>().add(addContact(textController.text));
                    },
                    icon: Icon(Icons.add_circle))
              ],
            ),

            Expanded(
              child:BlocBuilder<ContactBloc,ContactState>(
                builder:(context,state){
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                          leading: CircleAvatar(child: Text("${state.data[index]}".substring(0, 1))),
                          title: Text("${state.data[index]}"),
                          trailing: IconButton(icon: Icon(Icons.delete),
                            onPressed: (){
                              context.read<ContactBloc>().add(deleteContact(index));
                            },)
                      );
                    }),
                  );
                },

              ),
            )
          ],
        ),
      ),
    );
  }

}