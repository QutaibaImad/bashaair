// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddComplaintScreen extends StatefulWidget {
  final String documentId;

  AddComplaintScreen({required this.documentId});

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  CollectionReference complaints =
      FirebaseFirestore.instance.collection('complaints');

  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'ارسال شكوى   ',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'rFont'),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0x1A000000))),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              border: InputBorder.none,
                              focusColor: Color(0x1A000000),
                              hintText: 'رقم الهاتف',
                              hintStyle: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0x1A000000))),
                          child: TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10),
                              border: InputBorder.none,
                              focusColor: Color(0x1A000000),
                              hintText: 'أكتب الموضوع هنا ..',
                              hintStyle: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0x1A000000))),
                          child: TextFormField(
                            minLines: 10,
                            maxLines: 10,
                            controller: descriptionController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(right: 10, top: 5),
                              border: InputBorder.none,
                              hintText: 'الشرح ..',
                              hintStyle: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        complaints
                            .add({
                              'phoneNumber': phoneNumberController.text,
                              'name': data['name'],
                              'title': titleController.text,
                              'description': descriptionController.text,
                            })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Container(
                              height: 203,
                              width: 320,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'تمت العمليه بنجاح',
                                    style: TextStyle(
                                        color: Color(0xFF44474E),
                                        fontSize: 20,
                                        fontFamily: 'rFont',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'حسنا',
                                      style: TextStyle(
                                          color: Color(0xFF255DAE),
                                          fontSize: 15,
                                          fontFamily: 'rFont',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Color(0xFF2F5093),
                          height: 44,
                          width: 307,
                          child: Center(
                            child: Text(
                              'ارسال',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  fontFamily: 'rFont'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Color(0xFF2F5093),
            ),
          ),
        );
      },
    );
  }
}
