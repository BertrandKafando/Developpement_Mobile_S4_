part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class addContact extends ContactEvent{
 late final String txt;
 addContact(this.txt);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class deleteContact extends ContactEvent{
  late int id;
  deleteContact(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
