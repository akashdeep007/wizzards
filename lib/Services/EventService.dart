import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wizzards/Models/Event.dart';

class EventService {
  final CollectionReference eventCollection =
  Firestore.instance.collection('events');
  //event notifications
  List<Event> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Event(
          eventHeadline: doc.data['headline'] ?? "",
          eventDetails: doc.data['eventDetails'] ?? "",
          startDate: doc.data['startDate'] ?? "",
          endDate: doc.data['endDate'] ?? "");
    }).toList();
  }

  Stream<List<Event>> get events {
    return eventCollection.snapshots().map(_eventListFromSnapshot);
  }

  Future updateEventData(String headline, String eventDetails, String startDate,
      String endDate) async {
    return await eventCollection
        .document((eventCollection.snapshots().length).toString())
        .setData({
      headline: headline,
      eventDetails: eventDetails,
      startDate: startDate,
      endDate: endDate
    });
  }
}
