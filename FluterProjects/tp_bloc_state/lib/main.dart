import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc_state/bloc/contact_bloc.dart';
import 'package:tp_bloc_state/repositories/contact.repository.dart';
import 'package:tp_bloc_state/ui/pages/contact.page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
      BlocProvider(create: (context)=>ContactBloc(new ContactState(requested: Requested.NONE, contacts: [], errorMessage: ''), new ContactRepository())),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepOrange
          ),
        routes: {
          "/contacts": (context) => ContactPage(),
        },
        initialRoute: "/contacts",
      ),

    );
  }
}



