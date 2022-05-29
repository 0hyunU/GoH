import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goh/utils/const.dart';
import 'package:goh/widgets/card_items.dart';
import 'package:goh/widgets/card_main.dart';
import 'package:goh/widgets/card_section.dart';
import 'package:goh/widgets/custom_clipper.dart';

class DashboardScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return StreamBuilder<QuerySnapshot>(
        stream: db.collection('ECG').orderBy('datetime').snapshots(),
        builder: (context, snapshotECG) {
          Map<String, dynamic>? dataLatestECG =
                  snapshotECG.data?.docs.last.data() as Map<String, dynamic>?;
          bool isLoadingECG = !snapshotECG.hasData;
          return StreamBuilder<QuerySnapshot>(
            stream: db.collection('BP').orderBy('datetime').snapshots(),
            builder: (context, snapshotBP) {
              Map<String, dynamic>? dataLatestBP =
                  snapshotBP.data?.docs.last.data() as Map<String, dynamic>?;
              bool isLoadingBP = !snapshotBP.hasData;
              return isLoadingBP
                  ? Stack()
                  : Stack(children: <Widget>[
                      ClipPath(
                        clipper: MyCustomClipper(clipType: ClipType.bottom),
                        child: Container(
                          color: Theme.of(context).accentColor,
                          height: Constants.headerHeight + statusBarHeight,
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -30,
                        child: ClipOval(
                          child: Container(
                            color: Colors.black.withOpacity(0.05),
                            height: 220,
                            width: 220,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Constants.paddingSide),
                        child: ListView(children: <Widget>[
                          // Header - Greetings and Avatar
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Lee Yu Gyung님",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                              CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      AssetImage('assets/icons/woman.png'))
                            ],
                          ),
                          SizedBox(height: 50),
                          Container(
                              height: 140,
                              child: CardMainWidget(
                                  bp: isLoadingBP ? "" : dataLatestBP!['bp'],
                                  pulse: isLoadingBP ? "" : dataLatestBP!['pulse'],
                                  hasData: !isLoadingBP)),
                          SizedBox(height: 30),
                          // Scheduled Activities
                          Text(
                            "Profiles",
                            style: TextStyle(
                                color: Constants.textPrimary,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                              child: ListView(
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                CardItems(
                                  image: Image.asset(
                                    'assets/icons/woman.png',
                                  ),
                                  title: "Age / Sex",
                                  value: "60세",
                                  unit: "/ Woman",
                                  color: Constants.lightYellow,
                                  // color: Constants.lightBlue,
                                  progress: 0,
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "YOUR BP HISTORY",
                                  style: TextStyle(
                                    color: Constants.textPrimary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                    height: 125,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: !isLoadingBP
                                          ? List<Widget>.from(snapshotBP
                                              .data!.docs.reversed
                                              .map((e) => CardSection(
                                                  pulse_val: e['pulse'],
                                                  bp_val: e['bp'])))
                                          : <Widget>[ CardSection(bp_val: "No Data",pulse_val:"No Data")],
                                    )),
                                SizedBox(height: 30),
                                Text(
                                  "YOUR ECG HISTORY",
                                  style: TextStyle(
                                    color: Constants.textPrimary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                    height: 125,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: !isLoadingECG?
                                      List<Widget>.from(snapshotECG.data!.docs.reversed.map(
                                        (e) => CardSection(bp_val:e['class'],pulse_val:e["class"])))
                                        :<Widget>[CardSection(bp_val:"loading data ECG",pulse_val:"loading data ECG")],
                                    )),
                              ])),
                        ]),
                      ),
                    ]);
            },
          );
        });
  }
}
