import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pop(context), label: Text(" Back ")),
      body: Container(
        height: 500,
        width: 500,
        padding: EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: <Widget>[
              Carousel(
                dotIncreaseSize: 4,
                boxFit: BoxFit.scaleDown,
                images: [
                  AssetImage("assets/images/gryffindor.png"),
                  AssetImage("assets/images/hufflepuff.png"),
                  AssetImage("assets/images/raven.png"),
                  AssetImage("assets/images/slytherin.png"),
                ],
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
