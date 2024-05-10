// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/widgets/custom_add_photo.dart';
import 'package:flutter_application_1/widgets/custom_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature_kit/signature_kit.dart';

class AlkarkhEnrollScreen extends StatefulWidget {
  AlkarkhEnrollScreen({super.key});

  @override
  State<AlkarkhEnrollScreen> createState() => _AlkarkhEnrollScreenState();
}

class _AlkarkhEnrollScreenState extends State<AlkarkhEnrollScreen> {
  Uint8List? exportedImage;
  String? sigUrl;

  SignatureController controller = SignatureController(
    color: Colors.black,
    backgroundColor: Colors.white,
    width: 100,
    height: 100,
    strokeWidth: 2,
  );
  var name;

  getSig() async {
    var sigName = basename(DateTime.now().toString());
    var refStroage = FirebaseStorage.instance.ref(sigName);
    await refStroage.putData(exportedImage!);
    sigUrl = await refStroage.getDownloadURL();

    setState(() {});
  }

  DateTime date = DateTime.now();

  DateTime? newDate;

  List<String> itmesList = ['اعزب', 'متزوج', 'مطلق', 'ارمل'];
  String? selectedItem = 'اعزب';

  List<String> itmesList2 = [
    'الاعظمية',
    'أبو غريب',
    'المنصور',
    'الدورة',
    'التاجي',
    'المحمودية'
  ];
  String? selectedItem2 = 'الاعظمية';

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController fatherController = TextEditingController();

  TextEditingController grandfatherController = TextEditingController();

  TextEditingController motherController = TextEditingController();

  TextEditingController momFatherController = TextEditingController();

  TextEditingController momGrandfatherController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController firstDistrictController = TextEditingController();
  TextEditingController secondDistrictController = TextEditingController();

  TextEditingController certificateController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController currentWorkController = TextEditingController();

  TextEditingController cardnumberController = TextEditingController();
  TextEditingController centernameController = TextEditingController();
  TextEditingController linknameController = TextEditingController();
  TextEditingController linkphonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController thirdDistrictController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  CollectionReference candidateData =
      FirebaseFirestore.instance.collection('candidateData');

// start adding first image

  CollectionReference first_images =
      FirebaseFirestore.instance.collection('candidateData');

  File? FirstFile;

  String? firstUrl;

  getFirstImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? firstImageCamera =
        await picker.pickImage(source: ImageSource.camera);
    if (firstImageCamera != null) {
      FirstFile = File(firstImageCamera.path);

      var firstImageName = basename(firstImageCamera.path);

      var refStorage =
          FirebaseStorage.instance.ref('firstImages/$firstImageName');
      await refStorage.putFile(FirstFile!);
      firstUrl = await refStorage.getDownloadURL();
    }
    setState(() {});
  }

// end adding first image

// start adding second image

  CollectionReference second_images =
      FirebaseFirestore.instance.collection('candidateData');

  File? SecondFile;

  String? secondUrl;

  getSecondImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? secondImageCamera =
        await picker.pickImage(source: ImageSource.camera);
    if (secondImageCamera != null) {
      SecondFile = File(secondImageCamera.path);

      var secondImageName = basename(secondImageCamera.path);

      var secondRefStorage =
          FirebaseStorage.instance.ref('secondImages/$secondImageName');
      await secondRefStorage.putFile(SecondFile!);
      secondUrl = await secondRefStorage.getDownloadURL();
    }
    setState(() {});
  }

// end adding second image

// start adding third image

  CollectionReference third_images =
      FirebaseFirestore.instance.collection('candidateData');

  File? thirdFile;

  String? thirdUrl;

  getThirdImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? thirdImageCamera =
        await picker.pickImage(source: ImageSource.camera);
    if (thirdImageCamera != null) {
      thirdFile = File(thirdImageCamera.path);

      var thirdImageName = basename(thirdImageCamera.path);

      var thirdRefStorage =
          FirebaseStorage.instance.ref('thirdImages/$thirdImageName');
      await thirdRefStorage.putFile(thirdFile!);
      thirdUrl = await thirdRefStorage.getDownloadURL();
    }
    setState(() {});
  }

// end adding third image

// start adding fourth image

  CollectionReference fourth_images =
      FirebaseFirestore.instance.collection('candidateData');

  File? fourthFile;

  String? fourthUrl;

  getFourthImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? fourthImageCamera =
        await picker.pickImage(source: ImageSource.camera);
    if (fourthImageCamera != null) {
      fourthFile = File(fourthImageCamera.path);

      var fourthImageName = basename(fourthImageCamera.path);

      var fourthRefStorage =
          FirebaseStorage.instance.ref('fourthImages/$fourthImageName');
      await fourthRefStorage.putFile(fourthFile!);
      fourthUrl = await fourthRefStorage.getDownloadURL();
    }
    setState(() {});
  }

// end adding fourth image

