import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }
  Widget content(){
    return Column(
      children: [
        Text('123'),
        Container(
          child: TableCalendar(
            rowHeight: 60,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day,today),
            focusedDay: today,
            firstDay: DateTime.utc(2010,10,16),
            lastDay: DateTime.utc(2030,03,14),
            onDaySelected: _onDaySelected,
          ),

        )
      ],
    );
  }
}