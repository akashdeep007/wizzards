import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/CustomDrawer.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventInformation.dart';
import 'package:wizzards/Screens/Home/PointsChart/PointsChartPage.dart';
import 'package:wizzards/Services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Text("Logout"),
            onPressed: () async {
             await _auth.signOut();
            },
          ),
        ],
        title: Text("Wizzards"),
      ),
      body: Column(
        children: <Widget>[
          Expanded( child: EventInformation()),
        ],
      ),
    );
  }
}
