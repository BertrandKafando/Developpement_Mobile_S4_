import 'package:examen/Model/livre.model.dart';
enum  Requested{Loaded,Loading,Error,NONE}
 class LivreState {
  List<Livre>livres;
   Requested requested;
   String errorMessage;

  LivreState({required this.livres, required this.requested, required this.errorMessage});
}


