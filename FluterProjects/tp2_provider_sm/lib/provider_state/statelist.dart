import 'package:flutter/cupertino.dart';

/*
* classe des traitements
* */
class StateList extends ChangeNotifier{
  List<int> numbers = [0,1];
  void addItem(){
    numbers.add(numbers[numbers.length-1]+1);
    notifyListeners();
  }
}