// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_build_context_synchronously


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/add_post_screens/image_post_screen.dart';
import 'package:flutter_application_1/admin/add_post_screens/video_post_screen.dart';
import 'package:flutter_application_1/admin/block_screen.dart';
import 'package:flutter_application_1/admin/complaints_screen.dart';
import 'package:flutter_application_1/admin/content_screen.dart';
import 'package:flutter_application_1/admin/families_screen.dart';
import 'package:flutter_application_1/admin/management_screens/management_screen.dart';
import 'package:flutter_application_1/admin/members_screen.dart';
import 'package:flutter_application_1/admin/orders_screen.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/widgets/custom_admin_card.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class SuperVisorPanelScreen extends StatelessWidget {
  final String documentId;

  SuperVisorPanelScreen({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  Text(
                    'لوحة القيادة             ',
                    style: TextStyle(
                        color: Color(0xFF44474E),
                        fontSize: 20,
                        fontFamily: 'rFont',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 1,
                    width: 375,
                    color: Color(0xFFECECEC),
                  )
                ],
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FamiliesScreen()));
                        },
                        child: CustomAdminCard(
                            varImage: 'assets/images/diversity_1.png',
                            varLabel: 'العائلات'),
                      ),
                      InkWell(
                        onTap: () {
                          data['view_users'] == 'yes'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MembersScreen()))
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Container(
                                      height: 203,
                                      width: 320,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'هذا الاجراء غير مسموح به',
                                            style: TextStyle(
                                                color: Color(0xFF44474E),
                                                fontSize: 20,
                                                fontFamily: 'rFont',
                                                fontWeight: FontWeight.w500),
                                          ),
                                          TextButton(
                                            onPressed: () {
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
                        child: CustomAdminCard(
                            varImage: 'assets/images/diversity_3.png',
                            varLabel: 'الأعضاء'),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlockScreen()));
                        },
                        child: CustomAdminCard(
                            varImage: 'assets/images/group_off.png',
                            varLabel: 'الحظر'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManagementScreen()));
                        },
                        child: CustomAdminCard(
                            varImage: 'assets/images/military_tech.png',
                            varLabel: 'الادارة'),
                      ),
                      InkWell(
                        onTap: () {
                          data['edit_data'] == 'yes'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContentScreen()))
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Container(
                                      height: 203,
                                      width: 320,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'هذا الاجراء غير مسموح به',
                                            style: TextStyle(
                                                color: Color(0xFF44474E),
                                                fontSize: 20,
                                                fontFamily: 'rFont',
                                                fontWeight: FontWeight.w500),
                                          ),
                                          TextButton(
                                            onPressed: () {
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
                        child: CustomAdminCard(
                            varImage: 'assets/images/campaign.png',
                            varLabel: 'المحتوى'),
                      ),
                      InkWell(
                        onTap: () {
                          data['accept_enrolls'] == 'yes'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrdersScreen()))
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Container(
                                      height: 203,
                                      width: 320,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'هذا الاجراء غير مسموح به',
                                            style: TextStyle(
                                                color: Color(0xFF44474E),
                                                fontSize: 20,
                                                fontFamily: 'rFont',
                                                fontWeight: FontWeight.w500),
                                          ),
                                          TextButton(
                                            onPressed: () {
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
                        child: CustomAdminCard(
                            varImage: 'assets/images/assignment_ind.png',
                            varLabel: 'الطلبات'),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintsScreen()));
                    },
                    child: Container(
                      height: 44,
                      width: 278,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'صندوق الشكاوى',
                          style: TextStyle(
                              color: Color(0xFFFF3758),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'rFont'),
                        ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                      child: Container(
                        height: 44,
                        width: 134,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                                'assets/images/majesticons_door-exit.png',
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover),
                            Text(
                              'تسجيل الخروج',
                              style: TextStyle(
                                  color: Color(0xFFFF3758),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'rFont'),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        launchUrl(url as Uri);
                      },
                      child: Container(
                        height: 44,
                        width: 134,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/support_agent.png',
                                height: 30, width: 30, fit: BoxFit.cover),
                            Text(
                              'الدعم الفني',
                              style: TextStyle(
                                  color: Color(0xFFFF3758),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'rFont'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      data['add_post'] == 'yes'
                          ? showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      height: 203,
                      width: 320,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'نوع المحتوى',
                            style: TextStyle(
                                color: Color(0xFF44474E),
                                fontSize: 20,
                                fontFamily: 'rFont',
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 70,
                            width: 266,
                            child: Text(
                              'حدد نوع الملف المرفق مع المحتوى',
                              style: TextStyle(
                                  color: Color(0xFF44474E),
                                  fontSize: 16,
                                  fontFamily: 'rFont',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddImagePostScreen())),
                                child: const Text(
                                  'صوره',
                                  style: TextStyle(
                                      color: Color(0xFF255DAE),
                                      fontSize: 15,
                                      fontFamily: 'rFont',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddVideoPostScreen())),
                                child: const Text(
                                  'فيديو',
                                  style: TextStyle(
                                      color: Color(0xFF255DAE),
                                      fontSize: 15,
                                      fontFamily: 'rFont',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                          : showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Container(
                                  height: 203,
                                  width: 320,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'هذا الاجراء غير مسموح به',
                                        style: TextStyle(
                                            color: Color(0xFF44474E),
                                            fontSize: 20,
                                            fontFamily: 'rFont',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      TextButton(
                                        onPressed: () {
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
                        color: Color(0xFF2F5093),
                        height: 44,
                        width: 307,
                        child: Center(
                          child: Text(
                            'نشر خبر جديد',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'rFont'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Color(0xFF2F5093),
            ),
          ),
        );
      },
    );
  }
}
