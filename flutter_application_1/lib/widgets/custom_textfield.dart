// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String varLabel;
  final TextEditingController varController;

  const CustomTextField(
      {super.key, required this.varLabel, required this.varController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 56,
        width: 200,
        child: TextFormField(
          controller: varController,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text(
                varLabel,
                style: TextStyle(
                    color: Color(0xFF255DAE),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'rFont'),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2F5093)))),
        ),
      ),
    );
  }
}
