// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_screens/go_screen.dart';
import 'package:flutter_application_1/enroll_screens/first_enroll_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/widgets/can_not_dialog.dart';

class UserNavigation2 extends StatefulWidget {
  UserNavigation2({super.key});

  @override
  State<UserNavigation2> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation2> {
  final signedUser = FirebaseAuth.instance.currentUser;
  int _index = 0;
  final screens = [
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
          height: 67,
          width: 67,
          child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstEnrollScreen()));
              },
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/inventory.png',
                          height: 31, width: 31, fit: BoxFit.cover),
                      Text(
                        'انتماء',
                        style: TextStyle(
                            color: Color(0xFF2F5093),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: 'rFont'),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
              )),
        ),
      ),
      bottomNavigationBar: Container(
        width: 320,
        height: 69,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 30, spreadRadius: -15)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              selectedLabelStyle: TextStyle(
                  color: Color(0xFF2F5093),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  fontFamily: 'rFont'),
              unselectedLabelStyle: TextStyle(
                  color: Color(0xFF2F5093),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  fontFamily: 'rFont'),
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 65, bottom: 2),
                      child: Image.asset('assets/images/Tab1.png',
                          height: 27.5, width: 28, fit: BoxFit.cover),
                    ),
                    label: 'الرئيسيه                      '),
                BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FirebaseAuth.instance.currentUser != null
                                      ? GoScreen(
                                          documentId: FirebaseAuth
                                              .instance.currentUser!.uid,
                                        )
                                      : CanNotDialog(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 65, bottom: 2),
                        child: Image.asset('assets/images/Union.png',
                            height: 33, width: 33, fit: BoxFit.cover),
                      ),
                    ),
                    label: '                      الدردشة'),
              ]),
        ),
      ),
      body: screens[_index],
    );
  }
}
