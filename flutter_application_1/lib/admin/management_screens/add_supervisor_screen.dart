// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSupervisorScreen extends StatefulWidget {
  const AddSupervisorScreen({super.key});

  @override
  State<AddSupervisorScreen> createState() => _AddSupervisorScreenState();
}

class _AddSupervisorScreenState extends State<AddSupervisorScreen> {
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  bool isSelected = false;
  bool value = false;
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;
  bool fifthValue = false;
  bool sixthValue = false;
  bool seventhValue = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  TextEditingController searchNewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0x1A000000)),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: searchNewController,
                  onChanged: searchCard,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: 10),
                    border: InputBorder.none,
                    focusColor: Color(0x1A000000),
                    hintText: 'رقم هاتف المشرف الجديد',
                    hintStyle: TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'rFont'),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الصلاحيات',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: 'rFont'),
                    ),
                  ),
                  SizedBox(
                    height: 470,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return data[index]['phoneNumber'] ==
                                searchNewController.text
                            ? SizedBox(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x33000000)),
                                      ),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'نشر الاخبار والبيانات',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 137),
                                          Checkbox(
                                              value: firstValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'add_post': firstValue == true
                                                      ? 'no'
                                                      : 'yes',
                                                });

                                                setState(() {
                                                  firstValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x33000000)),
                                      ),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'تعديل البيانات',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 172),
                                          Checkbox(
                                              value: secondValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'edit_data':
                                                      secondValue == true
                                                          ? 'no'
                                                          : 'yes',
                                                });

                                                setState(() {
                                                  secondValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x33000000)),
                                      ),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'حظر الاعضاء',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 180),
                                          Checkbox(
                                              value: thirdValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'block_users':
                                                      thirdValue == true
                                                          ? 'no'
                                                          : 'yes',
                                                });

                                                setState(() {
                                                  thirdValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x33000000)),
                                      ),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'قبول الانتماءات',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 162),
                                          Checkbox(
                                              value: fourthValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'accept_enrolls':
                                                      fourthValue == true
                                                          ? 'no'
                                                          : 'yes',
                                                });

                                                setState(() {
                                                  fourthValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x33000000)),
                                      ),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'حذف / اضافة مشرف جديد',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 95),
                                          Checkbox(
                                              value: fifthValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'delete_add_supervisor':
                                                      fifthValue == true
                                                          ? 'no'
                                                          : 'yes',
                                                });

                                                setState(() {
                                                  fifthValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0x33000000)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'الاطلاع على قوائم الاعضاء',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 93),
                                          Checkbox(
                                              value: sixthValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'view_users':
                                                      sixthValue == true
                                                          ? 'no'
                                                          : 'yes',
                                                });

                                                setState(() {
                                                  sixthValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0x33000000)),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      width: w,
                                      height: 56,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'الاطلاع على قوائم المشرفون',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(width: 75),
                                          Checkbox(
                                              value: seventhValue,
                                              onChanged: (value) async {
                                                await users
                                                    .doc(data[index]['docId'])
                                                    .update({
                                                  'view_supervisors':
                                                      seventhValue == true
                                                          ? 'no'
                                                          : 'yes',
                                                });

                                                setState(() {
                                                  seventhValue = value!;
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                  ],
                                ),
                              )
                            : Container();
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
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
              //           'اضافة',
              //           style: TextStyle(
              //               color: Color(0xFFFFFFFF),
              //               fontWeight: FontWeight.w900,
              //               fontSize: 14,
              //               fontFamily: 'rFont'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void searchCard(String query) {
    final suggestions = data.where((varCard) {
      final cardNumber = varCard['phoneNumber'].toLowerCase();
      final input = query.toLowerCase();
      return cardNumber.contains(input);
    }).toList();
    setState(() {
      data = suggestions;
    });
  }
}
