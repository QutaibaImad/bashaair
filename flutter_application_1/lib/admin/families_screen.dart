// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/nest_family_screen.dart';
import 'package:flutter_application_1/widgets/family_card.dart';

class FamiliesScreen extends StatefulWidget {
  FamiliesScreen({super.key});

  @override
  State<FamiliesScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<FamiliesScreen> {
  List<QueryDocumentSnapshot> data = [];
  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('family').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
          'قائمة العائلات',
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
                height: 30,
              ),
              SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: filterProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = filterProducts[index];
                    return product['familyMode'] == 'yes'
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NestFamilyScreen(
                                            categoryId: product.id,
                                            name: product['name'],
                                            title: product['title'],
                                          )));
                            },
                            child: FamilyCard(
                              name: product['name'],
                              number: product['name'],
                              phoneNumber: product['phoneNumber'],
                              father: product['father'],
                              grandfather: product['grandfather'],
                              title: product['title'],
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
      final cardNumber = varCard['name'].toLowerCase();
      final input = query.toLowerCase();
      return cardNumber.contains(input);
    }).toList();
    setState(() {
      data = suggestions;
    });
  }
}
