import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CurrentSupervisorsScreen extends StatefulWidget {
  const CurrentSupervisorsScreen({super.key});

  @override
  State<CurrentSupervisorsScreen> createState() =>
      _CurrentSupervisorsScreenState();
}

class _CurrentSupervisorsScreenState extends State<CurrentSupervisorsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 55,
            ),
            Column(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return data[index]['view_supervisors'] == 'yes' &&
                              data[index]['view_users'] == 'yes' &&
                              data[index]['delete_add_supervisor'] == 'yes' &&
                              data[index]['accept_enrolls'] == 'yes' &&
                              data[index]['block_users'] == 'yes' &&
                              data[index]['edit_data'] == 'yes' &&
                              data[index]['add_post'] == 'yes'
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x33000000)),
                                    borderRadius: BorderRadius.circular(10)),
                                width: double.infinity,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${data[index]['phoneNumber']}',
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Text(
                                        'مدير',
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            fontFamily: 'rFont'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : data[index]['view_supervisors'] == 'yes' ||
                                  data[index]['view_users'] == 'yes' ||
                                  data[index]['delete_add_supervisor'] ==
                                      'yes' ||
                                  data[index]['accept_enrolls'] == 'yes' ||
                                  data[index]['block_users'] == 'yes' ||
                                  data[index]['edit_data'] == 'yes' ||
                                  data[index]['add_post'] == 'yes' &&
                                      !data[index]['view_supervisors'] ==
                                          'yes' &&
                                      data[index]['view_users'] == 'yes' &&
                                      data[index]['delete_add_supervisor'] ==
                                          'yes' &&
                                      data[index]['accept_enrolls'] == 'yes' &&
                                      data[index]['block_users'] == 'yes' &&
                                      data[index]['edit_data'] == 'yes' &&
                                      data[index]['add_post'] == 'yes'
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0x33000000)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: double.infinity,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '${data[index]['phoneNumber']}',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          Text(
                                            'مشرف',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: 'rFont'),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await users
                                                  .doc(data[index]['docId'])
                                                  .update({
                                                'add_post': 'yes',
                                                'edit_data': 'yes',
                                                'block_users': 'yes',
                                                'accept_enrolls': 'yes',
                                                'delete_add_supervisor': 'yes',
                                                'view_users': 'yes',
                                                'view_supervisors': 'yes',
                                              });
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  content: Container(
                                                    height: 203,
                                                    width: 320,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          'تمت العمليه بنجاح',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF44474E),
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'rFont',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'حسنا',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF255DAE),
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'rFont',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'ترقية',
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  fontFamily: 'rFont'),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await users
                                                  .doc(data[index]['docId'])
                                                  .update({
                                                'add_post': 'no',
                                                'edit_data': 'no',
                                                'block_users': 'no',
                                                'accept_enrolls': 'no',
                                                'delete_add_supervisor': 'no',
                                                'view_users': 'no',
                                                'view_supervisors': 'no',
                                              });
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  content: Container(
                                                    height: 203,
                                                    width: 320,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          'تمت العمليه بنجاح',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF44474E),
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'rFont',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'حسنا',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF255DAE),
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'rFont',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'حذف',
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  fontFamily: 'rFont'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
