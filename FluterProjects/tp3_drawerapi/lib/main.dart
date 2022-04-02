import 'package:flutter/material.dart';
import 'package:tp3_drawerapi/pages/Contact.dart';
import 'package:tp3_drawerapi/pages/Home.dart';
import 'package:tp3_drawerapi/pages/newsapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,

      ),
     routes: {
       "/":(context)=>Home(),
       "/contacts":(context)=>Contact(),
       "/news":(context)=>Githusers(),
     },
   );
}
}

