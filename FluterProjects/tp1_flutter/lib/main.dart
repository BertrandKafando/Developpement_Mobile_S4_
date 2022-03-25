import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> contacts=["Ahmed","Said"];

  TextEditingController controller=new TextEditingController();

  void deleteItem(int index){
    contacts.removeAt(index);
    contacts.forEach((e) {
      print(e);
    });
  }
void addItem(){
    contacts.add(controller.text);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("First App")),
        body: Padding(
          padding: EdgeInsets.all(20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text("Nom :",
                        style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
                    TextField(
                      controller: controller,
                      style: TextStyle(fontSize: 30,color: Colors.amber),
                    )
                  ,
                  MaterialButton(
                      color: Colors.blueAccent,
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          addItem();
                        });
                      }),
                  Expanded(child:ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder:(BuildContext context,int index){
                    print(index);
                    return Card(
                      child: ListTile(
                      leading: CircleAvatar(child: Text(contacts[index].substring(0,1))),
                      trailing: IconButton(
                          icon:Icon(Icons.delete),
                          onPressed: (){
                            setState(() {
                              deleteItem(index);
                            });
                          }),
                      title: Text("${contacts[index]}"),
                    ),);
                  }
                  ) )

              ]
             ),

        ) ,
      ),
    );
  }
}
