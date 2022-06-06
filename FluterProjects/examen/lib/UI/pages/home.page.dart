import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("  Biblio App"),
     ),
     body:  Container(
          child: Column(
            children: [
              Image(image: AssetImage("image/bpi-livre.jpg")),
              SizedBox(height: 30,),
              Text( "Nos actualités numériques", style: TextStyle(
                fontSize: 30
              ),),

              Text("Retrouvez sur cette page les dernières actualités numériques "
                  "de la Bpi : nouvelles ressources numériques,"
                  " sélections documentaires en ligne, recommandations, tutoriels…",style: TextStyle(
                fontSize: 15

              ),),

            ],
          ),
     ),
     drawer: AppDrawer(),
   );
  }
  
}