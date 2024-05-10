// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/enroll_screens/first_enroll_screen.dart';

class CanNotDialog extends StatefulWidget {
  const CanNotDialog({super.key});

  @override
  State<CanNotDialog> createState() => _CanNotDialogState();
}

class _CanNotDialogState extends State<CanNotDialog> {
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
                  'غير مسموح',
                  style: TextStyle(
                      color: Color(0xFF44474E),
                      fontSize: 20,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 70,
                  width: 266,
                  child: Text(
                    'هذا القسم مخصص للأعضاء المنتمين يمكنك إتمام إجراءات الإنظمام الان',
                    style: TextStyle(
                        color: Color(0xFF44474E),
                        fontSize: 16,
                        fontFamily: 'rFont',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'الغاء',
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
                              builder: (context) => FirstEnrollScreen())),
                      child: const Text(
                        'انظمام',
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
