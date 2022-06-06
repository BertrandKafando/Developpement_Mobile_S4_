
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/adherents/adherent_event.dart';
import '../../bloc/livres/livre_event.dart';
import 'drawer.widget.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("image/bpi.jpg"),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Bibliothèque Publique")
            ],
          )
          ),
          DrawElement("/", Icons.home, "Home",NullEvent() ),
          DrawElement("/livres", Icons.book_online, "Livres",LoadLivres()),
          DrawElement("/adherents", Icons.supervised_user_circle_sharp, "Aherents",LoadAdhrentEvent()),
          DrawElement("/about", Icons.read_more_sharp, "About",NullEvent()),
        ],
      ),
    );
  }

}