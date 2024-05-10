// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/enroll_screens/alkarkh_enroll_screen.dart';
import 'package:flutter_application_1/enroll_screens/alrusafa_enroll_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstEnrollScreen extends StatefulWidget {
  const FirstEnrollScreen({super.key});

  @override
  State<FirstEnrollScreen> createState() => _FirstEnrollScreenState();
}

class _FirstEnrollScreenState extends State<FirstEnrollScreen> {


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 203,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'في أي جانب تسكن ؟',
                  style: TextStyle(
                      color: Color(0xFF44474E),
                      fontSize: 20,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'تأكد من أختيار جانب بغداد الذي يمثلك',
                  style: TextStyle(
                      color: Color(0xFF44474E),
                      fontSize: 16,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AlkarkhEnrollScreen()));
                        
                      },
                      child: const Text(
                        'الكرخ',
                        style: TextStyle(
                            color: Color(0xFF255DAE),
                            fontSize: 15,
                            fontFamily: 'rFont',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlrusafaEnrollScreen())),
                      child: const Text(
                        'الرصافه',
                        style: TextStyle(
                            color: Color(0xFF255DAE),
                            fontSize: 15,
                            fontFamily: 'rFont',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 350),
          child: Text(
            'البشائر هويتنا',
            style: TextStyle(
                color: Color(0xFF255DAE),
                fontSize: 60,
                fontFamily: 'tFont',
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
