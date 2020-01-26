import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Charts/chartbar_G.dart';
import 'package:wizzards/Charts/chartbar_R.dart';
import 'package:wizzards/Charts/chartbar_S.dart';
import 'package:wizzards/Charts/chartbar_h.dart';
import 'package:wizzards/Models/Points.dart';

class PointsChart extends StatefulWidget {
  @override
  _PointsChartState createState() => _PointsChartState();
}

class _PointsChartState extends State<PointsChart> {
  @override
  Widget build(BuildContext context) {
    double gryffindorPoints, hufflepuffPoints, ravenclawPoints, slytherinPoints;
    int gpoints, hpoints, spoints, rpoints;
    final points = Provider.of<Points>(context);
    print("Points is NUll");
    if (points == null) {
      gryffindorPoints = (25 / 100).toDouble();
      hufflepuffPoints = (25 / 100).toDouble();
      ravenclawPoints = (25 / 100).toDouble();
      slytherinPoints = (25 / 100).toDouble();
      rpoints = 25;
      gpoints = 25;
      spoints = 25;
      hpoints = 25;
    } else {
      gryffindorPoints =
          (points.gryffinforPoints / points.totalPoints).toDouble();
      hufflepuffPoints =
          (points.hufflepuffPoints / points.totalPoints).toDouble();
      ravenclawPoints =
          (points.ravenclawPoints / points.totalPoints).toDouble();
      slytherinPoints =
          (points.slytherinPoints / points.totalPoints).toDouble();
      rpoints = points.ravenclawPoints;
      gpoints = points.gryffinforPoints;
      spoints = points.slytherinPoints;
      hpoints = points.hufflepuffPoints;
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:<
        Widget>[
      Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("  "),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/slytherin.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      ChartBarS(
                        scoreperc: (slytherinPoints).toDouble(),
                      ),
                      Text(
                        "$spoints",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("  "),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/ravenclaw.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      ChartBarR(
                        scoreperc: (ravenclawPoints).toDouble(),
                      ),
                      Text(
                        "$rpoints",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("  "),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/gryffindor.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      ChartBarG(
                        scoreperc: (gryffindorPoints).toDouble(),
                      ),
                      Text(
                        "$gpoints",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("  "),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 70.0,
                        height: 70.0,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/hufflepuff.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      ChartBarH(
                        scoreperc: (hufflepuffPoints).toDouble(),
                      ),
                      Text(
                        "$hpoints",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 90.0,
                height: 90.0,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/trophy.png'),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Draco Dormiens Nunquam Titillandus",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "May the best House Win!",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