// start adding fifth image

  CollectionReference fifth_images =
      FirebaseFirestore.instance.collection('candidateData');

  File? fifthFile;

  String? fifthUrl;

  getFifthImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? fifthImageCamera =
        await picker.pickImage(source: ImageSource.camera);
    if (fifthImageCamera != null) {
      fifthFile = File(fifthImageCamera.path);

      var fifthImageName = basename(fifthImageCamera.path);

      var fifthRefStorage =
          FirebaseStorage.instance.ref('fifthImages/$fifthImageName');
      await fifthRefStorage.putFile(thirdFile!);
      fifthUrl = await fifthRefStorage.getDownloadURL();
    }
    setState(() {});
  }

// end adding fifth image

// start adding sixth image

  CollectionReference sixth_images =
      FirebaseFirestore.instance.collection('candidateData');

  File? sixthFile;

  String? sixthUrl;

  getSixthImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? sixthImageCamera =
        await picker.pickImage(source: ImageSource.camera);
    if (sixthImageCamera != null) {
      sixthFile = File(sixthImageCamera.path);

      var sixthImageName = basename(sixthImageCamera.path);

      var sixthRefStorage =
          FirebaseStorage.instance.ref('sixthImages/$sixthImageName');
      await sixthRefStorage.putFile(sixthFile!);
      sixthUrl = await sixthRefStorage.getDownloadURL();
    }
    setState(() {});
  }
