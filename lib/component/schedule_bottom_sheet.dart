import 'package:flutter/material.dart';
import 'package:flutter_scheduler/component/custom_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height:
            MediaQuery.sizeOf(context).height / 2, //하단에 전체 높이의 반만한 창이 올라오도록 설정
        color: Colors.white,
        child: CustomTExtField(
          label: '시작시간',
        ),
      ),
    );
  }
}
