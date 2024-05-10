// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<ComplaintsScreen> {
  final credential = FirebaseAuth.instance.currentUser;
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('complaints').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قائمة الشكاوى',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0x33000000),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data[index]['name']}',
                        style: TextStyle(
                            color: Color(0xFF2F5093),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                      Text(
                        '${data[index]['phoneNumber']}',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '${data[index]['title']}',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          fontFamily: 'rFont'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '${data[index]['description']}',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'rFont'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void searchCard(String query) {
    final suggestions = data.where((varCard) {
      final cardNumber = varCard['phoneNumber'].toLowerCase();
      final input = query.toLowerCase();
      return cardNumber.contains(input);
    }).toList();
    setState(() {
      data = suggestions;
    });
  }
}
