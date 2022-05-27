import 'package:flutter/material.dart';
import 'package:goh/utils/const.dart';
import 'package:goh/screens/DashboardScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goh/widgets/cal_basic_example.dart';
import 'package:goh/widgets/line_plot_sample.dart';
import 'dart:io';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _filepath =
      "/Users/0hyun/Desktop/flutter/flutter_test_proj/goh/goh/assets/icons/data.csv";

  String? _filename;

  final tabs = [
    DashboardScreen(),
    TableBasicsExample(),
    GraphPage(storage: AssetsStorage()),
    Center(
      child: Text(
        'Settings',
      ),
    ),
  ];

  @override
  void initState() {
    getFromCSV();
  }

  Future<void> getFromCSV() async {
    final filename = await DefaultAssetBundle.of(context).loadString(_filepath);
    setState(() {
      _filename = filename;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _icon_size = 28;
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
                Image.asset("assets/icons/menu.png", height: _icon_size),
            // SvgPicture.asset(
            //   'assets/icons/apps.svg',
            //   height: 30,
            //   color: CustomColors.kPrimaryColor,
            // ),
            label: "",
            icon: Image.asset("assets/icons/menu.png",
                height: _icon_size, color: Colors.grey),
            // SvgPicture.asset(
            //   'assets/icons/apps.svg',
            //   height: 30,
            //   color: Colors.grey,
            // ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/calendar.png',
              height: _icon_size,
              color: Colors.grey,
            ),
            label: "",
            activeIcon: Image.asset(
              'assets/icons/calendar.png',
              height: _icon_size,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/bar-chart.png',
                height: _icon_size, color: Colors.grey),
            label: "",
            activeIcon: Image.asset(
              'assets/icons/bar-chart.png',
              height: _icon_size,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/setting.png',
                height: _icon_size, color: Colors.grey),
            label: "",
            activeIcon: Image.asset(
              'assets/icons/setting.png',
              height: _icon_size,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            child: Image.asset('assets/icons/heartbeat.png',
                height: _icon_size + 2, color: Colors.white),
            backgroundColor: Theme.of(context).accentColor,
            onPressed: () {
 
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class AssetsStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<String> getFromCSV() async {
    print('hi');
    final filename = new File(
            "'/Users/0hyun/Desktop/flutter/flutter_test_proj/goh/goh/assets/icons/data.csv'")
        .readAsStringSync();
    print(filename);
    return filename;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('hi');
    // var a = await rootBundle.load('/assets/data.csv');
    // print(a);
    print('$path');
    print(path.runtimeType);
    // getApplicationDocumentsDirectory.
    print(File(
            '/Users/0hyun/Desktop/flutter/flutter_test_proj/goh/goh/assets/icons/data.csv')
        .exists());

    return File(
        '/Users/0hyun/Desktop/flutter/flutter_test_proj/goh/goh/assets/icons/data.csv');
  }

  Future<String> readCsv() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
