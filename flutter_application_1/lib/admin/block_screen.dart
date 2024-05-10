// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  bool isSelected = false;

  final List<dynamic> categories = [
    'المدائن',
    'الصدر الثانية',
    'الصدر الأولى',
    'البلديات',
    'بغداد الجديدة',
    'الاعظمية',
    'الشعب',
    'الكرادة',
    'المعامل',
    'الراشدية',
    'الاعظمية',
    'أبو غريب',
    'المنصور',
    'الدورة',
    'التاجي',
    'المحمودية'
  ];
  List<dynamic> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final filterProducts = data.where((product) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(product['firstDistrict']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قائمة الحظر',
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: 'rFont'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories
                        .map(
                          (category) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: FilterChip(
                              side: BorderSide.none,
                              selected: selectedCategories.contains(category),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    selectedCategories.add(category);
                                  } else {
                                    selectedCategories.remove(category);
                                  }
                                });
                              },
                              checkmarkColor: Colors.blue,
                              color:
                                  MaterialStateProperty.all(Color(0xFFEEEEEE)),
                              label: Text(category),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 264,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x33000000)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: searchCard,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10, bottom: 10),
                        border: InputBorder.none,
                        hintText: 'البحث عن اعضاء',
                        hintStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'rFont'),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF2F5093),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'بحث',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'rFont'),
                        ),
                        Icon(Icons.search, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: filterProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = filterProducts[index];
                    return data[index]['isBlocked'] == 'yes'
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0x33000000)),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 349,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${product['name']}',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        fontFamily: 'rFont'),
                                  ),
                                  Text(
                                    '${product['phoneNumber']}',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        fontFamily: 'rFont'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await users
                                          .doc(data[index]['docId'])
                                          .update({
                                        'isBlocked': 'no',
                                      });
                                      setState(() {});

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
                                                  'تمت العمليه بنجاح',
                                                  style: TextStyle(
                                                      color: Color(0xFF44474E),
                                                      fontSize: 20,
                                                      fontFamily: 'rFont',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'حسنا',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF255DAE),
                                                        fontSize: 15,
                                                        fontFamily: 'rFont',
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'الغاء',
                                      style: TextStyle(
                                          color: Color(0xFFC41010),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          fontFamily: 'rFont'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchCard(String query) {
    final suggestions = data.where((varCard) {
      final cardNumber = varCard['phoneNumber'].toLowerCase();
      final input = query.toLowerCase();
      return cardNumber.contains(input);
    }).toList();
    setState(() {
      data = suggestions;
    });
  }
}
