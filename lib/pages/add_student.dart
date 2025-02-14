import 'package:flutter/material.dart';
import 'package:flutter_crud/service/database.dart';
import 'package:random_string/random_string.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back_ios_new_outlined)
                ),
                SizedBox(width: 85,),
                Text(
                  'Add ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Student',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Text(
              'Student Name ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Enter Student Name', border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Student Age ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(hintText: 'Enter Student Age', border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Student ID ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(hintText: 'Enter Student ID', border: InputBorder.none),
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: () async {
                if (nameController.text != "" && ageController.text != "" && idController.text != ""){
                  String addID = randomAlphaNumeric(10);
                  Map<String, dynamic> studentInfoMap = {
                    'Name': nameController.text,
                    'Age': ageController.text,
                    'ID': idController.text,
                    'Absent': false,
                    'Present': false
                  };
                  await DatabaseMethod().addStudent(studentInfoMap, addID).then((value){
                    nameController.text="";
                    ageController.text="";
                    idController.text="";
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Student data has been uploaded!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ));
                  });
                }
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      'Add ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
