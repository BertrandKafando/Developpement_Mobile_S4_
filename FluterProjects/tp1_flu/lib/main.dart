import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class Produit{
  String desc;
  double price;
  Produit(this.desc,this.price);
  String getdesc(){
    return desc;
  }
  String getprice(){
    return price.toString();
  }
  @override
  String toString() {
    // TODO: implement toString
    return desc + price.toString();
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controllerName = TextEditingController();

  TextEditingController controllerPrice = TextEditingController();

  List<dynamic>produits=[Produit("DellPC", 20000),Produit("MacPC", 30000) ];

  void dateItems(int index){
    produits.removeAt(index);
  }

  void addItem(){
    Produit p=Produit(controllerName.text, double.parse(controllerPrice.text));
    produits.add(p);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("E-store"),),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
           children: [
             Text("WELCOME",
                 style: TextStyle(fontSize: 30, color: Colors.blueAccent),),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
               child:  TextFormField(
                 controller: controllerName,
                 decoration: InputDecoration(
                   hintText: 'Enter a  product name',
                   border: OutlineInputBorder(),
                 ),
               ),
            ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
               child:  TextFormField(
                 controller: controllerPrice,
                 decoration: InputDecoration(
                   hintText: 'Enter a  price',
                   border: OutlineInputBorder(),
                 ),
               ),

             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
               child: MaterialButton(
                 color: Colors.blueAccent,
                 shape: CircleBorder(),
                 child: Icon(Icons.add,),
                 onPressed: (){
                   setState(() {
                     addItem();
                   });
                 },
               ),
             ),

             Expanded(child:ListView.builder(
                 itemCount: produits.length,
                 itemBuilder:(BuildContext context,int index){
                   print(index);
                   return Card(
                     child: ListTile(
                       leading: CircleAvatar(child: Text(produits[index].getdesc().substring(0,1))),
                       trailing: IconButton(
                           icon:Icon(Icons.delete),
                           onPressed: (){
                             setState(() {
                               dateItems(index);
                             });
                           }),
                       title: Text("${produits[index].getdesc()}"),
                       subtitle:(Text("${produits[index].getprice()}")),
                     ),);
                 }
             )
             )
           ],
          ),
        ),
      ),
    );
  }
}
