import 'dart:convert';
import 'dart:ffi';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3_drawerapi/drawer/palette.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:tp3_drawerapi/drawer/styles.dart';
import '../widgets/covid_chart.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/stat_grid.dart';
import 'package:http/http.dart' as http;

class CovidNews extends StatefulWidget {
  @override
  State<CovidNews> createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
  String _country = 'USA';
   Data data=new Data('ALl', 0, 0, 0, 0,0);
   var covid=null;
  String? selectedValue;
  List<String> items = [
    "Afghanistan",
    "France",
    "Burkina Faso",
    "Morocco",
    "US",
    "United Kingdom",
  ];
  final covidUSADailyNewCases = [12.17, 11.15, 10.02, 11.21, 13.83, 14.16, 14.30];
  void loadData(txt){
  String url="https://covid-api.mmediagroup.fr/v1/cases?country=${txt}";
  http.get(Uri.parse(url)).then((value) {
    setState(() {
      covid=json.decode(value.body);
      //print(covid);
      //print(covid['All']);
        data.setRecovered(covid["All"]["recovered"]);
        data.setDeaths(covid["All"]["deaths"]);
        data.setActive(covid["All"]["confirmed"]);
        data.setCritical(0);
      data.setTotalcases(int.parse(data.getCritical())+int.parse(data.getActive())+
          int.parse(data.getDeaths())+int.parse(data.getRecovered()));



      });

  }).catchError( (onError){
    print(onError);
  });
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
            _buildHeader(),
            _buildSearch(),
            _buildRegionTabBar(),
           // _buildStatsBar(),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              sliver: SliverToBoxAdapter(
                child: StatsGrid(data: data,),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10.0),
              sliver: SliverToBoxAdapter(
                child: CovidChartBar(covidCases: covidUSADailyNewCases),
              ),
            )
          ],
        ));
  }

//construire les sliders
  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
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
        length: 2,
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
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index) {
              if(index==0){
                setState(() {
                  loadData("Morocco");
                });
              }
              if(index==1){
                setState(() {
                  loadData("France");
                });
              }
            },
          ),
        ),
      ),
    );
  }
  SliverToBoxAdapter  _buildSearch(){
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(25.0)),
          child:
              CustomDropdownButton2(
                buttonDecoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
                buttonWidth: 300,
                buttonElevation: 2,
                icon: Icon(Icons.search,size: 30,),
                hint: 'Select A Country',
                dropdownItems: items,
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    loadData(value);

                  });
                },
              ),

          /*TabBar(
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
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index) {
              if(index==0){
                setState(() {
                  loadData("Morocco");
                });
              }
              if(index==1){
                setState(() {
                  loadData("France");
                });
              }
            },
          ),*/
        ),
      ),
    );
  }



  SliverPadding _buildStatsBar(){
    return SliverPadding(
        padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index){},

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

  Data(this.country,this.totalcases,this.deaths,this.recovered,this.active,this.critical);
  String getCountry(){
    return this.country;
  }
  String getTotalcases(){
    return this.totalcases.toString();
  }
  String getDeaths(){
    return this.deaths.toString();
  }
  String getRecovered(){
    return this.recovered.toString();
  }
  String getActive(){
    return this.active.toString();
  }
  String getCritical(){
    return this.critical.toString();
  }
  //
  void setCountry(String coun){
     this.country=coun;
  }
  void setTotalcases(int tt){
    this.totalcases=tt;
  }
  void setDeaths(int mt){
    this.deaths=mt;
  }
  void setRecovered(int rcv){
    this.recovered=rcv;
  }
  void setActive(int act){
   this.active=act;
  }
  void setCritical(int ct){
     this.critical=ct;
  }



}
