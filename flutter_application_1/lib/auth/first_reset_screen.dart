// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables, sort_child_properties_last, sized_box_for_whitespace, camel_case_types



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_screen.dart';

class firstResetScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  firstResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اعادة تعيين كلمة المرور',
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
              Container(
                height: 40,
                width: 240,
                child: Text(
                  'تأكد من أدخال المعلومات المطلوبة بدقة لتتمكن من استعادة حسابك',
                  style: TextStyle(
                      color: Color(0xFF44474E),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'rFont'),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 56,
                  width: 250,
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
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailController.text);

                  Navigator.pop(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Color(0xFF2F5093),
                    height: 44,
                    width: 307,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('     '),
                          Text(
                            'انتهى',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontFamily: 'rFont',
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
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
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'تسجيل الدخول',
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
