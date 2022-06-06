import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/adherents/adherent_bloc.dart';
import '../../../bloc/adherents/adherent_event.dart';
import '../../../bloc/adherents/adherent_state.dart';
import '../../../bloc/livres/livre_state.dart';

class ListAdherents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<AdherentBloc, AdherentState>(builder: (context, state) {
     if(state.requested == Requested.Loading){
       return Center(child: CircularProgressIndicator());
     }
     else if (state.requested==Requested.Loaded){
       return Expanded(
         child: ListView.builder(
             itemBuilder: (context, index) {
               return ListTile(
                   onTap: (){
                     // context.read<LiBloc>().add(ContactMessage(contact: state.contacts[index]));
                     // Navigator.pushNamed(context, "/message",arguments: state.contacts[index]);
                   },
                   leading: CircleAvatar(
                       child: Text("${state.adherents[index].nom}"
                           .substring(0, 1))),
                   title: Text("${state.adherents[index].nom}"+" "+"${state.adherents[index].prenom}"),
                   trailing: IconButton(
                     icon: Icon(Icons.delete),
                     onPressed: () {
                       context.read<AdherentBloc>().add(DeleteAdherentEvent(index: index));
                     },
                   )) ;

             },
             itemCount: state.adherents.length),
       );
     }
     else if (state.requested == Requested.Error) {
       return Center(
         child: Column(
           // mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text("${state.errorMessage}"),
             ElevatedButton(
                 onPressed: () => {

                 },
                 child: Text("reload"))
           ],
         ),
       );
     }
     else {
       return Center(
         child: Text("Nothing"),
       );
     }

   });
  }

}