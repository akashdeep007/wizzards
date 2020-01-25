import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wizzards/Models/User.dart';

class DatabaseService{
  final uid;
  DatabaseService({this.uid});
  final CollectionReference studentCollection = Firestore.instance.collection('students');


  Future updateUserData(String name, String email, String food) async{
    return await studentCollection.document(uid).setData({
      'name' : name,
      'email' : email,
      'food' : food,
    });
  }

  List<UserData> _studentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
          name: doc.data['name'] ?? "",
          email: doc.data['email'] ?? "",
          food: doc.data['food'] ?? "");
    }).toList();
  }

  Stream<List<UserData>> get students {
    return studentCollection.snapshots().map(_studentListFromSnapshot);
  }
}