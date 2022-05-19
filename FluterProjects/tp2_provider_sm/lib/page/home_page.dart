
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/wid_drawer.dart';

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