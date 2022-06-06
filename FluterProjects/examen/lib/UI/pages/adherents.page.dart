import 'package:flutter/material.dart';

import '../widgets/adherents/listAdherents.dart';

class Adherent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text("Adherents"),
     ),
     body: Container(
       padding: EdgeInsets.all(20),
       child: Column(
         children: [
           ListAdherents()
         ],
       ),
     ),
   );
  }

}