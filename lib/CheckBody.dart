import 'package:flutter/material.dart';

class CheckBody extends StatelessWidget {
  CheckBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Column(
          children: <Widget>[
            Text("hi"),
          ],
        ));
  }
}