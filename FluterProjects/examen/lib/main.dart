import 'package:examen/UI/pages/about.page.dart';
import 'package:examen/UI/pages/adherents.page.dart';
import 'package:examen/UI/pages/detail.page.dart';
import 'package:examen/UI/pages/livre.page.dart';
import 'package:examen/bloc/adherents/adherent_bloc.dart';
import 'package:examen/bloc/livres/livre_bloc.dart';
import 'package:examen/repositories/AdherentRepository.rep.dart';
import 'package:examen/repositories/livresRepository.rep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/pages/home.page.dart';
import 'bloc/adherents/adherent_state.dart';
import 'bloc/livres/livre_state.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>LivreBloc(livreState: new LivreState(livres: [], requested: Requested.NONE, errorMessage: ''), livresRepository:new LivresRepository())),
          BlocProvider(create: (context)=>AdherentBloc(adherentState: new AdherentState(adherents: [], requested: Requested.NONE, errorMessage:''), adherentRepository: new AdherentRepository()))
        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.blue
          ),
          routes: {
            "/":(context)=> HomePage(),
            "/livres":(context)=> Livre(),
            "/adherents":(context)=>Adherent(),
            "/about":(context)=>About(),
            "/detail":(context)=>LivreDetail()
          },
        ));

  }
}
