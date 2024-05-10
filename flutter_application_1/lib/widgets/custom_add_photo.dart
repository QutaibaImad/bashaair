// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomAddPhoto extends StatelessWidget {
  final String varLabel;

  const CustomAddPhoto({super.key, required this.varLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 128,
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Color(0xFF255DAE),
                ),
                left: BorderSide(
                  color: Color(0xFF255DAE),
                ),
                right: BorderSide(
                  color: Color(0xFF255DAE),
                ),
              )),
              height: 91,
              width: 127,
              child: Center(
                child: Image.asset(
                  'assets/images/add_photo.png',
                  height: 36,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            child: Row(
              children: [
                Container(
                  color: Color(0xFF255DAE),
                  height: 1,
                  width: 28,
                ),
                Row(
                  children: [
                    Text(
                      varLabel,
                      style: TextStyle(
                          color: Color(0xFF255DAE),
                          fontSize: 12,
                          fontFamily: 'rFont',
                          fontWeight: FontWeight.w400),
                    ),
                    Text('*', style: TextStyle(color: Colors.red),)
                  ],
                ),
                Container(
                  color: Color(0xFF255DAE),
                  height: 1,
                  width: 50,
                ),
              ],
            ),
            top: 5,
          ),
        ],
      ),
    );
  }
}
