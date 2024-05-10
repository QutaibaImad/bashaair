// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String label;
  final String result;
  const DetailCard({super.key, required this.label, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        border: BorderDirectional(bottom: BorderSide(color: Colors.black)),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'rFont'),
              ),
              Text(
                result,
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'rFont'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
