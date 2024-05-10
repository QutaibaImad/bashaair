// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/management_screens/add_supervisor_screen.dart';
import 'package:flutter_application_1/admin/management_screens/current_supervisors_screen.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الادارة',
            style: TextStyle(
                color: Color(0xFF44474E),
                fontSize: 20,
                fontFamily: 'rFont',
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              child: Container(
                height: 51,
                decoration: BoxDecoration(
                  color: Color(0xFF2F5093),
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    'المشرفون الحاليون',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'rFont'),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    'اضافة مشرف',
                    style: TextStyle(
                        color: Color(0xFF2F5093),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: 'rFont'),
                  ),
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          CurrentSupervisorsScreen(),
          AddSupervisorScreen(),
        ]),
      ),
    );
  }
}
