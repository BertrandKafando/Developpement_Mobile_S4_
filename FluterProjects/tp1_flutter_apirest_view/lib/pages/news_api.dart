import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp3_drawerapi/pages/detail.dart';
import '../widgets/custom_appbar.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  TextEditingController textController = new TextEditingController();
  var news = null;
  void search(text) {
    String url =
        "https://newsapi.org/v2/everything?q=${text}&from=2022-03-15&sortBy=publishedAt&apiKey=2b84bca18287417b9f34d9facdcab546";
    print(url);
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        news = json.decode(response.body);
        print(news);
      });
    }).catchError((onError) {
      print(onError);
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Entrez un nom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  controller: textController,
                )),
                IconButton(
                    onPressed: () {
                      search(textController.text);
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            SizedBox(height: 10,),

            Expanded(
                child:
                ListView.separated(
                    itemCount: news == null ? 0 : news["articles"].length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(

                        //NetworkImage(news["articles"][index]["urlToImage"]
                        trailing: Image.network(
                          news["articles"][index]["urlToImage"],
                          height: 100,
                          width: 80,
                        ),
                        title: Text(
                          news["articles"][index]["title"],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          news["articles"][index]["description"],
                          style: TextStyle(
                             color: Colors.black.withOpacity(0.6),
                            fontSize: 8.0,
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>New(article:  news["articles"][index])));

                        },
                      );
                    })
            )
          ],
        ),
      ),
    );
  }
}
