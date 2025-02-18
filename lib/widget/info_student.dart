import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/service/database.dart';

class InfoStudent extends StatelessWidget {
  const InfoStudent({
    super.key,
    required this.ds,
  });

  final DocumentSnapshot<Object?> ds;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Student Name : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    ds['Name'],
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      await DatabaseMethod().deleteStudent(ds.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.delete, color: Colors.black, size: 25),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0,),
              Row(
                children: [
                  Text(
                    'ID : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    ds['ID'],
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0,),
              Row(
                children: [
                  Text(
                    'Age : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    ds['Age'],
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0,),
              Row(
                children: [
                  Text(
                    'Attendance : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  ds['Present'] == false ? GestureDetector(
                    onTap: () async {
                      await DatabaseMethod().updateAttendance("Present", ds.id);
                    },
                    child: Container(
                      width: 37,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'P',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ) : Container(
                    width: 37,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ds['Absent'] == false ? GestureDetector(
                    onTap: () async {
                      await DatabaseMethod().updateAttendance("Absent", ds.id);
                    },
                    child: Container(
                      width: 37,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'A',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ) : Container(
                    width: 37,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}