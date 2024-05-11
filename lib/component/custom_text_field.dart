import 'package:flutter/material.dart';
import 'package:flutter_scheduler/const/colors.dart';

class CustomTExtField extends StatelessWidget {
  final String label;
  final bool isTime;

  const CustomTExtField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          //여백이 없으면 어색하여 여백 기능 임의로 추가
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextFormField(), //여러개의 텍스트 필드를 web의 form처럼 하나의 form으로 제어할때 사용
      ],
    );
  }
}
