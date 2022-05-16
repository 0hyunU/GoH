import 'package:flutter/material.dart';
import 'package:simgum/CustomBottomAppBar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simgum/components/my_bottom_nav_bar.dart';
import 'package:simgum/screens/home/components/body.dart';
import 'package:simgum/CheckBody.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),

      bottomNavigationBar: CustomBottomAppBar(), // MyBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          isExtended: false,
          elevation: 0,
//           backgroundColor: Colors.transparent,
          tooltip: "측정하기",
          child: Icon(Icons.medical_services_outlined),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CheckBody()));
          }),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
