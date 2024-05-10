// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, unused_element, avoid_print, unused_import, must_be_immutable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/detail_card.dart';

class MemberDetailScreen extends StatelessWidget {
  final String documentId;
  final String name;
  final String title;

  final String father;
  final String grandfather;
  final String mother;
  final String momFather;
  final String momGrandFather;
  final String year;
  final String day;
  final String month;
  final String childrenNumber;
  final String side;
  final String thirdDistrict;
  final String certificate;
  final String skills;
  final String currentWork;
  final String cardNumber;
  final String centerName;

  final String linkName;
  final String linkPhoneNumber;
  final String firstUrl;
  final String secondUrl;
  final String thirdUrl;
  final String fourthUrl;
  final String fifthUrl;
  final String sixthUrl;
  final String firstDistrict;
  final String secondDistrict;
  final String profileImage;
  final String point;
  final String sigUrl;

  MemberDetailScreen(
      {super.key,
      required this.point,
      required this.sigUrl,
      required this.documentId,
      required this.name,
      required this.father,
      required this.grandfather,
      required this.mother,
      required this.momFather,
      required this.momGrandFather,
      required this.year,
      required this.day,
      required this.month,
      required this.childrenNumber,
      required this.side,
      required this.thirdDistrict,
      required this.certificate,
      required this.skills,
      required this.currentWork,
      required this.cardNumber,
      required this.centerName,
      required this.linkName,
      required this.linkPhoneNumber,
      required this.title,
      required this.firstUrl,
      required this.secondUrl,
      required this.thirdUrl,
      required this.fourthUrl,
      required this.fifthUrl,
      required this.sixthUrl,
      required this.firstDistrict,
      required this.secondDistrict,
      required this.profileImage});
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'معلومات العضو',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: Color(0xFFECECEC),
                height: 1,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 143,
              width: 136,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.network(
                profileImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
              child: Column(
                children: [
                  DetailCard(result: name, label: 'الاسم الرباعي'),
                  DetailCard(result: title, label: 'اللقب'),
                  DetailCard(result: mother, label: 'اسم الام'),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.black)),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تأريخ التولد',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                            Row(
                              children: [
                                Text(
                                  year,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  day,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  month,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  DetailCard(
                      result: childrenNumber, label: 'الحاله الاجتماعيه'),
                  DetailCard(result: childrenNumber, label: 'غدد الاولاد'),
                  DetailCard(result: childrenNumber, label: 'رقم الهاتف'),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.black)),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'محل السكن',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                            Row(
                              children: [
                                Text(
                                  'بفداد',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  firstDistrict,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  secondDistrict,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  DetailCard(result: side, label: 'جانب'),
                  DetailCard(result: thirdDistrict, label: 'اقرب نقطه داله'),
                  DetailCard(result: certificate, label: 'الشهادة'),
                  DetailCard(result: skills, label: 'المواهب'),
                  DetailCard(result: currentWork, label: 'العمل الحالي'),
                  DetailCard(result: centerName, label: 'اسم المركز الانتخابي'),
                  DetailCard(result: cardNumber, label: 'رقم هوية الناخب'),
                  DetailCard(result: linkName, label: 'اسم الرابط'),
                  DetailCard(result: linkPhoneNumber, label: 'رقم هاتف الرابط'),
                  SizedBox(height: 5),
                  Container(
                    height: 227,
                    width: 363,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1,
                    )),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          sigUrl,
                          height: 227,
                          width: 363,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        firstUrl,
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        secondUrl,
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        thirdUrl,
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        fourthUrl,
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        fifthUrl,
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        sixthUrl,
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(5),
                  //     child: Container(
                  //       color: Color(0xFF2F5093),
                  //       height: 44,
                  //       width: 307,
                  //       child: Center(
                  //         child: Text(
                  //           'تصدير',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontFamily: 'rFont',
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w900),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      await users.doc(documentId).update({
                        'isBlocked': 'yes',
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Container(
                            height: 203,
                            width: 320,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'تمت العمليه بنجاح',
                                  style: TextStyle(
                                      color: Color(0xFF44474E),
                                      fontSize: 20,
                                      fontFamily: 'rFont',
                                      fontWeight: FontWeight.w500),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'حسنا',
                                    style: TextStyle(
                                        color: Color(0xFF255DAE),
                                        fontSize: 15,
                                        fontFamily: 'rFont',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Color(0xFFC41010),
                        height: 44,
                        width: 307,
                        child: Center(
                          child: Text(
                            'حظر',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'rFont',
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
