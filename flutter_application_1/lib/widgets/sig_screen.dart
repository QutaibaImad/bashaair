import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:signature_kit/signature_kit.dart';

class SignatureScreen extends StatefulWidget {
  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  CollectionReference sigs = FirebaseFirestore.instance.collection('signature');
  Uint8List? exportedImage;
  String? sigUrl;

  SignatureController controller = SignatureController(
    color: Colors.black,
    backgroundColor: Colors.white,
    width: 100,
    height: 100,
    strokeWidth: 2,
  );

  getSig() async {
    var sigName = basename(DateTime.now().toString());
    var refStroage = FirebaseStorage.instance.ref(sigName);
    await refStroage.putData(exportedImage!);
    sigUrl = await refStroage.getDownloadURL();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signature Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 360,
              width: 300,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 1),
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
                          width: 100,
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
                          width: 100,
                        ),
                      ],
                    ),
                    top: 5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  exportedImage = await controller.toImage();
                  getSig();
                },
                child: Text('save')),
            ElevatedButton(
                onPressed: () async {
                  if (sigUrl != null) {
                    await sigs
                        .add({
                          'sigUrl': sigUrl ?? 'none',
                        })
                        .then((value) => print("User Added"))
                        .catchError(
                            (error) => print("Failed to add user: $error"));
                  }
                },
                child: Text('share')),
          ],
        ),
      ),
    );
  }
}
