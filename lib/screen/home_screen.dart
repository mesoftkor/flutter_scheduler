import 'package:get_it/get_it.dart';
import 'package:flutter_scheduler/database/drift_database.dart';

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
            StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context, snapshot) {
                return TodayBanner(
                    selectedDate: selectedDate,
                    count: snapshot.data?.length ?? 0);
              },
            ),
            SizedBox(height: 8.0),
            //ScheduleCard(startTime: 14, endTime: 16, content: '플러터 스터디'),
            Expanded(
                child: StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(
                  selectedDate), //스트림을 통해 selected된 날짜의 정보를 가져와서 snapshot에 넣음
              builder: (conext, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final schedule = snapshot.data![index];
                    return Dismissible(
                      key: ObjectKey(schedule.schId),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (DismissDirection direction) {
                        GetIt.I<LocalDatabase>().removeSchedule(schedule.schId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: ScheduleCard(
                          startTime: schedule.startTime,
                          endTime: schedule.endTime,
                          content: schedule.schContent,
                        ),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(
              selectedDate: selectedDate,
            ),
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
