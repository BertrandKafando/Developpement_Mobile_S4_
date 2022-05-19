part of 'contact_bloc.dart';

abstract class ContactEvent  {
  const ContactEvent();
}

class LoadAllContacts extends ContactEvent{}

class LoadBDDCContactsEvent extends ContactEvent{}

class  LoadGLSIDContactsEvent extends ContactEvent{
}

class DeleteContactEvent extends ContactEvent{
  int index;
  DeleteContactEvent(this.index);
}