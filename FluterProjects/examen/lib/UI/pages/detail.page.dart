

import 'package:flutter/material.dart';

import '../../Model/livre.model.dart';

class LivreDetail extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  Livre  livre = ModalRoute.of(context)?.settings.arguments as Livre;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(livre.titre) ,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        alignment: Alignment.center,
        child:  Column(
          children: [
            Text(livre.titre),
            Text(livre.auteur),
            SizedBox(height: 50,),
            Row(
              children: [
                Text("publié le :"+ livre.anne_publication.year.toString()),
                SizedBox(width: 80,),
                Text("Exemplaires"+livre.nb_exemplaires.toString())
              ],
            ),
            SizedBox(height: 50,),
            Text(livre.isbn)

          ],
          
        ),
          foregroundDecoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius:BorderRadius.all(Radius.zero)
          ),
          color:  (Colors.blueGrey[50])
      ),
    );

  }
  
}