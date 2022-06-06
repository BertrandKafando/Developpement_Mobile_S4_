import 'package:examen/bloc/adherents/adherent_event.dart';

import 'livre_bloc.dart';
import 'livre_state.dart';

abstract class LivreEvent extends Event{}
class  LoadLivres extends LivreEvent{
}

class  LoadLivresByKeyword extends LivreEvent{
  String keyword;

  LoadLivresByKeyword({required this.keyword});
}
class DeleteLivreEvent extends LivreEvent{
  int index;
  DeleteLivreEvent({required this.index});
}

