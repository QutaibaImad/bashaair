// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_element, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable

import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/detail_card.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class GetProfileData extends StatefulWidget {
  final String documentId;

  GetProfileData({required this.documentId});

  @override
  State<GetProfileData> createState() => _GetProfileDataState();
}

class _GetProfileDataState extends State<GetProfileData> {
  CollectionReference editOrderData =
      FirebaseFirestore.instance.collection('editOrderData');
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final credential = FirebaseAuth.instance.currentUser;
    TextEditingController motherController = TextEditingController();
    TextEditingController pointController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    TextEditingController titleController = TextEditingController();

    TextEditingController fatherController = TextEditingController();

    TextEditingController grandfatherController = TextEditingController();

    TextEditingController childrenController = TextEditingController();
    TextEditingController firstDistrictController = TextEditingController();
    TextEditingController secondDistrictController = TextEditingController();

    TextEditingController certificateController = TextEditingController();
    TextEditingController specializationController = TextEditingController();
    TextEditingController skillsController = TextEditingController();
    TextEditingController currentworkController = TextEditingController();

    TextEditingController cardnumberController = TextEditingController();
    TextEditingController centernameController = TextEditingController();
    TextEditingController linknameController = TextEditingController();
    TextEditingController linkphonenumberController = TextEditingController();

    TextEditingController thirdDistrictController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController sideController = TextEditingController();
    TextEditingController yearController = TextEditingController();
    TextEditingController monthController = TextEditingController();
    TextEditingController dayController = TextEditingController();

    DateTime date = DateTime.now();

    DateTime? newDate;

    File? file;

    String? url;

    updateProfileImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? Image = await picker.pickImage(source: ImageSource.gallery);
      if (Image != null) {
        file = File(Image.path);

        var profileImageName = basename(Image.path);

        var refStorage =
            FirebaseStorage.instance.ref('profileImages/$profileImageName');
        await refStorage.putFile(file!);
        url = await refStorage.getDownloadURL();
      }

