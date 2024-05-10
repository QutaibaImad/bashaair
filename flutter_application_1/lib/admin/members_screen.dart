// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/member_detail_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MembersScreen extends StatefulWidget {
  MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
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
    // final image = Image.asset('assets/images/ads_click.png',
    //     height: 17, width: 17, fit: BoxFit.cover);
    final filterProducts = data.where((product) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(product['firstDistrict']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قائمة الاعضاء',
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
                height: 400,
                child: ListView.builder(
                  itemCount: filterProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = filterProducts[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MemberDetailScreen(
                                      sigUrl: data[index]['sigUrl'],
                                      title: data[index]['title'],
                                      documentId: data[index]['docId'],
                                      name: data[index]['name'],
                                      father: data[index]['father'],
                                      grandfather: data[index]['grandfather'],
                                      mother: data[index]['mother'],
                                      momFather: data[index]['momFather'],
                                      momGrandFather: data[index]
                                          ['momGrandFather'],
                                      year: data[index]['year'],
                                      day: data[index]['day'],
                                      month: data[index]['month'],
                                      childrenNumber: data[index]
                                          ['childrenNumber'],
                                      side: data[index]['side'],
                                      thirdDistrict: data[index]
                                          ['thirdDistrict'],
                                      certificate: data[index]['certificate'],
                                      skills: data[index]['skills'],
                                      currentWork: data[index]['currentWork'],
                                      cardNumber: data[index]['cardNumber'],
                                      centerName: data[index]['centerName'],
                                      linkName: data[index]['linkName'],
                                      linkPhoneNumber: data[index]
                                          ['linkPhoneNumber'],
                                      firstUrl: data[index]['firstUrl'],
                                      secondUrl: data[index]['secondUrl'],
                                      thirdUrl: data[index]['thirdUrl'],
                                      fourthUrl: data[index]['fourthUrl'],
                                      fifthUrl: data[index]['fifthUrl'],
                                      sixthUrl: data[index]['sixthUrl'],
                                      firstDistrict: data[index]
                                          ['firstDistrict'],
                                      secondDistrict: data[index]
                                          ['secondDistrict'],
                                      profileImage: data[index]['profileImage'],
                                      point: data[index]['point'],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0x33000000)),
                              borderRadius: BorderRadius.circular(10)),
                          width: 349,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                '${product['certificate']}',
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    fontFamily: 'rFont'),
                              ),
                              Image.asset('assets/images/ads_click.png',
                                  height: 17, width: 17, fit: BoxFit.cover),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () async {
                  final doc = pw.Document();
                  doc.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a6,
                      build: (pw.Context context) {
                        return pw.SizedBox(
                          height: 700,
                          child: pw.ListView.builder(
                            itemCount: filterProducts.length,
                            itemBuilder: (context, int index) {
                              final productn = filterProducts[index];
                              return pw.Padding(
                                padding:
                                    const pw.EdgeInsets.symmetric(vertical: 5),
                                child: pw.Container(
                                  decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                      borderRadius:
                                          pw.BorderRadius.circular(10)),
                                  width: 349,
                                  height: 40,
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceAround,
                                    children: [
                                      pw.Text(
                                        '${productn['name']}',
                                        style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      pw.Text(
                                        '${productn['certificate']}',
                                        style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }));
                  await Printing.layoutPdf(
                      onLayout: (PdfPageFormat format) async => doc.save());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Color(0xFF2F5093),
                    height: 44,
                    width: 307,
                    child: Center(
                      child: Text(
                        'تصدير',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            fontFamily: 'rFont'),
                      ),
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
