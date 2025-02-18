import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/service/database.dart';
import 'package:flutter_crud/widget/info_student.dart';
import 'package:flutter_crud/pages/add_student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? studentStream;

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  getOnTheLoad() async {
    studentStream = await DatabaseMethod().getStudent();
    setState(() {

    });
  }

  Widget showStudentList(){
    return StreamBuilder(stream: studentStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData ? ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: snapshot.data.docs.length,
        itemBuilder: (BuildContext context, int index){
          DocumentSnapshot ds = snapshot.data.docs[index];
          return InfoStudent(ds: ds);
        },
      ) : Container();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Student ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Attendance',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0,),
            showStudentList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent()));
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
