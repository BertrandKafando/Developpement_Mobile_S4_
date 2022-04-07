


import 'package:flutter/material.dart';
import 'package:tp3_drawerapi/drawer/widgets.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),


    );
  }

}