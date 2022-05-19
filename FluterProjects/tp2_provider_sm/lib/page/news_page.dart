import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_provider_sm/provider_state/news_state.dart';
import '../widgets/custom_appbar.dart';
import 'new_page.dart';

class News extends StatelessWidget{
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                     Provider.of<NewsState>(context,listen: false).search(textController.text);
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            SizedBox(height: 10,),

            Expanded(
                child: Consumer<NewsState>(
                  builder: (context,newsstate,child){
                    return  ListView.separated(
                        itemCount:newsstate.news == null ? 0 : newsstate.news["articles"].length,
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(

                            //NetworkImage(news["articles"][index]["urlToImage"]
                            trailing: Image.network(
                              newsstate.news["articles"][index]["urlToImage"],
                              height: 100,
                              width: 80,
                            ),
                            title: Text("${newsstate.news["articles"][index]["title"]}",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "${newsstate.news["articles"][index]["description"]}",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 8.0,
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>New(article:  newsstate.news["articles"][index])));

                            },
                          );
                        });
                  },
                )
             /*   ListView.separated(
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
                    })*/
            )
          ],
        ),
      ),
    );
  }

}