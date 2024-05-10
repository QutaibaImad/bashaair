// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_declarations, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_screens/go_screen.dart';
import 'package:flutter_application_1/enroll_screens/first_enroll_screen.dart';
import 'package:flutter_application_1/widgets/can_not_dialog.dart';
import 'package:flutter_application_1/widgets/custom_drawer.dart';
import 'package:flutter_application_1/widgets/video_player_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<QueryDocumentSnapshot> newsData = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('news').get();
    newsData.addAll(querySnapshot.docs);
    isLoading = false;
    if (this.mounted) {
      setState(() {
        // Your state change code goes here
      });
    }
  }

  var name;
  var gather;
  var grandfather;
  var title;
  var mother;
  var momFather;
  var momGrandFather;
  var month;
  var day;
  var year;
  var point;
  var childrenNumber;
  var firstDistrict;
  var secondDistrict;
  var thirdDistrict;
  var certificate;
  var specialization;
  var skills;
  var currentWork;
  var cardNumber;
  var centerName;
  var linkName;
  var linkPhoneNumber;
  var phoneNumber;
  var email;
  var password;

  getPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString('name');
    });
  }

  @override
  void initState() {
    getPrefs();
    getData();
    super.initState();
  }

  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return credential != null
        ? Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                height: 67,
                width: 67,
                child: FloatingActionButton(
                    shape: CircleBorder(),
                    backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstEnrollScreen()));
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/inventory.png',
                                height: 31, width: 31, fit: BoxFit.cover),
                            Text(
                              'انتماء',
                              style: TextStyle(
                                  color: Color(0xFF2F5093),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  fontFamily: 'rFont'),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            drawer: CustomDrawer(
              documentId: credential!.uid,
            ),
            appBar: AppBar(
              title: Text(
                'بيانات وأخبار الحركة',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'rFont'),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF2F5093),
                          ),
                        )
                      : ListView.builder(
                          itemCount: newsData.length,
                          itemBuilder: (BuildContext context, int index) {
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: newsData[index]['type'] ==
                                                    'image'
                                                ? Image.network(
                                                    '${newsData[index]['url']}',
                                                    height: 252,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  )
                                                : VideoPlayerItem(
                                                    videoUrl:
                                                        '${newsData[index]['url']}',
                                                  ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 20),
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 327,
                                                  child: Text(
                                                    '${newsData[index]['title']}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF191F33),
                                                      fontSize: 17,
                                                      fontFamily: 'bFont',
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Text(
                                                  '${newsData[index]['description']}',
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
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Image.asset(
                                                    'assets/images/Eye.png',
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    'لا توجد مشاهدات',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF464D61),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Share.share(
                                                          '${newsData[index]['description']}',
                                                          subject:
                                                              '${newsData[index]['title']}');
                                                    },
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
                          },
                        ),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: 69,
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 30,
                            spreadRadius: -15)
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Tab1.png',
                                  height: 29, width: 30, fit: BoxFit.cover),
                              Text(
                                'الرئيسيه',
                                style: TextStyle(
                                    color: Color(0xFF2F5093),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'rFont'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FirebaseAuth.instance.currentUser !=
                                                null
                                            ? GoScreen(
                                                documentId: FirebaseAuth
                                                    .instance.currentUser!.uid,
                                              )
                                            : CanNotDialog(),
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Union.png',
                                    height: 33, width: 33, fit: BoxFit.cover),
                                Text(
                                  'الدردشة',
                                  style: TextStyle(
                                      color: Color(0xFF2F5093),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      fontFamily: 'rFont'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                height: 67,
                width: 67,
                child: FloatingActionButton(
                    shape: CircleBorder(),
                    backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstEnrollScreen()));
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/inventory.png',
                                height: 31, width: 31, fit: BoxFit.cover),
                            Text(
                              'انتماء',
                              style: TextStyle(
                                  color: Color(0xFF2F5093),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  fontFamily: 'rFont'),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            appBar: AppBar(
              title: Text(
                'بيانات وأخبار الحركة',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'rFont'),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF2F5093),
                          ),
                        )
                      : ListView.builder(
                          itemCount: newsData.length,
                          itemBuilder: (BuildContext context, int index) {
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: newsData[index]['type'] ==
                                                    'image'
                                                ? Image.network(
                                                    '${newsData[index]['url']}',
                                                    height: 252,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  )
                                                : VideoPlayerItem(
                                                    videoUrl:
                                                        '${newsData[index]['url']}',
                                                  ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 20),
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 327,
                                                  child: Text(
                                                    '${newsData[index]['title']}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF191F33),
                                                      fontSize: 17,
                                                      fontFamily: 'bFont',
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Text(
                                                  '${newsData[index]['description']}',
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
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Image.asset(
                                                    'assets/images/Eye.png',
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    'لا توجد مشاهدات',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF464D61),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      print(name);
                                                      await Share.share(
                                                          '${newsData[index]['description']}',
                                                          subject:
                                                              '${newsData[index]['title']}          ');
                                                    },
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
                          },
                        ),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: 69,
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 30,
                            spreadRadius: -15)
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Tab1.png',
                                  height: 29, width: 30, fit: BoxFit.cover),
                              Text(
                                'الرئيسيه',
                                style: TextStyle(
                                    color: Color(0xFF2F5093),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'rFont'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FirebaseAuth.instance.currentUser !=
                                                null
                                            ? GoScreen(
                                                documentId: FirebaseAuth
                                                    .instance.currentUser!.uid,
                                              )
                                            : CanNotDialog(),
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Union.png',
                                    height: 33, width: 33, fit: BoxFit.cover),
                                Text(
                                  'الدردشة',
                                  style: TextStyle(
                                      color: Color(0xFF2F5093),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      fontFamily: 'rFont'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
