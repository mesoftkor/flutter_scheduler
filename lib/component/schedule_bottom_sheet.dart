import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_scheduler/component/custom_text_field.dart';
import 'package:flutter_scheduler/const/colors.dart';
import 'package:flutter_scheduler/database/drift_database.dart';
import 'package:get_it/get_it.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet({
    required this.selectedDate,
    super.key,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  @override
  Widget build(BuildContext context) {
    final bottomInset =
        MediaQuery.of(context).viewInsets.bottom; //입력시 키보드가 차지하는 높이를 가져오기

    //키보드가 차지 하는 높이를 계산해서 bottomSheet의 높이를 지정하는 방법
    //1. 키보드가 차지하는 높이를 저장 : MediaQuery.of(context).viewInsets.bottom
    //2. bottomSheet에서 표시할 크기가 화면의 절반이므로 화면 전체 height의 반 + 키보드 높이로 높이를 지정
    //3. 아래 padding 값을 키보드 높이만큼 지정하여 해당 부분에 UI가 겹치지 않도록 처리.
    return Form(
      key: formKey,
      child: SafeArea(
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
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          //저장이 실행되면 변수에 텍스트 필드값 저장
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextField(
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          //저장이 실행되면 변수에 텍스트 필드값 저장
                          endTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: CustomTextField(
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                      //저장이 실행되면 변수에 텍스트 필드값 저장
                      content = val;
                    },
                    validator: contentValidator,
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
      ),
    );
  }

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await GetIt.I<LocalDatabase>().createSchedule(
        SchedulesCompanion(
          //SchedulesCompanion에 value로 입력을 해야 매개변수로 등록가능
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          schContent: Value(content!),
          schDate: Value(widget.selectedDate),
        ),
      );

      Navigator.pop(context); //일정생성 완료후 뒤로가기 실행
    }
  }

  //시간을 입력했는지 여부 체크
  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해주세요';
    }

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요.';
    }

    return null;
  }

  //내용을 입력했는지 여부 체크
  String? contentValidator(String? val) {
    if (val == null || val.length == 0) {
      return '값을 입력해주세요.';
    }

    return null;
  }
}
