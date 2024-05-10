// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_complaint_screen.dart';
import 'package:flutter_application_1/screens/details_screen.dart';
import 'package:flutter_application_1/screens/supervisor_panel_screen.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  final String documentId;

  CustomDrawer({required this.documentId});

  @override
  Widget build(BuildContext context) {
    final Uri url =
        Uri.parse('https://sites.google.com/view/codecraftersn/home');

    final credential = FirebaseAuth.instance.currentUser;
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
          return Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 35,
              ),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      title: Text(
                        data['name'],
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                      subtitle: Text(
                        '',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          data['profileImage'],
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuperVisorPanelScreen(
                                    documentId: credential!.uid)));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color(0xFF255DAE),
                            height: 23,
                            width: 211,
                            child: Center(
                              child: Text(
                                'لوحة التحكم',
                                style: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: 'rFont'),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Image.asset(
                          'assets/images/inventory.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()));
                        },
                        child: Text(
                          'تحديث معلوماتي',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ),
                    ]),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('add-family-member-screen', arguments: {
                          'familyId': data['docId'],
                        });
                      },
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Image.asset(
                            'assets/images/diversity_3.png',
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'الانتماء العائلي',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Image.asset(
                            'assets/images/Tab1.png',
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'بيانات واخبار الحركه',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddComplaintScreen(
                                      documentId: FirebaseAuth
                                          .instance.currentUser!.uid,
                                    )));
                      },
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: Icon(Icons.edit_document)),
                        Text(
                          'تقديم شكوى',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Image.asset(
                            'assets/images/phonelink_lock.png',
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        credential!.delete();
                      },
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: Icon(Icons.delete)),
                        Text(
                          'حذف حسابي',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(url);
                      },
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: Icon(Icons.edit_document)),
                        Text(
                          'سياسة الخصوصية',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'الإصدار 0.01',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: 'rFont'),
                    ),
                    Text(
                      'البشائر هويتنا',
                      style: TextStyle(
                          color: Color(0xFF255DAE),
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          fontFamily: 'tFont'),
                    ),
                    Text(
                      'جميع الحقوق محفوظة',
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
