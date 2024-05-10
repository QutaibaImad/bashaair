// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/admin_panel_screen.dart';
import 'package:flutter_application_1/chat_screens/alkarkh_chat.dart';
import 'package:flutter_application_1/enroll_screens/first_enroll_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/widgets/can_not_dialog.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TestNavigation extends StatefulWidget {
  TestNavigation({super.key});

  @override
  State<TestNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<TestNavigation> {
  final signedUser = FirebaseAuth.instance.currentUser;
  int _index = 0;
  final screens = [
    HomeScreen(),
    FirstEnrollScreen(),
    FirebaseAuth.instance.currentUser != null
        ? AlkarkhChat(
            documentId: FirebaseAuth.instance.currentUser!.uid,
          )
        : CanNotDialog(),
    AdminPanelScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: Image.asset('assets/images/Tab1.png',
                  height: 32, width: 32, fit: BoxFit.cover),
              title: Text('الرئيسية')),
          SalomonBottomBarItem(
              icon: Image.asset('assets/images/inventory.png',
                  height: 32, width: 32, fit: BoxFit.cover),
              title: Text('انتماء')),
          SalomonBottomBarItem(
              icon: Image.asset('assets/images/Union.png',
                  height: 32, width: 32, fit: BoxFit.cover),
              title: Text('الدردشة')),
          SalomonBottomBarItem(
              icon: Icon(Icons.dashboard, color: Color(0xFF2F5093)),
              title: Text('لوحة التحكم')),
        ],
      ),
      body: screens[_index],
    );
  }
}
