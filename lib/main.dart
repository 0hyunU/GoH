import 'package:flutter/material.dart';
import 'package:goh/screens/FirebaseTest.dart';
import 'package:goh/screens/home_screen.dart';
import 'package:goh/utils/const.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

// void main() => print("hi");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final input = new File('assets/data.csv').openRead();
    // final fields = input
    //     .transform(utf8.decoder)
    //     .transform(new CsvToListConverter())
    //     .toList();
    // print(fields);
    // var a = CSV();
    // print(a);
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      // home: FirebaseTest(),
      home: HomeScreen(),
    );
  }
}

// PlatformFile? selectedFile;
// Future selectCSVFile() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       withData: true,
//       type: FileType.custom,
//       allowedExtensions: ['csv']);

//   if (result != null) {
//     selectedFile = result.files.first;
//   } else {
//     selectedFile = null;
//   }
// }
