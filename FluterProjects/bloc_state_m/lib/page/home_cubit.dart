
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCubit extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("cubit"),),
         body: Column(
       children: [
          Text("value=>" ,style: TextStyle(fontWeight: FontWeight.bold ),),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: (){

             }, child: Text("increment +")),
             ElevatedButton(onPressed: (){

             }, child: Text("Decrement  -"))
           ],
         )
       ],
   ),
   );
  }
  
}