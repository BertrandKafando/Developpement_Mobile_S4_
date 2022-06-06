import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/livres/livre_bloc.dart';
import '../../../bloc/livres/livre_event.dart';

class LivreSearch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController=TextEditingController();
   return  Container(
     alignment: Alignment.bottomCenter,
     child: Row(
       children: [
         Expanded(child: TextFormField(
           controller: textEditingController,
           decoration:InputDecoration(
               border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10))
               )
           ) ,)),
         IconButton(onPressed: (){
           context.read<LivreBloc>().add( LoadLivresByKeyword(keyword: textEditingController.text.toString()));
         }, icon: Icon(Icons.search))
       ],
     ),
   );
  }

}