// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat_screens/alkarkh_chat.dart';
import 'package:flutter_application_1/chat_screens/alrusafa_chat.dart';

class GoScreen extends StatelessWidget {
  final String documentId;

  GoScreen({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final signedUser = FirebaseAuth.instance.currentUser;
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
          return
          
          
          data['isBlocked'] == 'yes' ? Scaffold(
            body: Center(child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 350),
          child: Text(
            'لقد تم حظرك',
            style: TextStyle(
                color: Color(0xFF255DAE),
                fontSize: 50,
                fontFamily: 'tFont',
                fontWeight: FontWeight.w400),
          ),
        ),
      ),)
          ):
          
          
          Scaffold(
              body: data['side'] == 'alkarkh'
                  ? AlkarkhChat(documentId: signedUser!.uid)
                  : AlrusafaChat(documentId: signedUser!.uid));
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
