
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3_drawerapi/Provider/providerscafold_contact.dart';

class ContactProvider extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ListValuesState())],
      child: ContactValue(),
    );
  }

}