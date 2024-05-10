// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, sized_box_for_whitespace


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/add_post_screens/image_post_screen.dart';
import 'package:flutter_application_1/admin/add_post_screens/video_post_screen.dart';
import 'package:flutter_application_1/admin/block_screen.dart';
import 'package:flutter_application_1/admin/complaints_screen.dart';
import 'package:flutter_application_1/admin/content_screen.dart';
import 'package:flutter_application_1/admin/edit_orders_screen.dart';
import 'package:flutter_application_1/admin/families_screen.dart';
import 'package:flutter_application_1/admin/management_screens/management_screen.dart';
import 'package:flutter_application_1/admin/members_screen.dart';
import 'package:flutter_application_1/admin/orders_screen.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/widgets/custom_admin_card.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://wa.me/9647827069000');
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              '   لوحة القيادة             ',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MembersScreen()));
                  },
                  child: CustomAdminCard(
                      varImage: 'assets/images/diversity_3.png',
                      varLabel: 'الأعضاء'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BlockScreen()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContentScreen()));
                  },
                  child: CustomAdminCard(
                      varImage: 'assets/images/campaign.png',
                      varLabel: 'المحتوى'),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          height: 203,
                          width: 320,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'نوع الطلبات',
                                style: TextStyle(
                                    color: Color(0xFF44474E),
                                    fontSize: 20,
                                    fontFamily: 'rFont',
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'حدد نوع الطلبات الذي تريده',
                                style: TextStyle(
                                    color: Color(0xFF44474E),
                                    fontSize: 16,
                                    fontFamily: 'rFont',
                                    fontWeight: FontWeight.w400),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrdersScreen())),
                                    child: const Text(
                                      'طلبات الانتماء',
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
                                                EditOrdersScreen())),
                                    child: const Text(
                                      'طلبات التعديل',
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
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
                      Image.asset('assets/images/majesticons_door-exit.png',
                          height: 30, width: 30, fit: BoxFit.cover),
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
                  launchUrl(url);
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
                showDialog(
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
                          Text(
                            'حدد نوع الملف المرفق مع المحتوى',
                            style: TextStyle(
                                color: Color(0xFF44474E),
                                fontSize: 16,
                                fontFamily: 'rFont',
                                fontWeight: FontWeight.w400),
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
}
