import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_provider_sm/provider_state/Contact_provider.dart';

class Contact extends StatelessWidget{
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("***** Context *****");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ContactState>(
          builder: (context,contactstate,child){
            return Text("Contacts  ${contactstate.compte}");
          },
        ),

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
                      //data.add(textController.text);
                      Provider.of<ContactState>(context,listen: false).addItem(textController.text);

                    },
                    icon: Icon(Icons.add_circle))
              ],
            ),

            Expanded(
              child:Consumer<ContactState>(
                builder:(context,listValuesSate,child){
                  print("***** Consumer *****");
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listValuesSate.data.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                          leading: CircleAvatar(child: Text("${listValuesSate.data[index]}".substring(0, 1))),
                          title: Text("${listValuesSate.data[index]}"),
                          trailing: IconButton(icon: Icon(Icons.delete),
                            onPressed: (){
                              Provider.of<ContactState>(context,listen: false).delete(index);
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