import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {


      on<addContact>((event, emit) => {
        state.data.add(event.txt),
      emit(ContactState(data: state.data, nbr: state.nbr+1))
      });
      on<deleteContact>((event, emit) => {
         state.data.removeAt(event.id),
        emit(ContactState(data: state.data, nbr: state.nbr-1))
      });
  }
}
