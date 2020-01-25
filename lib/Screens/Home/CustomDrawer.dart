import 'package:flutter/material.dart';


class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          FlatButton(
            child: Text("Logout"),
            onPressed: () => print("Logout"),
          )
        ],
      ),
    );
  }
}
