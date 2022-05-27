import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'package:goh/widgets/custom_clipper.dart';
import 'package:goh/utils/const.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class TableBasicEx extends StatelessWidget {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
    // TableCalendar(
    //   firstDay: kFirstDay,
    //   lastDay: kLastDay,
    //   focusedDay: _focusedDay,
    //   calendarFormat: _calendarFormat,
    //   selectedDayPredicate: (day) {
    //     // Use `selectedDayPredicate` to determine which day is currently selected.
    //     // If this returns true, then `day` will be marked as selected.

    //     // Using `isSameDay` is recommended to disregard
    //     // the time-part of compared DateTime objects.
    //     return isSameDay(_selectedDay, day);
    //   },
    //   onDaySelected: (selectedDay, focusedDay) {
    //     if (!isSameDay(_selectedDay, selectedDay)) {
    //       // Call `setState()` when updating the selected day
    //       setState(() {
    //         _selectedDay = selectedDay;
    //         _focusedDay = focusedDay;
    //       });
    //     }
    //   },
    //   onFormatChanged: (format) {
    //     if (_calendarFormat != format) {
    //       // Call `setState()` when updating calendar format
    //       setState(() {
    //         _calendarFormat = format;
    //       });
    //     }
    //   },
    //   onPageChanged: (focusedDay) {
    //     // No need to call `setState()` here
    //     _focusedDay = focusedDay;
    //   },
    // );
  }
}

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      // appBar: AppBar(
      //   // title: Text('TableCalendar - Basics'),
      //   backgroundColor: Theme.of(context).accentColor,
      // ),
      children: <Widget>[
        
        ClipPath(
          // clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Theme.of(context).accentColor,
            height: Constants.headerHeight*0.3,
          ),
        ),

        
        Padding(
          padding: EdgeInsets.all(Constants.paddingSide),
          child: ListView(
            children: <Widget>[
          //   Row(
          //     children: <Widget>[
          //       Expanded(
          //     child: Text(
          //       "Lee Yu Gyung님",
          //       style: TextStyle(
          //           fontSize: 25,
          //           fontWeight: FontWeight.w900,
          //           color: Colors.white),
          //     ),
          //   ),
          //   CircleAvatar(
          //       radius: 25.0,
          //       backgroundImage:
          //           AssetImage('assets/icons/woman.png'))
          // ],
          // ),

        SizedBox(height:Constants.headerHeight*0.03),
        Container(
          child: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      )
      ),
      ]
          )
        ),
          
        
      ]
    );
  }
}
