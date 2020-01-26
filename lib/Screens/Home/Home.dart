import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/CustomDrawer.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventInformation.dart';
import 'package:wizzards/Services/auth.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.amber,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(201, 145, 87, 1),
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
