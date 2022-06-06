import 'package:examen/Model/adherent.model.dart';

class AdherentRepository{
  List<Adherent>adherents=[
    Adherent(1, "kafando", "bertrand", "kaf@gmail.com", "054744443"),
    Adherent(2, "kafando", "naoufal", "nf@gmail.com", "054744443"),
    Adherent(2, "kafando", "bertrand", "kaf@gmail.com", "054744443")
  ];

  Future<List<Adherent>> allAdherents() async {
    var future =
    await Future.delayed(Duration(seconds: 1)); //attendre 1 seconde
    // int rand = new Random().nextInt(10);
    // if (rand > 2) {
    return adherents;
    /*   } else {
      throw Exception("Erreur de chargements");
    }*/
  }

  Future<void> deleteAdherent(int index) async {
    await Future.delayed(Duration(seconds: 1));
    print(index);
    await this.adherents.removeAt(index);
  }
}