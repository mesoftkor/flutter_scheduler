import 'package:flutter/material.dart';
import 'package:flutter_scheduler/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;
  const MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(),
      firstDay: DateTime(1900, 1, 1),
      lastDay: DateTime(2500, 1, 1),
      headerStyle: const HeaderStyle(
        //캘린더 최상단의 스타일 지정
        titleCentered: true, //캘린더 타이틀를 센터에 위치
        formatButtonVisible: false, //캘린더 크기 선택 옵션 off
        titleTextStyle: TextStyle(
          //캘린더 타이틀 Text 스타일
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        // 캘린더 스타일 지정
        isTodayHighlighted: false, //오늘 표시 기능 off
        defaultDecoration: BoxDecoration(
          //선택되지 않은 평일 설정
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration(
          //선택되지 않는 주말 설정
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_BLUE_COLOR,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
