import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzards/Models/Event.dart';
import 'package:wizzards/Screens/Home/StudentInformation/StudentDash.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);
    if (events == null){
      print("students is null");
      return Container();
    }
    else{
      return Column(
        children: <Widget>[
          ListView.builder(shrinkWrap:true, itemCount : events.length ,itemBuilder: (context, index){
            return (Text(events[index].eventDetails));
          },)
        ],
      );}
  }
}
