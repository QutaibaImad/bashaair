// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Color(0xFF2F5093),
        height: 44,
        width: 307,
        child: Center(
          child: Text(
            'تعديل',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 14,
              fontFamily: 'rFont',
            ),
          ),
        ),
      ),
    );
  }
}
