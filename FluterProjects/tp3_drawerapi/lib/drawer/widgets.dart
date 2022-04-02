import 'package:flutter/material.dart';
import 'package:tp3_drawerapi/drawer/drawlistile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("image/profile.jpeg"),
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("KAFANDO Bertrand")
              ],
            ),
          ),
          DrawerItem("Home", "/home", Icon(Icons.home)),
          DrawerItem("Contacts", "/contacts", Icon(Icons.contacts)),
          DrawerItem("News", "/news", Icon(Icons.newspaper)),
        ],
      ),
    );
  }
}
