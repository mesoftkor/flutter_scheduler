import 'package:flutter/material.dart';
import 'package:flutter_scheduler/screen/home_screen.dart';
import 'dart:developer';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TableCalendar(
          focusedDay: _focusedDay,
          firstDay: DateTime(1900, 1, 1),
          lastDay: DateTime(2999, 12, 31),
          //선택된 날짜를 인식???(Predicate(서술): 지정된 개체가 이러한 조건을 충족하는지 여부를 확인하는 메서드)

          //로그로 확인하니 현재 화면에 다시 그려야 하는 일자를 하나씩 그릴때마다 가져와서 비교하고 _selected(사용자 선택)와 day(현재 그릴 날짜)가 같으면
          //선택된것으로 UI를 그림
          selectedDayPredicate: (DateTime day) {
            //log('selectedDayPredicate(${isSameDay(_selectedDay, day)}| day:${day.toString()}|_selectedDay:${_selectedDay.toString()}');
            return isSameDay(_selectedDay, day);
            final now = DateTime.now();
            //DateTime의 isAtSameMomentAS는 설정한 시간과 인자로 받은 시간이 같은지를 비교하고 bool로 return 함
            return DateTime(day.year, day.month, day.day).isAtSameMomentAs(
              DateTime(now.year, now.month, now.day),
            );
          },

          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
            log(_focusedDay.toString());
            log(focusedDay.toString());
          },

          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },

          //기간 선택 가능 여부
          rangeSelectionMode: RangeSelectionMode.toggledOff,

          onRangeSelected: (start, end, focusedDay) {},
        ),
      ),
    );
  }
}
