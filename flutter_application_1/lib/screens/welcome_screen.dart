// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/admin_panel_screen.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'أهلا بك ',
            style: TextStyle(
                color: Color(0xFF44474E),
                fontSize: 20,
                fontFamily: 'rFont',
                fontWeight: FontWeight.w500),
          ),
          Text(
            'البشائر هويتنا',
            style: TextStyle(
                color: Color(0xFF255DAE),
                fontSize: 60,
                fontFamily: 'tFont',
                fontWeight: FontWeight.w400),
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 230,
            width: 162,
            fit: BoxFit.cover,
          ),
          InkWell(
            onTap: () {
              if (FirebaseAuth.instance.currentUser?.email ==
                  'admin@gmail.com') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminPanelScreen()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => TestNavigation()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Color(0xFF2F5093),
                height: 44,
                width: 307,
                child: Center(
                  child: Text(
                    'مواصلة التصفح',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontFamily: 'rFont',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                width: 80,
                color: Color(0xFF2F5093),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      color: Color(0xFF2F5093),
                      fontSize: 14,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                height: 1,
                width: 80,
                color: Color(0xFF2F5093),
              ),
            ],
          )
        ],
      ),
    );
  }
}
