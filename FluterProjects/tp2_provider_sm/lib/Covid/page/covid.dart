import 'dart:async';
import 'dart:convert';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../style/palette.dart';
import '../../style/styles.dart';
import '../../widgets/custom_appbar.dart';
import '../widget/covid_chart.dart';
import '../widget/data.dart';
import '../widget/stat_grid.dart';

class CovidNews extends StatefulWidget {
  @override
  State<CovidNews> createState() => _CovidNewsState();

}
class _CovidNewsState extends State<CovidNews> {
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
        setState(() {
          covid = json.decode(value.body);
          data.setRecovered(covid["hospitalizedCumulative"]!=null?covid["hospitalizedCumulative"]:0);
          data.setDeaths(covid["death"]!=null?covid["death"]:0);
          data.setActive(covid["positive"]!=null?covid["positive"]:0);
          data.setCritical(0);
          data.setTotalcases(covid["totalTestResults"]!=null?covid["totalTestResults"]:0);
          lastdate=covid["lastUpdateEt"];
        });
      }).catchError((onError) {
        print(onError);
      });

  }
  Future<void> main() async {
   await loadCurentCountry();
    await  loadCurentData();
    setState(() {
      getBarGroup();
    });
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
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    main();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        appBar: CustomAppBar(),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            //les sliders de la page
            _buildHeader('Statistics'),
            _buildRegionTabBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              sliver: SliverToBoxAdapter(
                child: StatsGrid(
                  data: data,
                ),
              ),
            ),
            _buildText(), //lastUpdate String
            _buildHeader('Prevention'),
            _buildPreventionTips(screenHeight),  //image block
            SliverPadding(
              padding: EdgeInsets.only(top: 10.0),
              sliver: SliverToBoxAdapter(
                child: CovidChartBar(covidCases: covidUSADailyNewCases,
                  countryName: val,barChartGroups: barChartGroups,),
              ),
            )
          ],
        ));
  }

//construire les sliders
  SliverPadding _buildHeader(txt) {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          txt,//Statistic
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 1,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(25.0)),
          child: TabBar(
            //import la dependances
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
             // Text(My_Country),
              CustomDropdownButton2(
                buttonDecoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(25.0)
                ),
                buttonWidth: 300,
                //buttonElevation: 2,
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                hint: 'Select A Country',
                dropdownItems: val,
                value: selectedValue ,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    My_Country='--';

                    loadData(value);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 160.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Column(
                children: <Widget>[
                  Image.asset(
                    e.keys.first,
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    e.values.first,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildText() {
    return SliverPadding(
      padding: EdgeInsets.all(0.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "LastUpdate: " + lastdate,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
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
