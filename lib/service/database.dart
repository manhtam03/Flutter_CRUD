import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addStudent(Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentInfoMap);
  }
}
