// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class EditOrderCard extends StatefulWidget {
  final String docId;
  final String name;
  final String title;
  final String cardNumber;
  final String centerName;
  final String certificate;
  final String childrenNumber;
  final String currentwork;
  final String day;
  final String father;
  final String fifthUrl;
  final String firstDistrict;
  final String firstUrl;
  final String fourthUrl;
  final String grandfather;
  final String linkName;
  final String linkPhoneNumber;
  final String momFather;
  final String momGrandFather;
  final String month;
  final String mother;
  final String point;
  final String secondDistrict;
  final String secondUrl;
  final String sixthUrl;
  final String skills;
  final String specialization;
  final String thirdUrl;
  final String year;
  final String phoneNumber;
  final String thirdDistrict;
  final String side;
  final String profileImage;
  final String submissionDate;
  final String sigUrl;

  EditOrderCard(
      {super.key,
      required this.sigUrl,
      required this.side,
      required this.name,
      required this.title,
      required this.cardNumber,
      required this.centerName,
      required this.certificate,
      required this.childrenNumber,
      required this.currentwork,
      required this.day,
      required this.father,
      required this.fifthUrl,
      required this.firstDistrict,
      required this.firstUrl,
      required this.fourthUrl,
      required this.grandfather,
      required this.linkName,
      required this.linkPhoneNumber,
      required this.momFather,
      required this.momGrandFather,
      required this.month,
      required this.mother,
      required this.point,
      required this.secondDistrict,
      required this.secondUrl,
      required this.sixthUrl,
      required this.skills,
      required this.specialization,
      required this.thirdUrl,
      required this.year,
      required this.phoneNumber,
      required this.thirdDistrict,
      required this.profileImage,
      required this.submissionDate,
      required this.docId});

  @override
  State<EditOrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<EditOrderCard> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0x33000000)),
            borderRadius: BorderRadius.circular(10)),
        width: 349,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  fontFamily: 'rFont'),
            ),
            Text(
              widget.certificate,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  fontFamily: 'rFont'),
            ),
            Container(
              height: 24,
              width: 66,
              decoration: BoxDecoration(
                color: Color(0xFF2F5093),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: Text(
                'الاستمارة',
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    fontFamily: 'rFont'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
