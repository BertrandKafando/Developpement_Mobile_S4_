
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc_state/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';

class ButtonBarch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () =>
          {context.read<ContactBloc>().add(LoadAllContacts())},
          child: Text("ALL"),
           style: ElevatedButton.styleFrom(primary:
           (context.read<ContactBloc>().lastEvent is LoadAllContacts) ?Colors.blue:Colors.deepOrange),
        ),
        ElevatedButton(
            onPressed: () => {
              context
                  .read<ContactBloc>()
                  .add(LoadBDDCContactsEvent())
            },
            child: Text("BDDC"),
          style: ElevatedButton.styleFrom(primary:
          (context.read<ContactBloc>().lastEvent is LoadBDDCContactsEvent) ?Colors.blue:Colors.deepOrange),

        ),

        ElevatedButton(
            onPressed: () => {
              context
                  .read<ContactBloc>()
                  .add(LoadGLSIDContactsEvent())
            },
            child: Text("GLSID"),
          style: ElevatedButton.styleFrom(primary:
          (context.read<ContactBloc>().lastEvent is LoadGLSIDContactsEvent) ?Colors.blue:Colors.deepOrange),
        ),
      ],
    );

  }

}