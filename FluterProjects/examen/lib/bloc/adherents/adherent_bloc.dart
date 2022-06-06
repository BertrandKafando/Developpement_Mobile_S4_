import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examen/Model/adherent.model.dart';
import 'package:examen/repositories/AdherentRepository.rep.dart';
import '../livres/livre_state.dart';
import 'adherent_event.dart';
import 'adherent_state.dart';


class AdherentBloc extends Bloc<AdherentEvent, AdherentState> {
  AdherentRepository adherentRepository;
  AdherentBloc({required AdherentState adherentState,required this.adherentRepository}) : super(adherentState) {
    on<AdherentEvent>((event, emit) async {
      if (event is LoadAdhrentEvent) {
        try {
       emit(AdherentState(adherents: [], errorMessage: '', requested: Requested.Loading));
          List<Adherent> adherents = await adherentRepository.allAdherents();
          emit(AdherentState(adherents: adherents, errorMessage: '', requested: Requested.Loaded) );
        } catch (e) {
          emit(AdherentState(adherents: [], errorMessage: e.toString(), requested: Requested.Error));
        }
      }
      else if (event is  DeleteAdherentEvent ){
        adherentRepository.deleteAdherent(event.index);
        List<Adherent> adherents = await adherentRepository.allAdherents();
        emit(AdherentState(adherents: adherents, errorMessage: '', requested: Requested.Loaded) );
      }
    });
  }
}
