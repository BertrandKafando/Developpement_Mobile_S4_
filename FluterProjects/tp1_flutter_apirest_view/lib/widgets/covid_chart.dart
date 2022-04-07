import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../drawer/styles.dart';

class CovidChartBar extends StatelessWidget {
  List<double> covidCases;
  CovidChartBar({required this.covidCases});
  final List<DataItem> _myData = List.generate(
      30,
      (index) => DataItem(
            x: index,
            y1: Random().nextInt(20) + Random().nextDouble(),
            y2: Random().nextInt(20) + Random().nextDouble(),
            y3: Random().nextInt(20) + Random().nextDouble(),
          ));

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
                'Daily New Cases',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           /*   Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
            BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 16.0,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
            margin: 10.0,
            showTitles: true,
            textStyle: Styles.chartLabelsTextStyle,
            rotateAngle: 35.0,
            getTitles: (double value) {
            switch (value.toInt()) {
            case 0:
            return 'May 24';
            case 1:
            return 'May 25';
            case 2:
            return 'May 26';
            case 3:
            return 'May 27';
            case 4:
            return 'May 28';
            case 5:
            return 'May 29';
            case 6:
            return 'May 30';
            default:
            return '';
            }
            },
    ),

    leftTitles: SideTitles(
    margin: 10.0,
    showTitles: true,
    textStyle: Styles.chartLabelsTextStyle,
    getTitles: (value) {
    if (value == 0) {
    return '0';
    } else if (value % 3 == 0) {
    return '${value ~/ 3 * 5}K';
    }
    return '';
    }),
    ),
    gridData: FlGridData(
    show: true,
    checkToShowHorizontalLine: (value) => value % 3 == 0,
    getDrawingHorizontalLine: (value) => FlLine(
    color: Colors.black12,
    strokeWidth: 1.0,
    dashArray: [5],
    ),
    ),
    borderData: FlBorderData(show: false),
    barGroups: covidCases
        .asMap()
        .map((key, value) => MapEntry(
    key,
    BarChartGroupData(
    x: key,
    barRods: [
    BarChartRodData(
    toY: value,
    color: Colors.red,
    ),
    ],
    )))
        .values
        .toList(),
    ),
    ),
    ),*/


          ],
        ));
  }
}

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}