// end adding sixth image

  Future addCandidateData() async {
    return await candidateData
        .add({
          'familyId': 'none',
          'type': 'member',
          'familyMode': 'no',
          'currentWork': currentWorkController.text,
          'name': nameController.text,
          'father': fatherController.text,
          'grandfather': grandfatherController.text,
          'title': titleController.text,
          'mother': motherController.text,
          'momFather': momFatherController.text,
          'momGrandFather': momGrandfatherController.text,
          'month': date.month,
          'day': date.day,
          'year': date.year,
          'point': selectedItem,
          'childrenNumber': childrenController.text,
          'firstDistrict': selectedItem2,
          'secondDistrict': secondDistrictController.text,
          'thirdDistrict': thirdDistrictController.text,
          'certificate': certificateController.text,
          'specialization': specializationController.text,
          'skills': skillsController.text,
          'cardNumber': cardnumberController.text,
          'centerName': centernameController.text,
          'linkName': linknameController.text,
          'linkPhoneNumber': linkphonenumberController.text,
          'firstUrl': firstUrl ?? 'none',
          'secondUrl': secondUrl ?? 'none',
          'thirdUrl': thirdUrl ?? 'none',
          'fourthUrl': fourthUrl ?? 'none',
          'fifthUrl': fifthUrl ?? 'none',
          'sixthUrl': sixthUrl ?? 'none',
          'phoneNumber': phoneNumberController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'side': 'alkarkh',
          'submissionDate': DateTime.now(),
          'sigUrl': sigUrl ?? 'none',
          'profileImage':
              'https://firebasestorage.googleapis.com/v0/b/bashair-17414.appspot.com/o/alkarkhChatImages%2FIMG_20240430_015850_357.png?alt=media&token=b005957d-ad9a-4429-a3d6-f38bbd20d886'
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  addPrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    pickTime() async {
      DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100));
      if (newDate == null) return;
      setState(() {
        date = newDate;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'استمارة الانتماء',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              addPrefs();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/images/Vector.png',
                height: 19,
                width: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'الاسم الرباعي واللقب',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(
                varLabel: 'الاسم',
                varController: nameController,
              ),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم الاب', varController: fatherController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم الجد', varController: grandfatherController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اللقب', varController: titleController),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'اسم الام الثلاثي',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم الام', varController: motherController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم الاب', varController: momFatherController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم الجد',
                  varController: momGrandfatherController),
              SizedBox(height: 20),
              Text(
                'محل وتأريخ التولد',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 15,
                    fontFamily: 'rFont',
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 48,
                  width: 312,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF2F5093),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${date.month}/${date.day}/${date.year}'),
                      InkWell(
                        onTap: () async {
                          pickTime();
                        },
                        child: Image.asset(
                          'assets/images/today_24px.png',
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'الحالة الاجتماعيه',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 56,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF2F5093),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedItem,
                    items: itmesList
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (item) => setState(() {
                      selectedItem = item;
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'عدد الاولاد ان وجد',
                  varController: childrenController),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'محل السكن',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10, top: 15),
                    height: 56,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF2F5093),
                      ),
                    ),
                    child: Text(
                      'بغداد',
                      style: TextStyle(fontSize: 15),
                    )),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 56,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF2F5093),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedItem2,
                    items: itmesList2
                        .map((item2) =>
                            DropdownMenuItem(value: item2, child: Text(item2)))
                        .toList(),
                    onChanged: (item2) => setState(() {
                      selectedItem2 = item2;
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'الناحية', varController: secondDistrictController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اقرب نقطة دالة',
                  varController: thirdDistrictController),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'التحصيل الدراسي والعمل',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'الشهادة', varController: certificateController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'التخصص', varController: specializationController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'المواهب والخبرات',
                  varController: skillsController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'العمل الحالي',
                  varController: currentWorkController),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'رقم بطاقة الناخب',
                  varController: cardnumberController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم المركز الانتخابي',
                  varController: centernameController),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  varLabel: 'رقم الهاتف', varController: phoneNumberController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'اسم الرابط', varController: linknameController),
              SizedBox(height: 20),
              CustomTextField(
                  varLabel: 'رقم هاتف الرابط',
                  varController: linkphonenumberController),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 36,
                  width: 278,
                  child: Text(
                    'يجب أرفاق الوثائق التالية لغرض التأكد من المعلومات وتأكد من رفع صور واضحة لضمان قبول الإستمارة',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 12,
                        fontFamily: 'rFont',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'البطاقة الوطنية الموحدة',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                firstUrl != null
                    ? Image.network(
                        '${firstUrl}',
                        height: 91,
                        width: 128,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: () {
                          getFirstImage();
                        },
                        child: CustomAddPhoto(
                          varLabel: 'الوجه الامامي',
                        ),
                      ),
                secondUrl != null
                    ? Image.network(
                        '${secondUrl}',
                        height: 91,
                        width: 128,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: () {
                          getSecondImage();
                        },
                        child: CustomAddPhoto(
                          varLabel: 'الوجه الخلفي',
                        ),
                      ),
              ]),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'البطاقة الوطنية الموحدة',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                thirdUrl != null
                    ? Image.network(
                        '${thirdUrl}',
                        height: 91,
                        width: 128,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: () {
                          getThirdImage();
                        },
                        child: CustomAddPhoto(
                          varLabel: 'الوجه الامامي',
                        ),
                      ),
                fourthUrl != null
                    ? Image.network(
                        '${fourthUrl}',
                        height: 91,
                        width: 128,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: () {
                          getFourthImage();
                        },
                        child: CustomAddPhoto(
                          varLabel: 'الوجه الخلفي',
                        ),
                      ),
              ]),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'البطاقة الوطنية الموحدة',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                fifthUrl != null
                    ? Image.network(
                        '${fifthUrl}',
                        height: 91,
                        width: 128,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: () {
                          getFifthImage();
                        },
                        child: CustomAddPhoto(
                          varLabel: 'الوجه الامامي',
                        ),
                      ),
                sixthUrl != null
                    ? Image.network(
                        '${sixthUrl}',
                        height: 91,
                        width: 128,
                        fit: BoxFit.cover,
                      )
                    : InkWell(
                        onTap: () {
                          getSixthImage();
                        },
                        child: CustomAddPhoto(
                          varLabel: 'الوجه الخلفي',
                        ),
                      ),
              ]),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 15,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'يُطلب منك توقيعك في هذه الصفحة كوسيلة للتأكد من هويتك وتوثيق المعلومات التي تقدمها يرجى توقيع المربع أدناه باستخدام إصبعك أو قلم اللمس.',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontFamily: 'rFont',
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 361,
                width: 301,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 360,
                      width: 300,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1),
                                left: BorderSide(color: Colors.black, width: 1),
                                right:
                                    BorderSide(color: Colors.black, width: 1),
                              )),
                              height: 332,
                              width: 299,
                              child: Center(
                                child: Signature(controller: controller),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Row(
                              children: [
                                Container(
                                  color: Color(0xFF255DAE),
                                  height: 1,
                                  width: 96,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ' ادخل توقيعك هنا',
                                      style: TextStyle(
                                          color: Color(0xFF255DAE),
                                          fontSize: 12,
                                          fontFamily: 'rFont',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ' * ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Color(0xFF255DAE),
                                  height: 1,
                                  width: 98,
                                ),
                              ],
                            ),
                            top: 5,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              InkWell(
                onTap: () async {
                  exportedImage = await controller.toImage();
                  getSig();

                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  setState(() {
                    name = sharedPreferences.getString('name');
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Color(0xFF255DAE),
                    height: 44,
                    width: 210,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('     '),
                          Text(
                            'قبول',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'rFont',
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                          Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  controller.clear();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Color(0xFFFF3758),
                    height: 44,
                    width: 210,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('     '),
                          Text(
                            'اعد المحاوله',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'rFont',
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                          Icon(
                            Icons.change_circle_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 56,
                  width: 200,
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
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 56,
                  width: 200,
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
              SizedBox(height: 35),
              InkWell(
                onTap: () {
                  print(name);
                  addCandidateData();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
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
                              'تم تقديم طلب الانتماء',
                              style: TextStyle(
                                  color: Color(0xFF44474E),
                                  fontSize: 20,
                                  fontFamily: 'rFont',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 60,
                              width: 191,
                              child: Text(
                                'تتم مراجعة طلبات الانتماء خلال 48 ساعه بحد اقصى',
                                style: TextStyle(
                                    color: Color(0xFF44474E),
                                    fontSize: 16,
                                    fontFamily: 'rFont',
                                    fontWeight: FontWeight.w400),
                              ),
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
                    color: Color(0xFF2F5093),
                    height: 44,
                    width: 307,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('     '),
                          Text(
                            'التالي',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'rFont',
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
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
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
