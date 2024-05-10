// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_this, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class EditPostsScreen extends StatelessWidget {
  final String documentId;
  EditPostsScreen({super.key, required this.documentId});

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  CollectionReference news = FirebaseFirestore.instance.collection('news');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تعديل/ حذف المحتوى',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0x1A000000))),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10),
                        border: InputBorder.none,
                        focusColor: Color(0x1A000000),
                        hintText: 'العنوان الجديد',
                        hintStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0x1A000000))),
                    child: TextFormField(
                      minLines: 7,
                      maxLines: 7,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10, top: 5),
                        border: InputBorder.none,
                        hintText: 'النص الجديد',
                        hintStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  await news.doc(documentId).update({
                    'title': titleController.text,
                    'description': descriptionController.text,
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
                    color: Color(0xFF2F5093),
                    height: 44,
                    width: 307,
                    child: Center(
                      child: Text(
                        'تعديل',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            fontFamily: 'rFont'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection('news')
                      .doc(documentId)
                      .delete();
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
                        'حذف المحتوى',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            fontFamily: 'rFont'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
