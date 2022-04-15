import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactValue extends StatelessWidget{
  TextEditingController textController = new TextEditingController();

  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    print("***** Context *****");
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Contacts"),

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
                     Provider.of<ListValuesState>(context,listen: false).addItem(textController.text);

                   },
                   icon: Icon(Icons.add_circle))
             ],
           ),

           Expanded(
             child:Consumer<ListValuesState>(
               builder:(context,listValuesSate,chid){
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
                         Provider.of<ListValuesState>(context,listen: false).delete(index);
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
class ListValuesState extends ChangeNotifier{
  List<String> data = [];
  void addItem(value){
    data.add(value);
    notifyListeners();
  }
  void delete(value){
    data.removeAt(value);
    notifyListeners();
  }
}