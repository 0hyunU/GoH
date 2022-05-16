import 'package:flutter/material.dart';
import 'package:simgum/constants.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  Color _currentColor = const Color(0xFF111111);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.calendar_today_outlined,
                    color: colorList['black']),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.calendar_today_outlined,
                    color: colorList['black']),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
