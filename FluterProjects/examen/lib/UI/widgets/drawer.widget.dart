import 'package:examen/bloc/adherents/adherent_bloc.dart';
import 'package:examen/bloc/livres/livre_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/adherents/adherent_event.dart';
import '../../bloc/livres/livre_event.dart';

class DrawElement extends StatelessWidget{
  String path;
  IconData pathicon;
  String pathname;
  Event event;

  DrawElement(this.path, this.pathicon, this.pathname,this.event);

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      onTap: (){
        if( event is LivreEvent){
          LivreEvent ev=event as LivreEvent;
          {context.read<LivreBloc>().add((ev));} ;
        } else {
          {context.read<AdherentBloc>().add((event as AdherentEvent));} ;
        }
        Navigator.pushNamed(context, path);
      },
      leading: Icon(pathicon),
      title: Text(pathname,style: TextStyle(fontSize: 20,color:Colors.blue),),
    );
  }

}