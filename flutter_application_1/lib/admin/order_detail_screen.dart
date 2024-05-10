// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, unused_element, avoid_print, use_build_context_synchronously, sized_box_for_whitespace


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/detail_card.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'معلومات العضو',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: Color(0xFFECECEC),
                height: 1,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 96,
              width: 96,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 5, left: 5),
              child: Column(
                children: [
                  DetailCard(
                      result: '${routeArgument['name']}',
                      label: 'الاسم الرباعي'),
                  DetailCard(
                      result: '${routeArgument['title']}', label: 'اللقب'),
                  DetailCard(
                      result: '${routeArgument['mother']}', label: 'اسم الام'),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.black)),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تأريخ التولد',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${routeArgument['year']}',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  '${routeArgument['day']}',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  '${routeArgument['month']}',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  DetailCard(
                      result: '${routeArgument['point']}',
                      label: 'الحاله الاجتماعيه'),
                  DetailCard(
                      result: '${routeArgument['childrenNumber']}',
                      label: 'غدد الاولاد'),
                  DetailCard(
                      result: '${routeArgument['phoneNumber']}',
                      label: 'رقم الهاتف'),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(color: Colors.black)),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'محل السكن',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'rFont'),
                            ),
                            Row(
                              children: [
                                Text(
                                  'بفداد',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  '${routeArgument['firstDistrict']}',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                                Text('/'),
                                Text(
                                  '${routeArgument['secondDistrict']}',
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      fontFamily: 'rFont'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  DetailCard(
                      result: '${routeArgument['thirdDistrict']}',
                      label: 'اقرب نقطه داله'),
                  DetailCard(
                      result: '${routeArgument['secondDistrict']}',
                      label: 'اقرب نقطه داله'),
                  DetailCard(
                      result: '${routeArgument['certificate']}',
                      label: 'الشهادة'),
                  DetailCard(
                      result: '${routeArgument['skills']}', label: 'المواهب'),
                  DetailCard(
                      result: '${routeArgument['currentWork']}',
                      label: 'العمل الحالي'),
                  DetailCard(
                      result: '${routeArgument['centerName']}',
                      label: 'اسم المركز الانتخابي'),
                  DetailCard(
                      result: '${routeArgument['cardNumber']}',
                      label: 'رقم هوية الناخب'),
                  DetailCard(
                      result: '${routeArgument['linkName']}',
                      label: 'اسم الرابط'),
                  DetailCard(
                      result: '${routeArgument['linkPhoneNumber']}',
                      label: 'رقم هاتف الرابط'),
                  // DetailCard(
                  //     result: '${routeArgument['submissionDate']}',
                  //     label: 'تاريخ ملئ الاستمارة'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 227,
                    width: 363,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1,
                    )),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          '${routeArgument['sigUrl']}',
                          height: 227,
                          width: 363,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${routeArgument['firstUrl']}',
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),

                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${routeArgument['secondUrl']}',
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${routeArgument['thirdUrl']}',
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${routeArgument['fourthUrl']}',
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${routeArgument['fifthUrl']}',
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        '${routeArgument['sixthUrl']}',
                        height: 227,
                        width: 363,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: '${routeArgument['email']}',
                          password: '${routeArgument['password']}',
                        );

                        final credential = FirebaseAuth.instance.currentUser;
                        CollectionReference users =
                            FirebaseFirestore.instance.collection('users');

                        users
                            .doc(credential!.uid)
                            .set({
                              'familyMode': '${routeArgument['familyMode']}',
                              'type': '${routeArgument['type']}',
                              'sigUrl': '${routeArgument['sigUrl']}',
                              'side': '${routeArgument['side']}',
                              'submissionDate':
                                  '${routeArgument['submissionDate']}',
                              'profileImage':
                                  '${routeArgument['profileImage']}',
                              'email': '${routeArgument['email']}',
                              'password': '${routeArgument['password']}',
                              'sixthUrl': '${routeArgument['sixthUrl']}',
                              'fifthUrl': '${routeArgument['fifthUrl']}',
                              'fourthUrl': '${routeArgument['fourthUrl']}',
                              'thirdUrl': '${routeArgument['thirdUrl']}',
                              'secondUrl': '${routeArgument['secondUrl']}',
                              'firstUrl': '${routeArgument['firstUrl']}',
                              'linkPhoneNumber':
                                  '${routeArgument['linkPhoneNumber']}',
                              'linkName': '${routeArgument['linkName']}',
                              'cardNumber': '${routeArgument['cardNumber']}',
                              'centerName': '${routeArgument['centerName']}',
                              'currentWork': '${routeArgument['currentWork']}',
                              'skills': '${routeArgument['skills']}',
                              'certificate': '${routeArgument['certificate']}',
                              'thirdDistrict':
                                  '${routeArgument['thirdDistrict']}',
                              'secondDistrict':
                                  '${routeArgument['secondDistrict']}',
                              'firstDistrict':
                                  '${routeArgument['firstDistrict']}',
                              'phoneNumber': '${routeArgument['phoneNumber']}',
                              'childrenNumber':
                                  '${routeArgument['childrenNumber']}',
                              'point': '${routeArgument['point']}',
                              'month': '${routeArgument['month']}',
                              'day': '${routeArgument['day']}',
                              'year': '${routeArgument['year']}',
                              'mother': '${routeArgument['mother']}',
                              'title': '${routeArgument['title']}',
                              'name': '${routeArgument['name']}',
                              'father': '${routeArgument['father']}',
                              'specialization':
                                  '${routeArgument['specialization']}',
                              'momGrandFather':
                                  '${routeArgument['momGrandFather']}',
                              'momFather': '${routeArgument['momFather']}',
                              'grandfather': '${routeArgument['grandfather']}',
                              'docId': credential.uid,
                              'add_post': 'no',
                              'edit_data': 'no',
                              'block_users': 'no',
                              'accept_enrolls': 'no',
                              'delete_add_supervisor': 'no',
                              'view_users': 'no',
                              'view_supervisors': 'no',
                              'isBlocked': 'no',
                            })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        CollectionReference family =
                            FirebaseFirestore.instance.collection('family');

                        routeArgument['familyId'] == 'none'
                            ? family.doc(credential.uid).set({
                                'familyMode': 'no',
                                'name': '${routeArgument['name']}',
                                'father': '${routeArgument['father']}',
                                'grandfather':
                                    '${routeArgument['grandfather']}',
                                'title': '${routeArgument['title']}',
                                'childrenNumber':
                                    '${routeArgument['childrenNumber']}',
                                'phoneNumber':
                                    '${routeArgument['phoneNumber']}',
                                'firstDistrict':
                                    '${routeArgument['firstDistrict']}',
                                'familyId': credential.uid,
                              })
                            : family.doc(credential.uid).set({
                                'familyMode': 'no',
                                'name': '${routeArgument['name']}',
                                'father': '${routeArgument['father']}',
                                'grandfather':
                                    '${routeArgument['grandfather']}',
                                'title': '${routeArgument['title']}',
                                'childrenNumber':
                                    '${routeArgument['childrenNumber']}',
                                'phoneNumber':
                                    '${routeArgument['phoneNumber']}',
                                'firstDistrict':
                                    '${routeArgument['firstDistrict']}',
                                'familyId': credential.uid,
                              });

                        CollectionReference nestUser = FirebaseFirestore
                            .instance
                            .collection('family')
                            .doc('${routeArgument['familyId']}')
                            .collection('nestUser');
                        nestUser
                            .doc(credential.uid)
                            .set({
                              'familyMode': '${routeArgument['familyMode']}',
                              'type': '${routeArgument['type']}',
                              'sigUrl': '${routeArgument['sigUrl']}',
                              'side': '${routeArgument['side']}',
                              'submissionDate':
                                  '${routeArgument['submissionDate']}',
                              'profileImage':
                                  '${routeArgument['profileImage']}',
                              'email': '${routeArgument['email']}',
                              'password': '${routeArgument['password']}',
                              'sixthUrl': '${routeArgument['sixthUrl']}',
                              'fifthUrl': '${routeArgument['fifthUrl']}',
                              'fourthUrl': '${routeArgument['fourthUrl']}',
                              'thirdUrl': '${routeArgument['thirdUrl']}',
                              'secondUrl': '${routeArgument['secondUrl']}',
                              'firstUrl': '${routeArgument['firstUrl']}',
                              'linkPhoneNumber':
                                  '${routeArgument['linkPhoneNumber']}',
                              'linkName': '${routeArgument['linkName']}',
                              'cardNumber': '${routeArgument['cardNumber']}',
                              'centerName': '${routeArgument['centerName']}',
                              'currentWork': '${routeArgument['currentWork']}',
                              'skills': '${routeArgument['skills']}',
                              'certificate': '${routeArgument['certificate']}',
                              'thirdDistrict':
                                  '${routeArgument['thirdDistrict']}',
                              'secondDistrict':
                                  '${routeArgument['secondDistrict']}',
                              'firstDistrict':
                                  '${routeArgument['firstDistrict']}',
                              'phoneNumber': '${routeArgument['phoneNumber']}',
                              'childrenNumber':
                                  '${routeArgument['childrenNumber']}',
                              'point': '${routeArgument['point']}',
                              'month': '${routeArgument['month']}',
                              'day': '${routeArgument['day']}',
                              'year': '${routeArgument['year']}',
                              'mother': '${routeArgument['mother']}',
                              'title': '${routeArgument['title']}',
                              'name': '${routeArgument['name']}',
                              'father': '${routeArgument['father']}',
                              'specialization':
                                  '${routeArgument['specialization']}',
                              'momGrandFather':
                                  '${routeArgument['momGrandFather']}',
                              'momFather': '${routeArgument['momFather']}',
                              'grandfather': '${routeArgument['grandfather']}',
                              'docId': credential.uid,
                              'add_post': 'no',
                              'edit_data': 'no',
                              'block_users': 'no',
                              'accept_enrolls': 'no',
                              'delete_add_supervisor': 'no',
                              'view_users': 'no',
                              'view_supervisors': 'no',
                              'isBlocked': 'no',
                            })
                            .then((value) => print("User Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                        family.doc('${routeArgument['familyId']}').update({
                          'familyMode': 'yes',
                        });
                        ;
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      setState(() {});
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
                      FirebaseFirestore.instance
                          .collection('candidateData')
                          .doc('${routeArgument['id']}')
                          .delete();
                      setState(() {});
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Color(0xFF2F5093),
                        height: 44,
                        width: 307,
                        child: Center(
                          child: Text(
                            'قبول طلب الانتماء',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'rFont',
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection('candidateData')
                          .doc('${routeArgument['id']}')
                          .delete();
                      setState(() {});
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
                            'رفض الطلب',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'rFont',
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
