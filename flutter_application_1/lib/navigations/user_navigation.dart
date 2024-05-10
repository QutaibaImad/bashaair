// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, sort_child_properties_last


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_screens/go_screen.dart';
import 'package:flutter_application_1/enroll_screens/first_enroll_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/widgets/can_not_dialog.dart';

class UserNavigation extends StatefulWidget {
  UserNavigation({super.key});

  @override
  State<UserNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation> {
  final signedUser = FirebaseAuth.instance.currentUser;
  int _index = 0;
  final screens = [
    HomeScreen(),
    FirstEnrollScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 77),
        child: Container(
          height: 67,
          width: 67,
          child: FloatingActionButton(
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FirebaseAuth.instance.currentUser != null
                              ? GoScreen(
                                  documentId:
                                      FirebaseAuth.instance.currentUser!.uid,
                                )
                              : CanNotDialog(),
                    ));
              },
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/Union.png',
                          height: 30, width: 30, fit: BoxFit.cover),
                      Text(
                        'الدردشة',
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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                    icon: Image.asset('assets/images/Tab1.png',
                        height: 27.5, width: 28, fit: BoxFit.cover),
                    label: 'الرئيسيه'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/inventory.png',
                        height: 31, width: 31, fit: BoxFit.cover),
                    label: 'انتماء'),
              ]),
        ),
      ),
      body: screens[_index],
    );
  }
}
