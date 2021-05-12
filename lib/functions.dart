import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CarMethod {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(carsData) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('cars')
          .add(carsData)
          .catchError((e) {
        print(e);
      });
    } else {
      print("You need to signIn");
    }
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection('cars')
        .orderBy('time', descending: true)
        .get();
  }

  upDateData(selectedDoc, newValue) {
    FirebaseFirestore.instance
        .collection('cars')
        .doc(selectedDoc)
        .update(newValue)
        .catchError((e) {
      print(e);
    });

    Future<void> deleteData(docId) async => FirebaseFirestore.instance
            .collection('cars')
            .doc(docId)
            .delete()
            .catchError((e) {
          print(e);
        });
  }
}
