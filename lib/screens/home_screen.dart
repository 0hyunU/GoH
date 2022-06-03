import 'package:flutter/material.dart';
import 'package:goh/utils/const.dart';
import 'package:goh/screens/DashboardScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goh/widgets/cal_basic_example.dart';
import 'package:goh/widgets/floating_button.dart';
import 'package:goh/widgets/line_plot_sample.dart';
import 'dart:io';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  String? _filename;

  final tabs = [
    DashboardScreen(),
    TableBasicsExample(),
    GraphPage(),
    Center(
      child: Text(
        'Settings',
      ),
    ),
  ];

  @override
  void initState() {
    // getFromCSV("");
  }

  Future<void> getFromCSV(String _filepath) async {
    final filename = await DefaultAssetBundle.of(context).loadString(_filepath);
    setState(() {
      _filename = filename;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon:
                Image.asset("assets/icons/menu.png", height: Constants.iconSize),
            // SvgPicture.asset(
            //   'assets/icons/apps.svg',
            //   height: 30,
            //   color: CustomColors.kPrimaryColor,
            // ),
            label: "",
            icon: Image.asset("assets/icons/menu.png",
                height: Constants.iconSize, color: Colors.grey),
            // SvgPicture.asset(
            //   'assets/icons/apps.svg',
            //   height: 30,
            //   color: Colors.grey,
            // ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/calendar.png',
              height: Constants.iconSize,
              color: Colors.grey,
            ),
            label: "",
            activeIcon: Image.asset(
              'assets/icons/calendar.png',
              height: Constants.iconSize,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/bar-chart.png',
                height: Constants.iconSize, color: Colors.grey),
            label: "",
            activeIcon: Image.asset(
              'assets/icons/bar-chart.png',
              height: Constants.iconSize,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/setting.png',
                height: Constants.iconSize, color: Colors.grey),
            label: "",
            activeIcon: Image.asset(
              'assets/icons/setting.png',
              height: Constants.iconSize,
            ),
          ),
        ],
      ),
      floatingActionButton: MultiFloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
