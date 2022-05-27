import 'package:flutter/material.dart';
import 'package:goh/utils/const.dart';
import 'package:goh/widgets/card_items.dart';
import 'package:goh/widgets/card_main.dart';
import 'package:goh/widgets/card_section.dart';
import 'package:goh/widgets/custom_clipper.dart';


class DashboardScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
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

        // BODY
        Padding(
          padding: EdgeInsets.all(Constants.paddingSide),
          child: ListView(
            children: <Widget>[
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

              // Main Cards - Heartbeat and Blood Pressure
              Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CardMain(
                      image: AssetImage('assets/icons/heartbeat.png'),
                      title: "Hearbeat",
                      value: "66",
                      unit: "bpm",
                      color: Constants.lightGreen,
                    ),
                    CardMain(
                        image: AssetImage('assets/icons/blooddrop.png'),
                        title: "Blood Pressure",
                        value: "66/123",
                        unit: "mmHg",
                        color: Constants.lightYellow)
                  ],
                ),
              ),

              // Section Cards - Daily Medication
              
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
                      progress: 30,
                    ),
                    // CardItems(
                    //   image: Image.asset(
                    //     'assets/icons/Swimming.png',
                    //   ),
                    //   title: "Sex",
                    //   value: "남",
                    //   unit: "",
                    //   color: Constants.lightBlue,
                    //   progress: 0
                    // ),

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
                    children: <Widget>[
                      CardSection(
                        bp_val: 66,
                        hhmg_val: "66/123",
                      ),
                      CardSection(
                        bp_val: 75,
                        hhmg_val: "69/130",
                      ),CardSection(
                        bp_val: 69,
                        hhmg_val: "54/119",
                      ),CardSection(
                        bp_val: 74,
                        hhmg_val: "67/124",
                      )
                    ],
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
                    children: <Widget>[
                      
                    ],
                  )),


                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
