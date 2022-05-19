import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tp_bloc_state/model/contact.model.dart';
import 'package:tp_bloc_state/repositories/contact.repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  //declaration dans le constructeur  ENTRE ->event sortie des states
  ContactRepository contactRepository;
  late ContactEvent lastEvent = LoadAllContacts();
  ContactBloc(ContactState contactState, this.contactRepository)
      : super(ContactInitial(
            contacts: [], errorMessage: '', requested: Requested.Loading)) {
    on<ContactEvent>((event, emit) async {
      lastEvent = event;
      // TODO: implement event handler
      if (event is LoadAllContacts) {
        try {
          emit(ContactState(
              contacts: [], errorMessage: '', requested: Requested.Loading));
          List<Contact> contacts = await contactRepository.getallContacts();
          emit(ContactState(
              contacts: contacts,
              errorMessage: '',
              requested: Requested.Loaded));
        } catch (e) {
          emit(ContactState(
              contacts: [],
              errorMessage: e.toString(),
              requested: Requested.Error));
        }
      } else if (event is LoadBDDCContactsEvent) {
        try {
          emit(ContactState(
              contacts: [], errorMessage: '', requested: Requested.Loading));
          List<Contact> contacts =
              await contactRepository.getcontactByGroup("BDDC");
          emit(ContactState(
              contacts: contacts,
              errorMessage: '',
              requested: Requested.Loaded));
        } catch (e) {
          emit(ContactState(
              contacts: [],
              errorMessage: e.toString(),
              requested: Requested.Error));
        }
      } else if (event is LoadGLSIDContactsEvent) {
        try {
          emit(ContactState(
              contacts: [], errorMessage: '', requested: Requested.Loading));
          List<Contact> contacts =
              await contactRepository.getcontactByGroup("GLSID");
          emit(ContactState(
              contacts: contacts,
              errorMessage: '',
              requested: Requested.Loaded));
        } catch (e) {
          emit(ContactState(
              contacts: [],
              errorMessage: e.toString(),
              requested: Requested.Error));
        }
      } else if (event is DeleteContactEvent) {
        contactRepository.deleteContact(event.index);
        print('ok');
      }
    });
  }
}
