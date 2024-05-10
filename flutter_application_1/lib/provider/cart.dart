import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List canadaiteInfo = [];
  addCandataiteInfo(product) {
    canadaiteInfo.add(product);
  }
}
