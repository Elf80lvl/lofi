import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('nameSearch', isGreaterThanOrEqualTo: username)
        .get();
  }

  getAllUsers() async {
    return await FirebaseFirestore.instance.collection('users').get();
  }

// * загрузка юзера в firestore database
  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection('users').add(userMap).catchError((e) {
      print(e.toString());
    });
  }
}
