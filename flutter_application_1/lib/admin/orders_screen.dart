// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sort_child_properties_last, unnecessary_string_interpolations


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isLoading = true;
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('candidateData').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
          'طلبات الانتماء',
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
                        contentPadding: EdgeInsets.only(right: 10, bottom: 12),
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
                height: 700,
                child: ListView.builder(
                  itemCount: filterProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = filterProducts[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('order-detail-screen', arguments: {
                          'thirdDistrict': '${data[index]['thirdDistrict']}',
                          'name': '${data[index]['name']}',
                          'title': '${data[index]['title']}',
                          'cardNumber': '${data[index]['cardNumber']}',
                          'centerName': '${data[index]['centerName']}',
                          'certificate': '${data[index]['certificate']}',
                          'childrenNumber': '${data[index]['childrenNumber']}',
                          'currentWork': '${data[index]['currentWork']}',
                          'day': '${data[index]['day']}',
                          'father': '${data[index]['father']}',
                          'fifthUrl': '${data[index]['fifthUrl']}',
                          'firstDistrict': '${data[index]['firstDistrict']}',
                          'firstUrl': '${data[index]['firstUrl']}',
                          'fourthUrl': '${data[index]['fourthUrl']}',
                          'grandfather': '${data[index]['grandfather']}',
                          'linkName': '${data[index]['linkName']}',
                          'linkPhoneNumber':
                              '${data[index]['linkPhoneNumber']}',
                          'momFather': '${data[index]['momFather']}',
                          'momGrandFather': '${data[index]['momGrandFather']}',
                          'month': '${data[index]['month']}',
                          'mother': '${data[index]['mother']}',
                          'point': '${data[index]['point']}',
                          'secondDistrict': '${data[index]['secondDistrict']}',
                          'secondUrl': '${data[index]['secondUrl']}',
                          'sixthUrl': '${data[index]['sixthUrl']}',
                          'skills': '${data[index]['skills']}',
                          'specialization': '${data[index]['specialization']}',
                          'thirdUrl': '${data[index]['thirdUrl']}',
                          'year': '${data[index]['year']}',
                          'id': '${data[index].id}',
                          'phoneNumber': '${data[index]['phoneNumber']}',
                          'email': '${data[index]['email']}',
                          'password': '${data[index]['password']}',
                          'side': '${data[index]['side']}',
                          'profileImage': '${data[index]['profileImage']}',
                          'submissionDate': '${data[index]['submissionDate']}',
                          'sigUrl': '${data[index]['sigUrl']}',
                          'type': '${data[index]['type']}',
                          'familyMode': '${data[index]['familyMode']}',
                          'familyId': '${data[index]['familyId']}',
                        });
                      },
                      child: OrderCard(
                        phoneNumber: '${product['phoneNumber']}',
                        name: '${product['name']}',
                        title: '${product['title']}',
                        cardNumber: '${product['cardNumber']}',
                        centerName: '${product['centerName']}',
                        certificate: '${product['certificate']}',
                        childrenNumber: '${product['childrenNumber']}',
                        currentWork: '${product['currentWork']}',
                        day: '${product['day']}',
                        father: '${product['father']}',
                        fifthUrl: '${product['fifthUrl']}',
                        firstDistrict: '${product['firstDistrict']}',
                        firstUrl: '${product['firstUrl']}',
                        fourthUrl: '${product['fourthUrl']}',
                        grandfather: '${product['grandfather']}',
                        linkName: '${product['linkName']}',
                        linkPhoneNumber: '${product['linkPhoneNumber']}',
                        momFather: '${product['momFather']}',
                        momGrandFather: '${product['momGrandFather']}',
                        month: '${product['month']}',
                        mother: '${product['mother']}',
                        point: '${product['point']}',
                        secondDistrict: '${product['secondDistrict']}',
                        secondUrl: '${product['secondUrl']}',
                        sixthUrl: '${product['sixthUrl']}',
                        skills: '${product['skills']}',
                        specialization: '${product['specialization']}',
                        thirdUrl: '${product['thirdUrl']}',
                        year: '${product['year']}',
                        id: '${product.id}',
                        thirdDistrict: '${product['thirdDistrict']}',
                        password: '${product['password']}',
                        side: product['side'],
                        profileImage: '${product['profileImage']}',
                        submissionDate: '${product['submissionDate']}',
                        email: '${product['email']}',
                        sigUrl: '${product['sigUrl']}',
                        familyMode: '${product['familyMode']}',
                        type: '${product['type']}',
                        familyId: '${product['familyId']}',
                      ),
                    );
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
