// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:simgum/constants.dart';
import 'package:simgum/Dashboard.dart';

import 'package:simgum/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HURT : Health of yoUR hearT',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: LoginScreen(), //Dashbaord(),
    );
  }
}

