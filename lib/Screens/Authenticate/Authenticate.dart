import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Authenticate/Signin.dart';
import 'package:wizzards/Screens/Authenticate/Register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  bool showSignIn = true;
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Signin(toggleView: toggleView);
    }
    else{
      return Register(toggleView: toggleView);
    }
  }
}

