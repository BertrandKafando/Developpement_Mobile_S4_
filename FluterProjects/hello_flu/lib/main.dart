import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) { //retourne le rendu
    // TODO: implement build
   return MaterialApp(
     //page d'accueil
     home:Scaffold(
      appBar: AppBar(
        title: Text("hello flutter"),
      ),
      body:  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        //liste des elements
        children: [
          Text("HELLO BDCC",style: TextStyle(fontSize: 30, color: Colors.black),),
          MaterialButton(
              child: Text("click here"),
              onPressed: (){
                  print("Ok");
                  },
               color: Colors.blue,

          )
        ],
      ),
      ),
     ),
   );

  }
}
