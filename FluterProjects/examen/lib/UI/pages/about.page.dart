import 'package:flutter/material.dart';

class   About extends StatelessWidget{
  String about="Ouverte en 1977, en même temps que le Centre Pompidou dont elle est l’une des composantes, la Bibliothèque publique d’information (Bpi) est une bibliothèque nationale dépendant du Ministère de la Culture et de la Communication. Elle est ouverte à tous et sans formalités, sur 10.000 m² (3 niveaux), 62 heures par semaine, 6 jours sur 7 (près d’1,4 M de visites en 2017, soit 4.500 entrées par jour).Sa vocation est de rassembler et de donner un accès libre et gratuit à une offre documentaire pluridisciplinaire, numérique et physique, régulièrement mise à jour. Particulièrement orientée vers l’actualité, elle mobilise des ressources suffisamment riches pour permettre une bonne appréhension et une mise en perspective du monde qui nous entoure."
      "Disposant de plus de 2.000 places de lecture et de travail individuelles, elle propose également de nombreuses manifestations culturelles ainsi que des activités de médiation faisant appel à des formes d’apprentissage individuelles ou collectives. Elle s’inscrit dans la politique mise en place au niveau national pour l’éducation artistique et culturelle (EAC) à destination des jeunes, mais aussi en matière d’éducation aux médias, avec une offre autour de la notion d’info-intox.";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("  About"),
      ),
      body:  Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image(image: AssetImage("image/about.png")),
            SizedBox(height: 30,),
            Text( "Infos", style: TextStyle(
                fontSize: 40
            ),),

            Text(about,style: TextStyle(
                fontSize: 15

            ),),

          ],
        ),
      ),
    );
  }

}