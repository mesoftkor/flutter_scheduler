import 'package:flutter/material.dart';
import 'package:flutter_scheduler/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:developer';
import 'package:table_calendar/table_calendar.dart';

//데이터베이스 연결을 위한 import
import 'package:flutter_scheduler/database/drift_database.dart';
import 'package:get_it/get_it.dart';

void main() async {
  //https://jake-seo-dev.tistory.com/666
  WidgetsFlutterBinding.ensureInitialized();
  //https://jake-seo-dev.tistory.com/667
  await initializeDateFormatting('ko_KR', ""); //flutter가 업데이트 되면서 인자가 추가됨

  final database = LocalDatabase(); // 데이터베이스 생성하기

  //GetIt에 데이터베이스 변수 주입하기?? 나중에 GetIt이 뭔지 registerSingleton이 뭔지 검색 필요?????
  GetIt.I.registerSingleton<LocalDatabase>(database);

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
