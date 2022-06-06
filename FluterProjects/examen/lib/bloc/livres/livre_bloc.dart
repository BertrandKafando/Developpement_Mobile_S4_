import 'package:bloc/bloc.dart';
import 'package:examen/repositories/livresRepository.rep.dart';
import '../../Model/livre.model.dart';
import 'livre_event.dart';
import 'livre_state.dart';

class LivreBloc extends Bloc<LivreEvent, LivreState> {
  LivresRepository livresRepository;
  LivreBloc({required LivreState livreState, required this.livresRepository})
      : super(livreState) {
    on<LivreEvent>((event, emit) async {
      if (event is LoadLivres) {
        try {
          emit(LivreState(
              livres: [], requested: Requested.Loading, errorMessage: ''));
          List<Livre> livres = await livresRepository.allLivres();
          emit(LivreState(
              livres: livres, requested: Requested.Loaded, errorMessage: ''));
        } catch (e) {
          emit(LivreState(
              livres: [], requested: Requested.Error, errorMessage: e.toString()));
        }
      }
      else if(event is  LoadLivresByKeyword){
        try {
          emit(LivreState(
              livres: [], requested: Requested.Loading, errorMessage: ''));
          List<Livre> livres = await livresRepository.findLivres(event.keyword);
          emit(LivreState(
              livres: livres, requested: Requested.Loaded, errorMessage: ''));
        } catch (e) {
          emit(LivreState(
              livres: [], requested: Requested.Error, errorMessage: e.toString()));
        }
        

      }
      else if (event is DeleteLivreEvent){
        livresRepository.deleteLivre(event.index);
        List<Livre> livres = await livresRepository.allLivres();
        emit(LivreState(
            livres: livres, requested: Requested.Loaded, errorMessage: ''));
        print('ok');
      }
      
    });
  }
}
