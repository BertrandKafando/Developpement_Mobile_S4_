import 'dart:async';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CovidState extends ChangeNotifier{
  String My_Country='Morocco';
  Data data = new Data('ALl', 0, 0, 0, 0, 0);
  var lastdate ="";
  var covid = null;
  String? selectedValue;
  List<int>  covidUSADailyNewCases = [];
  double total=0;
  List<String>val=[];
  List<BarChartGroupData> barChartGroups = [];
  Future<void> loadCurentCountry() async{
    String url="https://api.covidtracking.com/v1/states/current.json";
    await  http.get(Uri.parse(url)).then((value){
      var dta=json.decode(value.body);
      print(dta);
      for(int i=0;i<51;i++){
        val.add(dta[i]["state"]);
      }
      print("contry tab");
      print(val);
      //notifyListeners();
    }
    ).catchError((onError){
      print(onError);
    });
  }

  Future<void> loadCurentData() async{
    String url="https://api.covidtracking.com/v1/states/current.json";
    await http.get(Uri.parse(url)).then((value){
      var dta=json.decode(value.body);

      for(int i=0;i<51;i++){
        covidUSADailyNewCases.add(dta[i]["positive"]);
      }
      print("covid cases tab");
      print(covidUSADailyNewCases);
      // covidUSADailyNewCases.forEach((element) {total=total+element;});
      // print(total);
    }).catchError((onError){
      print(onError);
    });
  }

  void loadData(txt) {

    String url="https://api.covidtracking.com/v1/states/${txt.toString().toLowerCase()}/current.json";
    print(url);
    http.get(Uri.parse(url)).then((value) {
        covid = json.decode(value.body);
        data.setRecovered(covid["hospitalizedCumulative"]!=null?covid["hospitalizedCumulative"]:0);
        data.setDeaths(covid["death"]!=null?covid["death"]:0);
        data.setActive(covid["positive"]!=null?covid["positive"]:0);
        data.setCritical(0);
        data.setTotalcases(covid["totalTestResults"]!=null?covid["totalTestResults"]:0);
        lastdate=covid["lastUpdateEt"];
        notifyListeners();
    }).catchError((onError) {
      print(onError);
    });

  }
  Future<void> main() async {
    await loadCurentCountry();
    await  loadCurentData();
      getBarGroup();
    notifyListeners();
  }

  getBarGroup() {
    //chart
    List<double>barData=[];
    covidUSADailyNewCases.forEach((element) {
      barData.add(element.toDouble());
    });
    barData
        .asMap()
        .forEach((key, value) => barChartGroups.add(BarChartGroupData(
      x: key,
      barRods: [
        BarChartRodData(
          toY: value,
          color: key == 26 ? Colors.blue : Colors.amber,
          width: 16,
        )
      ],
    )
    )
    );
    return barChartGroups;
  }
}

class Data {
  String country;
  int totalcases;
  int deaths;
  int recovered;
  int active;
  int critical;

  Data(this.country, this.totalcases, this.deaths, this.recovered, this.active,
      this.critical);
  String getCountry() {
    return this.country;
  }

  String getTotalcases() {
    return this.totalcases.toString();
  }

  String getDeaths() {
    return this.deaths.toString();
  }

  String getRecovered() {
    return this.recovered.toString();
  }

  String getActive() {
    return this.active.toString();
  }

  String getCritical() {
    return this.critical.toString();
  }

  //
  void setCountry(String coun) {
    this.country = coun;
  }

  void setTotalcases(int tt) {
    this.totalcases = tt;
  }

  void setDeaths(int mt) {
    this.deaths = mt;
  }

  void setRecovered(int rcv) {
    this.recovered = rcv;
  }

  void setActive(int act) {
    this.active = act;
  }

  void setCritical(int ct) {
    this.critical = ct;
  }
}
