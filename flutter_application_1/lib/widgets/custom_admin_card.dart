// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAdminCard extends StatelessWidget {
  final String varImage;
  final String varLabel;
  const CustomAdminCard({super.key, required this.varImage, required this.varLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF2F5093)),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Image.asset(
              varImage,
              height: 44,
              width: 44,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          varLabel,
          style: TextStyle(
              color: Color(0xFF255DAE),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'rFont'),
        )
      ],
    );
  }
}
