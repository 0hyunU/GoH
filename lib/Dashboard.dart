import 'package:flutter/material.dart';
import 'package:simgum/constants.dart';
import 'package:simgum/CustomBottomAppBar.dart';
import 'package:simgum/CheckBody.dart';

class Dashbaord extends StatelessWidget {
  Dashbaord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Column(children: <Widget>[]),
        bottomNavigationBar: const CustomBottomAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Theme(
            data: Theme.of(context).copyWith(backgroundColor: Colors.yellow),
            child: FloatingActionButton(
                isExtended: false,
                elevation: 0,
//           backgroundColor: Colors.transparent,
                tooltip: "측정하기",
                child: Icon(Icons.medical_services_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckBody()));
                })));
  }
}