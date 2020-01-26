import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/User.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentDash.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentTile.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    final students = Provider.of<List<UserData>>(context);
    if (students == null){
      print("students is null");
      return Container();
    }
    else{
    return Column(
      children: <Widget>[
        StudentDash(studentsCounts : students.length),
        ListView.builder(shrinkWrap:true, itemCount : students.length ,itemBuilder: (context, index){
          return (StudentTile(index : index,student : students[index]));
        },)
      ],
    );}
  }
}
