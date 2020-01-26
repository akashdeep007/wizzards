import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Shared/FlutterProgressBar.dart';
import 'package:wizzards/Models/Points.dart';


class PointsChart extends StatefulWidget {
  @override
  _PointsChartState createState() => _PointsChartState();
}

class _PointsChartState extends State<PointsChart> {

  @override
  Widget build(BuildContext context) {
    int gryffindorPoints, hufflepuffPoints, ravenclawPoints, slytherinPoints;
    final points = Provider.of<Points>(context);
    print("Points is NUll");
    if (points == null) {
      gryffindorPoints = ((25 / 100) *
          100).toInt();
      hufflepuffPoints = ((25 / 100) *
          100).toInt();
      ravenclawPoints = ((25 / 100) *
          100).toInt();
      slytherinPoints = ((25 / 100) *
          100).toInt();
    }
    else {
      gryffindorPoints = ((points.gryffinforPoints / points.totalPoints) *
          100).toInt();
      hufflepuffPoints = ((points.hufflepuffPoints / points.totalPoints) *
          100).toInt();
      ravenclawPoints = ((points.ravenclawPoints / points.totalPoints) *
          100).toInt();
      slytherinPoints = ((points.slytherinPoints / points.totalPoints) *
          100).toInt();
    }
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.details, color: Colors.black, size: 40,),
                Container(
                  height: 200,
                  child: FAProgressBar(size: 40,
                    borderColor: Colors.black,
                    progressColor: Color.fromARGB(200, 127, 9, 9),
                    borderRadius: 20,
                    maxValue: 100,
                    currentValue: gryffindorPoints,
                    verticalDirection: VerticalDirection.up,
                    direction: Axis.vertical,),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.details, color: Colors.black, size: 40,),
                Container(
                  height: 200,
                  child: FAProgressBar(size: 40,
                    borderColor: Colors.black,
                    progressColor: Color.fromARGB(200,238,225,23),
                    borderRadius: 20,
                    maxValue: 100,
                    currentValue: hufflepuffPoints,
                    verticalDirection: VerticalDirection.up,
                    direction: Axis.vertical,),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.details, color: Colors.black, size: 40,),
                Container(
                  height: 200,
                  child: FAProgressBar(size: 40,
                    borderColor: Colors.black,
                    progressColor: Color.fromARGB(200,0,10,144),
                    borderRadius: 20,
                    maxValue: 100,
                    currentValue: ravenclawPoints,
                    verticalDirection: VerticalDirection.up,
                    direction: Axis.vertical,),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.details, color: Colors.black, size: 40,),
                Container(
                  height: 200,
                  child: FAProgressBar(size: 40,
                    borderColor: Colors.black,
                    progressColor: Color.fromARGB(200,13,98,23),
                    borderRadius: 20,
                    maxValue: 100,
                    currentValue: slytherinPoints,
                    verticalDirection: VerticalDirection.up,
                    direction: Axis.vertical,),
                )
              ],
            ),
          ]);
    }
}