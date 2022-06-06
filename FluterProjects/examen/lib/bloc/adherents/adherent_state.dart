
 import '../../Model/adherent.model.dart';
import '../livres/livre_state.dart';

class AdherentState {
   List<Adherent>adherents;
   Requested requested;
   String errorMessage;

   AdherentState({required this.adherents, required this.requested, required this.errorMessage});
}

