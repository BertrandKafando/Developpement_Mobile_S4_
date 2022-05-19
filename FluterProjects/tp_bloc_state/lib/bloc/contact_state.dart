part of 'contact_bloc.dart';

enum  Requested{Loaded,Loading,Error,NONE}
 class ContactState  {
  List<Contact> contacts;
  Requested requested;
  String errorMessage;
  ContactState({required this.requested, required this.contacts,required this.errorMessage});


}

class ContactInitial extends ContactState {
  ContactInitial({required Requested requested, required List<Contact> contacts, required String errorMessage}) : super(requested: requested, contacts: contacts, errorMessage: errorMessage);
}
