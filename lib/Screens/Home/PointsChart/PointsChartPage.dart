import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChart.dart';
import 'package:wizzards/Services/EventService.dart';
import 'package:wizzards/Models/Points.dart';
class PointsChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Points>.value(value: EventService().pointData,
    child : Container (
        padding: EdgeInsets.only(top: 40, bottom: 40) ,color: Colors.white, child : Column(
      children: <Widget>[
        PointsChart(),
      ],
    )));
  }
}
