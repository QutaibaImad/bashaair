// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, avoid_print, unused_element

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AlkarkhChat extends StatefulWidget {
  final String documentId;

  AlkarkhChat({required this.documentId});

  @override
  State<AlkarkhChat> createState() => _AlkarkhChatState();
}

class _AlkarkhChatState extends State<AlkarkhChat> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final signedUser = FirebaseAuth.instance.currentUser;
    final credential = FirebaseAuth.instance.currentUser;
    TextEditingController messageController = TextEditingController();
    ScrollController _scrollController = ScrollController();

    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');

    final Stream<QuerySnapshot> messagesStream = FirebaseFirestore.instance
        .collection('messages')
        .orderBy('time')
        .snapshots();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final w = MediaQuery.of(context).size.width;
    final currentUser = signedUser!.email;

    File? file;

    String? url;

    getImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? imageCamera =
          await picker.pickImage(source: ImageSource.camera);
      if (imageCamera != null) {
        file = File(imageCamera.path);

        var imageName = basename(imageCamera.path);

        var refStorage =
            FirebaseStorage.instance.ref('alkarkhChatImages/$imageName');
        await refStorage.putFile(file!);
        url = await refStorage.getDownloadURL();
      }
      messages
          .add({
            'url': url ?? 'none',
            'messageType': 'image',
            'senderEmail': signedUser.email,
            'time': FieldValue.serverTimestamp(),
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      setState(() {});
    }

    String? deletedValue;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
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
              title: Text(
                'تجمع الكرخ    ',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'rFont'),
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              height: h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h / 1.350,
                      width: double.infinity,
                      child: StreamBuilder(
                          stream: messagesStream,
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('error');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('waiting');
                            }
                            return ListView.builder(
                              
                              scrollDirection: Axis.vertical,
                              controller: _scrollController,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                
                                return snapshot.data!.docs[index]
                                            ['messageType'] ==
                                        'text'
                                    ? Padding(
                                        padding: currentUser ==
                                                snapshot.data!.docs[index]
                                                    ['senderEmail']
                                            ? EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                left: 85,
                                                right: 0)
                                            : EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                left: 0,
                                                right: 85),
                                        child: UnconstrainedBox(
                                          child: currentUser ==
                                                  snapshot.data!.docs[index]
                                                      ['senderEmail']
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 45),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: Image.network(
                                                          '${snapshot.data!.docs[index]['profileImage']}',
                                                          height: 32,
                                                          width: 32,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          vertical: 15,
                                                        ),
                                                        width: 252,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF3369FF),
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              bottomLeft: Radius
                                                                  .circular(25),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25)),
                                                        ),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Text(
                                                              '${snapshot.data!.docs[index]['messageText']}',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'rFont'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          vertical: 15,
                                                        ),
                                                        width: 252,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          25),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          25),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          25)),
                                                        ),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Text(
                                                              '${snapshot.data!.docs[index]['messageText']}',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF656565),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'rFont'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 45),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: Image.network(
                                                          '${snapshot.data!.docs[index]['profileImage']}',
                                                          height: 32,
                                                          width: 32,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      )
                                    : Padding(
                                        padding: currentUser ==
                                                snapshot.data!.docs[index]
                                                    ['senderEmail']
                                            ? EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                left: 140,
                                                right: 0)
                                            : EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                                right: 140,
                                                left: 0),
                                        child: UnconstrainedBox(
                                          child: currentUser ==
                                                  snapshot.data!.docs[index]
                                                      ['senderEmail']
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 140),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: Image.network(
                                                          '${snapshot.data!.docs[index]['profileImage']}',
                                                          height: 32,
                                                          width: 32,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          '${snapshot.data!.docs[index]['url']}',
                                                          height: 150,
                                                          width: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          '${snapshot.data!.docs[index]['url']}',
                                                          height: 150,
                                                          width: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 140),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: Image.network(
                                                          '${snapshot.data!.docs[index]['profileImage']}',
                                                          height: 32,
                                                          width: 32,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      );
                              },
                            );
                          }),
                    ),
                    Container(
                      height: h / 8.5,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 56,
                          width: 333,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 189, 183, 183),
                                blurRadius: 5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 237,
                                child: TextField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 15),
                                    border: InputBorder.none,
                                    hintText: '  اكتب رسالتك هنا',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFA1A1A1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final ImagePicker picker = ImagePicker();
                                  final XFile? imageCamera = await picker
                                      .pickImage(source: ImageSource.gallery);
                                  if (imageCamera != null) {
                                    file = File(imageCamera.path);

                                    var imageName = basename(imageCamera.path);

                                    var refStorage = FirebaseStorage.instance
                                        .ref('alkarkhChatImages/$imageName');
                                    await refStorage.putFile(file!);
                                    url = await refStorage.getDownloadURL();
                                  }

                                  if (url != null) {
                                    messages
                                        .add({
                                          'url': url ?? 'none',
                                          'messageType': 'image',
                                          'senderEmail': signedUser.email,
                                          'time': FieldValue.serverTimestamp(),
                                          'profileImage': data['profileImage'],
                                        })
                                        .then((value) => print("User Added"))
                                        .catchError((error) => print(
                                            "Failed to add user: $error"));
                                    setState(() {});
                                  }
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color(0xFFC7C7C7),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                  await messages
                                      .add({
                                        'messageText': messageController.text,
                                        'senderEmail': signedUser.email,
                                        'time': FieldValue.serverTimestamp(),
                                        'profileImage': data['profileImage'],
                                        'messageType': 'text',
                                      })
                                      .then((value) => print("User Added"))
                                      .catchError((error) =>
                                          print("Failed to add user: $error"));
                                  messageController.clear();
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.send,
                                    color: Color.fromRGBO(51, 105, 255, 1),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ),
                              ),
                            ],
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
