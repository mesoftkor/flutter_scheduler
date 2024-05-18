import 'package:flutter/material.dart';
import 'package:flutter_scheduler/component/custom_text_field.dart';
import 'package:flutter_scheduler/const/colors.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final bottomInset =
        MediaQuery.of(context).viewInsets.bottom; //입력시 키보드가 차지하는 높이를 가져오기

    //키보드가 차지 하는 높이를 계산해서 bottomSheet의 높이를 지정하는 방법
    //1. 키보드가 차지하는 높이를 저장 : MediaQuery.of(context).viewInsets.bottom
    //2. bottomSheet에서 표시할 크기가 화면의 절반이므로 화면 전체 height의 반 + 키보드 높이로 높이를 지정
    //3. 아래 padding 값을 키보드 높이만큼 지정하여 해당 부분에 UI가 겹치지 않도록 처리.
    return SafeArea(
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2 +
            bottomInset, //하단에 전체 높이의 반만한 창이 올라오도록 설정(+ 키보드 높이만큼 더 올리기)
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
            bottom: bottomInset,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTExtField(
                      label: '시작 시간',
                      isTime: true,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTExtField(
                      label: '종료 시간',
                      isTime: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: CustomTExtField(
                  label: '내용',
                  isTime: false,
                ),
              ),
              SizedBox(
                width: double.infinity, //가로 전체 길이를 차지하도록 설정
                child: ElevatedButton(
                  onPressed: onSavePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text('저장'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSavePressed() {}
}
