import 'package:flutter/material.dart';
import 'package:wizzards/Services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            child: Text("Logout"),
            onPressed: () async {
             await _auth.signOut();
            },
          ),
        ],
        title: Text("Wizzards"),
      ),
    );
  }
}
