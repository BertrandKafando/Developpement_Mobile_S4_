import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class CovidChartBar extends StatefulWidget {
  List<int> covidCases;
  List<dynamic> countryName;
  List<BarChartGroupData> barChartGroups;
  CovidChartBar(
      {required this.covidCases,
      required this.countryName,
      required this.barChartGroups});

  @override
  State<CovidChartBar> createState() => _CovidChartBarState();
}

class _CovidChartBarState extends State<CovidChartBar> {


  Widget getcontry(double val , var meta){
    for(int i=0; i<widget.covidCases.length;i++){
     return   RotatedBox(
       quarterTurns: 1,
       child: Text(widget.countryName[val.toInt()]),
     );

    }
    return    RotatedBox(
      quarterTurns: 1,
      child: Text(""),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 350.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Current States Confirmed Cases',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AspectRatio(
                aspectRatio: 1.7,
                child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: 1000,
                      padding: EdgeInsets.all(8),
                      child:  BarChart(BarChartData(
                          barGroups: widget.barChartGroups,
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                  axisNameWidget: Text(
                                    // You can use any widget here
                                    'Covid Statistic 2021-2020',
                                    style: TextStyle(color: Colors.green),
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: getcontry ,
                                    interval: 1.5,
                                  )

                              ),

                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  )),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ))),
                        ))


                    )
                )

            )
          ],
        ));
  }
}

