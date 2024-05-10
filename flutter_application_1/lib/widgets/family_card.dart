import 'package:flutter/material.dart';

class FamilyCard extends StatelessWidget {
  final String name;
  final String number;
  final String phoneNumber;
  final String father;
  final String grandfather;
  final String title;

  const FamilyCard(
      {super.key,
      required this.father,
      required this.grandfather,
      required this.name,
      required this.number,
      required this.phoneNumber,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0x33000000)),
            borderRadius: BorderRadius.circular(10)),
        width: 349,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'رب الاسرة',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'rFont'),
                    ),
                    // Text(
                    //   ' | ',
                    //   style: TextStyle(
                    //       color: Color(0xFF000000),
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 13,
                    //       fontFamily: 'rFont'),
                    // ),
                    // Text(
                    //   ' عدد الافراد ',
                    //   style: TextStyle(
                    //       color: Color(0xFF000000),
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 13,
                    //       fontFamily: 'rFont'),
                    // ),
                    // Text(
                    //   '(${number})',
                    //   style: TextStyle(
                    //       color: Color(0xFF000000),
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 13,
                    //       fontFamily: 'rFont'),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${name}',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'rFont'),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${father}',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'rFont'),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${grandfather}',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'rFont'),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${title}',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'rFont'),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/ads_click.png',
                    height: 17, width: 17, fit: BoxFit.cover),
                Text(
                  '${phoneNumber}',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      fontFamily: 'rFont'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}
