import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_project/page/about.dart';
import 'package:self_project/page/home.dart';

void main() {
  runApp( MyApp());
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
        "/about":(context)=>About(),
      },
    );
  }

}
