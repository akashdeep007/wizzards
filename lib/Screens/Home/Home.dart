import 'package:flutter/material.dart';
import 'package:wizzards/Screens/Home/CustomDrawer/CustomDrawer.dart';
import 'package:wizzards/Screens/Home/EventInformation/EventInformation.dart';
import 'package:wizzards/Services/auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class Home extends StatelessWidget {

   void setup() async {
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
     _firebaseMessaging.configure(onMessage: (Map<String,dynamic> message)async{
       print("Message : $message");
     },
  onResume: (Map<String,dynamic> message)async{
       print("Message : $message");
     },
     onLaunch: (Map<String,dynamic> message)async{
       print("Message : $message");
     },
     );
  }
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
