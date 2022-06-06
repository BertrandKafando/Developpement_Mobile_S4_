
import 'package:examen/bloc/livres/livre_bloc.dart';

import '../livres/livre_event.dart';

abstract class Event {}
abstract class AdherentEvent extends Event   {}

class  LoadAdhrentEvent extends AdherentEvent{

}

class DeleteAdherentEvent extends AdherentEvent{
  int index;
  DeleteAdherentEvent({required this.index});
}

class NullEvent extends AdherentEvent{

}


