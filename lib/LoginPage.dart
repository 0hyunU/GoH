import 'package:flutter/material.dart';
import 'package:simgum/constants.dart';
import 'package:simgum/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Practice every day",
              style: TextStyle(
                color: colorList['orange'],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("and share your results",
              style: TextStyle(
                color: colorList['black'],
                fontSize: 30,
                fontWeight: FontWeight.w500,
              )),
        ),
        Image.network('https://picsum.photos/250?image=9'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Indicator(false),
            Indicator(false),
            Indicator(true),
          ],
        ),
        SizedBox(
          height: 70,
        ),
        Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            color: colorList['blue'],
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


class Indicator extends StatelessWidget {
  final isActive;
  Indicator(this.isActive);
  @override
  Widget build(BuildContext context) {
    return isActive == true
        ? Container(
            width: 16 * 4.0,
            height: 16,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorList['orange'],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ))
        : Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorList['black'],
              shape: BoxShape.circle,
            ));
  }
}