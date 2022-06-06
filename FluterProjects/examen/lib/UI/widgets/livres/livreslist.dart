import 'package:examen/UI/pages/detail.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/livres/livre_bloc.dart';
import '../../../bloc/livres/livre_event.dart';
import '../../../bloc/livres/livre_state.dart';

class ListLivre extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  BlocBuilder<LivreBloc, LivreState>(builder: (context, state) {
     if(state.requested == Requested.Loading){
       return Center(child: CircularProgressIndicator());
     }
     else if (state.requested==Requested.Loaded){
       return Expanded(
         child: ListView.builder(
             itemBuilder: (context, index) {
               return ListTile(

                   onTap: (){
                     Navigator.pushNamed(context, "/detail",arguments: state.livres[index]);
                   },
                 /*  leading: CircleAvatar(
                       child: Text("${state.livres[index].titre}"
                           .substring(0, 1))),*/
                   title:  Container(
                     child:   Column(
                       children: [
                         Text("${state.livres[index].titre}" , style: TextStyle(color: Colors.white),),
                         Text("Prix: "+"${state.livres[index].prix}",style: TextStyle(color: Colors.white),),
                          Row(
                            children: [
                              Text("Publié le :"+"${state.livres[index].anne_publication.year}" ,style: TextStyle(color: Colors.white),),
                              SizedBox(width: 5,),
                              Text("par: "+"${state.livres[index].auteur}",style: TextStyle(color: Colors.white),),
                            ],
                          )

                       ],

                     ),
                     foregroundDecoration: BoxDecoration(
                         border: Border.all(color: Colors.grey),
                         borderRadius:BorderRadius.all(Radius.circular(10))
                     ),
                     color:  (Colors.green)
                   ),

                   trailing: IconButton(
                     icon: Icon(Icons.delete),
                     onPressed: () {
                       context.read<LivreBloc>().add(DeleteLivreEvent(index: index));
                     },
                   )

               ) ;

             },
             itemCount: state.livres.length),
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