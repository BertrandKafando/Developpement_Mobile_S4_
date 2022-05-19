import 'package:flutter/material.dart';

import 'drawlistile.dart';

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
          DrawerItem("Home", "/", Icon(Icons.home)),
          DrawerItem("Contacts", "/contacts", Icon(Icons.contacts)),
          DrawerItem("GitUsers", "/gitUsers", Icon(Icons.supervised_user_circle_sharp)),
        //  DrawerItem("Covid19", "/covid", Icon(Icons.sick_sharp)),
          DrawerItem("News", "/news", Icon(Icons.search)),
        ],
      ),
    );
  }
}
