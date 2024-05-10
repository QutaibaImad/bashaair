// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables, sort_child_properties_last, sized_box_for_whitespace, unused_local_variable, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/admin_panel_screen.dart';
import 'package:flutter_application_1/auth/first_reset_screen.dart';
import 'package:flutter_application_1/navigations/user_navigation2.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تسجيل الدخول',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'البشائر هويتنا',
                style: TextStyle(
                    color: Color(0xFF255DAE),
                    fontSize: 60,
                    fontFamily: 'tFont',
                    fontWeight: FontWeight.w400),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 56,
                  width: 220,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: Text(
                          'البريد الالكتروني',
                          style: TextStyle(
                              color: Color(0xFF255DAE),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'rFont'),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF2F5093)))),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 56,
                  width: 220,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: Text(
                          'كلمة المرور',
                          style: TextStyle(
                              color: Color(0xFF255DAE),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'rFont'),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF2F5093)))),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (emailController.text == 'admin@gmail.com') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminPanelScreen()));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Color(0xFF2F5093),
                    height: 44,
                    width: 307,
                    child: Center(
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          fontFamily: 'rFont',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 1,
                    width: 80,
                    color: Color(0xFF2F5093),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => firstResetScreen()));
                    },
                    child: Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(
                          color: Color(0xFF2F5093),
                          fontSize: 14,
                          fontFamily: 'rFont',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 80,
                    color: Color(0xFF2F5093),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
