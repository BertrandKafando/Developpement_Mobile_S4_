import 'dart:math';

import 'package:examen/Model/livre.model.dart';

class LivresRepository {
  List<Livre>livres=[
    Livre(1, "isbn1", "Belle amie", "Guy de maupassant", DateTime.now(), 20, 100),
    Livre(2, "isbn2", "Le rouge et le noir", "Voltaire", DateTime.now(), 10, 100),
    Livre(3, "isbn3", "Candide", "Voltaire", DateTime.now(), 10, 100),
    Livre(4, "isbn4", "Le Chapeau du cehf", "Voltaire", DateTime.now(), 10, 100),
    Livre(5, "isbn5", "Le rouge et le noir", "Voltaire", DateTime.now(), 10, 100),
  ];

  Future<List<Livre>> allLivres() async {
    var future =
    await Future.delayed(Duration(seconds: 1)); //attendre 1 seconde
   // int rand = new Random().nextInt(10);
   // if (rand > 2) {
      return livres;
 /*   } else {
      throw Exception("Erreur de chargements");
    }*/
  }

  Future<List<Livre>> findLivres( String keyword) async {
    var future =
    await Future.delayed(Duration(seconds: 1)); //attendre 1 seconde
    // int rand = new Random().nextInt(10);
    // if (rand > 2) {
    List<Livre> listLivres=[];
    livres.forEach((livre) {
      if(livre.titre.contains(keyword)){
        listLivres.add(livre);
      }
    });

    return listLivres;
    /*   } else {
      throw Exception("Erreur de chargements");
    }*/
  }


  Future<void> deleteLivre(int index) async {
    await Future.delayed(Duration(seconds: 1));
    print(index);
    await this.livres.removeAt(index);
  }


}