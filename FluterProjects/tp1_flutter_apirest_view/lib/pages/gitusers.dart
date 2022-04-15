
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Githusers extends StatefulWidget{
  @override
  State<Githusers> createState() => _GithusersState();
}

class _GithusersState extends State<Githusers> {
  TextEditingController textController=new TextEditingController();

  var users=null;
  void searchGithubUser(userKey){
    String url="https://api.github.com/search/users?q=${userKey}&per_page=10&page=0";
    http.get(Uri.parse(url))
        .then((response) {
      setState(() {
        users= json.decode(response.body);
      });
    }).catchError((onError){
      print(onError);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("GitUsers"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Entrez un nom",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                controller: textController,
              )
              ),
              IconButton(onPressed: (){
                searchGithubUser(textController.text);
              }, icon: Icon(Icons.search))
            ],
          ),
          Expanded(child: ListView.builder(
              itemCount:users==null||users["items"]==null?0: users["items"].length,
              itemBuilder: (context, index){
              return ListTile(

                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users["items"][index]["avatar_url"]),
                ),
                title: Text(users["items"][index]["login"],
                style: TextStyle(fontSize: 10,),),
              );
          })
          )
        ],
      ),
      ),
    );
  }
}