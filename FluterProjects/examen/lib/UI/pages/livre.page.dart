import 'package:flutter/material.dart';

import '../widgets/livres/livreslist.dart';
import '../widgets/livres/recherche.dart';

class Livre extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Livres"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
        children: [
          LivreSearch(),
          ListLivre()
        ],
        ),
      ),
    );

  }
  
}