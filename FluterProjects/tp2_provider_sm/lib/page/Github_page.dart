import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_provider_sm/provider_state/Github_state.dart';
class GithubUsers extends StatelessWidget{
  //controller pour la saisie
  TextEditingController textController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                Provider.of<GithubState>(context,listen: false).searchGithubUser(textController.text);
                }, icon: Icon(Icons.search))
              ],
            ),
            Expanded(child:Consumer<GithubState>(
              builder: (context,gitusers,child){
                return  ListView.builder(
                    itemCount:gitusers.users==null||gitusers.users["items"]==null?0: gitusers.users["items"].length,
                    itemBuilder: (context, index){
                      return ListTile(

                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(gitusers.users["items"][index]["avatar_url"]),
                        ),
                        title: Text("${gitusers.users["items"][index]["login"]}",
                          style: TextStyle(fontSize: 10,),),
                      );
                    });
              },)
        /*    ListView.builder(
                itemCount:users==null||users["items"]==null?0: users["items"].length,
                itemBuilder: (context, index){
                  return ListTile(

                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(users["items"][index]["avatar_url"]),
                    ),
                    title: Text(users["items"][index]["login"],
                      style: TextStyle(fontSize: 10,),),
                  );
                })*/
            )
          ],
        ),
      ),
    );
  }

}