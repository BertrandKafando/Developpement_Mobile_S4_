part of 'contact_bloc.dart';

 class ContactState extends Equatable {
   final List<String> data ;
   final int nbr;
 const ContactState(  { required this.data,required this.nbr});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ContactInitial extends ContactState {
  ContactInitial() : super(data: [],nbr: 0);
  @override
  List<Object> get props => [];
}
