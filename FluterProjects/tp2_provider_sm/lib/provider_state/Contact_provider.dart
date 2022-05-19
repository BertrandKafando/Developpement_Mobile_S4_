import 'package:flutter/cupertino.dart';

class ContactState extends ChangeNotifier{
  List<String> data = [];
  int compte=0;
  void addItem(value){
    data.add(value);
    compte=data.length;
    notifyListeners();
  }
  void delete(value){
    data.removeAt(value);
    compte=data.length;
    notifyListeners();
  }
}