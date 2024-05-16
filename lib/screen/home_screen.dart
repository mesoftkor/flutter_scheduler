import 'package:flutter/material.dart';
import 'package:flutter_scheduler/component/main_calendar.dart';
import 'package:flutter_scheduler/component/schedule_bottom_sheet.dart';
import 'package:flutter_scheduler/component/schedule_card.dart';
import 'package:flutter_scheduler/component/today_banner.dart';
import 'package:flutter_scheduler/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            TodayBanner(selectedDate: selectedDate, count: 0),
            SizedBox(height: 8.0),
            ScheduleCard(startTime: 14, endTime: 16, content: '플러터 스터디'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(),
            isScrollControlled: true, //스크롤이 가능하도록 변경
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
