import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addStudent(Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentInfoMap);
  }

  Future<Stream<QuerySnapshot>> getStudent() async {
    return await FirebaseFirestore.instance.collection("Students").snapshots();
  }

  Future updateAttendance(String attendancecase,  String id) async{
    return await FirebaseFirestore.instance.collection("Students").doc(id).update({attendancecase: true});
  }

  Future deleteStudent(String id) async{
    return await FirebaseFirestore.instance.collection("Students").doc(id).delete();
  }
}
