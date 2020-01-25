
import 'package:flutter/material.dart';
class StudentDash extends StatelessWidget {
  final int studentsCounts;
  StudentDash({this.studentsCounts});

  @override
  Widget build(BuildContext context) {
    return Container( child : Text(studentsCounts.toString()));
  }
}
