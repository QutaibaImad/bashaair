// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_declarations, unused_local_variable, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/edit_posts_screen.dart';
import 'package:flutter_application_1/widgets/video_player_widget.dart';
import 'package:share_plus/share_plus.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  bool isLoading = true;
  List<QueryDocumentSnapshot> newsData = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('news').get();
    newsData.addAll(querySnapshot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المحتوى',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF2F5093),
                ),
              )
            : ListView.builder(
                // itemCount: newsData.length,
                itemCount: newsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPostsScreen(
                                  documentId: newsData[index].id)));
                    },
                    child: Padding(
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
                                    child: newsData[index]['type'] == 'image'
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
                                              fontWeight: FontWeight.w500,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Image.asset(
                                            'assets/images/Eye.png',
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                    ),
                  );
                },
              ),
      ),
    );
  }
}
