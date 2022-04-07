
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class New extends StatelessWidget{
  var article=null;
  New({
    required this.article
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: NetworkImage(article["urlToImage"])),
          SizedBox(height: 10,),
          Text(
            article["title"],
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            article["content"],
          ),
        ],
      )
    );
  }

}