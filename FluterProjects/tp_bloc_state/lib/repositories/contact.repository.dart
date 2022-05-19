
import 'dart:math';

import 'package:tp_bloc_state/model/contact.model.dart';

class ContactRepository{
  //contient des fonctions /methodes à utilisé dans bloc
  List<Contact> contacts=[
     Contact(id: 1, name: "ahmed", group: "BDDC", profile: "AH"),
     Contact(id: 2, name: "ahmed", group: "BDDC", profile: "AH"),
     Contact(id: 3, name: "bertrand", group: "GLSID", profile: "BE"),
    Contact(id: 4, name: "bertrand", group: "BDDC", profile: "BE"),
    Contact(id: 5, name: "omar", group: "GLSID", profile: "OM"),
    Contact(id: 6, name: "cecile", group: "GLSID", profile: "CE")
  ];

  Future<List<Contact>> getallContacts() async{
    var future=await Future.delayed(Duration(seconds: 1)); //attendre 1 seconde
    int rand=new Random().nextInt(10);
    if(rand>2){
      return contacts;
    }
    else{
      throw Exception( "Erreur de chargements");
    }

  }

  Future<void> deleteContact(int index) async{
    await Future.delayed(Duration(seconds: 1));
    print(index);
    await this.contacts.removeAt(index);
  }



 Future< List<Contact>> getcontactByGroup( String group) async{
    var future=await Future.delayed(Duration(seconds: 1));
    int rand=new Random().nextInt(10);
    if(rand>2){
      return contacts.where((element) => element.group==group).toList();
    }
    else{
      throw Exception( "Erreur de chargements");
    }

  }
}