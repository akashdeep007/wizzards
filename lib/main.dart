import 'package:flutter/material.dart';
import 'package:wizzards/Services/auth.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Shared/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Wizzards',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Splash(),
      ),
    );
  }
}
