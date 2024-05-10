// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable


import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  final String varTitle;
  final String varDescription;
  final String varImage;

  NewsCard(
      {super.key,
      required this.varTitle,
      required this.varDescription,
      required this.varImage});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          color: Color(0xFFD9D9D9),
          child: Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.varImage,
                      height: 252,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          width: 327,
                          child: Text(
                            widget.varTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF191F33),
                              fontSize: 17,
                              fontFamily: 'bFont',
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(
                          widget.varDescription,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF767E94),
                            fontSize: 14,
                            fontFamily: 'rFont',
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/images/Eye.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'لا توجد مشاهدات',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF464D61),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/ShareNetwork.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
