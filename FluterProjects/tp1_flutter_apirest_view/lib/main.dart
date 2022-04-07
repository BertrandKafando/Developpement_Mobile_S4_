import 'package:flutter/material.dart';
import 'package:tp3_drawerapi/pages/Contact.dart';
import 'package:tp3_drawerapi/pages/Home.dart';
import 'package:tp3_drawerapi/pages/covid.dart';
import 'package:tp3_drawerapi/pages/detail.dart';
import 'package:tp3_drawerapi/pages/gitusers.dart';
import 'package:tp3_drawerapi/pages/news_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(
       primarySwatch: Colors.blue,
       scaffoldBackgroundColor: Colors.white,
       visualDensity: VisualDensity.adaptivePlatformDensity,
     ),
     routes: {
       "/":(context)=>Home(),
       "/contacts":(context)=>Contact(),
       "/gitUsers":(context)=>Githusers(),
       "/covid":(context)=>CovidNews(),
       "/news":(context)=>News(),
       "/detail":(context)=>New(article: null,),
     },
   );
}
}