      users.doc(credential!.uid).update({
        'profileImage': url ??
            'https://firebasestorage.googleapis.com/v0/b/bashair-17414.appspot.com/o/alkarkhChatImages%2FIMG_20240430_015850_357.png?alt=media&token=b005957d-ad9a-4429-a3d6-f38bbd20d886'
      });
      setState(() {});
    }

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
                      height: 120,
                      width: 120,
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(48),
                              child: Image.network(
                                data['profileImage'],
                                height: 96,
                                width: 96,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Colors.blue,
                                      Colors.orange,
                                    ]),
                                    width: 4),
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          updateProfileImage();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Color(0xFF2F5093),
                            height: 22,
                            width: 68,
                            child: Center(
                              child: Text(
                                'تعديل',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'rFont',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          users.doc(credential!.uid).update({
                            'profileImage':
                                'https://firebasestorage.googleapis.com/v0/b/bashair-17414.appspot.com/o/alkarkhChatImages%2FIMG_20240430_015850_357.png?alt=media&token=b005957d-ad9a-4429-a3d6-f38bbd20d886'
                          });
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Color(0xFF2F5093),
                            height: 22,
                            width: 68,
                            child: Center(
                              child: Text(
                                'حذف',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'rFont',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Column(
                      children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'الاسم الرباعي',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: 'rFont'),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        data['name'],
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data['father'],
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data['grandfather'],
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        DetailCard(result: data['title'], label: 'اللقب'),
                        DetailCard(result: data['mother'], label: 'اسم الام'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        '${data['year']}',
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                      Text('/'),
                                      Text(
                                        '${data['day']}',
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                      Text('/'),
                                      Text(
                                        '${data['month']}',
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
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: pointController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['point']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['point'],
                              label: 'الحاله الاجتماعيه'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: childrenController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText:
                                              '${data['childrenNumber']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['childrenNumber'],
                              label: 'غدد الاولاد'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: phoneNumberController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['phoneNumber']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['phoneNumber'], label: 'رقم الهاتف'),
                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        data['firstDistrict'],
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                      Text('/'),
                                      Text(
                                        data['secondDistrict'],
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
                        InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: sideController,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(right: 10),
                                            hintText: '${data['side']}'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: DetailCard(
                                result: data['side'], label: 'جانب')),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: thirdDistrictController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['thirdDistrict']}'),
                                    ),
                                    SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['thirdDistrict'],
                              label: 'اقرب نقطه داله'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: certificateController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['certificate']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['certificate'], label: 'الشهادة'),
                        ),
                        InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: skillsController,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(right: 10),
                                            hintText: '${data['skills']}'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: DetailCard(
                                result: data['skills'], label: 'المواهب')),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: currentworkController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['currentWork']}'),
                                    ),
                                    SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['currentWork'],
                              label: 'العمل الحالي'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: centernameController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['centerName']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['centerName'],
                              label: 'اسم المركز الانتخابي'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: cardnumberController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['cardNumber']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['cardNumber'],
                              label: 'رقم هوية الناخب'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: linknameController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText: '${data['linkName']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['linkName'], label: 'اسم الرابط'),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: linkphonenumberController,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(right: 10),
                                          hintText:
                                              '${data['linkPhoneNumber']}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DetailCard(
                              result: data['linkPhoneNumber'],
                              label: 'رقم هاتف الرابط'),
                        ),
                        // DetailCard(
                        //     result: data['name'], label: 'تاريخ ملئ الاستمارة'),

                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            await editOrderData
                                .add({
                                  'docId': data['docId'],
                                  'cardNumber': data['cardNumber'],
                                  'centerName': data['centerName'],
                                  'certificate':
                                      certificateController.text.isNotEmpty
                                          ? certificateController.text
                                          : data['certificate'],
                                  'title': data['title'],
                                  'childrenNumber':
                                      childrenController.text.isNotEmpty
                                          ? childrenController.text
                                          : data['childrenNumber'],
                                  'currentWork':
                                      currentworkController.text.isNotEmpty
                                          ? currentworkController.text
                                          : data['currentWork'],
                                  'day': data['day'],
                                  'month': data['month'],
                                  'year': data['year'],
                                  'father': data['father'],
                                  'sigUrl': data['sigUrl'],
                                  'firstUrl': data['firstUrl'],
                                  'secondUrl': data['secondUrl'],
                                  'thirdUrl': data['thirdUrl'],
                                  'fourthUrl': data['fourthUrl'],
                                  'fifthUrl': data['fifthUrl'],
                                  'sixthUrl': data['sixthUrl'],
                                  'firstDistrict':
                                      firstDistrictController.text.isNotEmpty
                                          ? firstDistrictController.text
                                          : data['firstDistrict'],
                                  'grandfather': data['grandfather'],
                                  'isBlocked': data['isBlocked'],
                                  'linkName': data['linkName'],
                                  'linkPhoneNumber': data['linkPhoneNumber'],
                                  'momFather': data['momFather'],
                                  'momGrandFather': data['momGrandFather'],
                                  'mother': data['mother'],
                                  'name': data['name'],
                                  'phoneNumber':
                                      phoneNumberController.text.isNotEmpty
                                          ? phoneNumberController.text
                                          : data['phoneNumber'],
                                  'profileImage': data['profileImage'],
                                  'secondDistrict':
                                      secondDistrictController.text.isNotEmpty
                                          ? secondDistrictController.text
                                          : data['secondDistrict'],
                                  'side': sideController.text.isNotEmpty
                                      ? sideController.text
                                      : data['side'],
                                  'skills': skillsController.text.isNotEmpty
                                      ? skillsController.text
                                      : data['skills'],
                                  'specialization': data['specialization'],
                                  'point': pointController.text.isNotEmpty
                                      ? pointController.text
                                      : data['status'],
                                  'submissionDate': data['submissionDate'],
                                  'thirdDistrict':
                                      thirdDistrictController.text.isNotEmpty
                                          ? thirdDistrictController.text
                                          : data['thirdDistrict'],
                                })
                                .then((value) => print("User Added"))
                                .catchError((error) =>
                                    print("Failed to add user: $error"));

                            showDialog(
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
                                        'تم تقديم الطلب بنجاح',
                                        style: TextStyle(
                                            color: Color(0xFF44474E),
                                            fontSize: 20,
                                            fontFamily: 'rFont',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
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
                                  'طلب تحديث المعلومات',
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
