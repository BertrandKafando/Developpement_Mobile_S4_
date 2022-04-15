
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      ),
      appBar: AppBar(
        title: Text("E-store", style: TextStyle(color:Colors.black),),
      //backgroundColor: Colors.white60,
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
           // Text("Explore",style: TextStyle(fontSize: 40, color: Colors.black),),
            SizedBox(height: 20,),
             Row(
              children: [
                Expanded(child:  TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Entrez un nom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                 // controller: textController,
                )
                ),
                IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.search,color: Colors.deepOrange,))
              ],
            ),



          ],
        ),
      ),

    );
  }
}