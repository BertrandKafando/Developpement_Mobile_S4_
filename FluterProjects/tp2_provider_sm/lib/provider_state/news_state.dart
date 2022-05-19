import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class NewsState extends ChangeNotifier{
  var news = null;
  void search(text) {
    String url =
        "https://newsapi.org/v2/everything?q=${text}&from=2022-03-22&sortBy=publishedAt&apiKey=2b84bca18287417b9f34d9facdcab546";
    print(url);
    http.get(Uri.parse(url)).then((response) {
        news = json.decode(response.body);
        print(news);
        notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }

}