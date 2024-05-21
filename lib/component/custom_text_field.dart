import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scheduler/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField({
    required this.label,
    required this.isTime,
    required this.onSaved,
    required this.validator,
    super.key,
  });

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
            style: const TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            cursorColor: Colors.grey,
            maxLines: isTime ? 1 : null, //null은 최대줄수 제한 없음
            expands: !isTime, //크기를 부모크기만큼 키울지 여부
            keyboardType: //핸드폰에서 보여주는 키보드만 제한 가능(보안키보드, 블투 제한 못함)
                isTime
                    ? TextInputType.number
                    : TextInputType.multiline, //시간일경우 숫자만 보이는 자판, 아니면 엔터가 있는 자판
            inputFormatters: //어느키보드던지 구분하지 않고 입력되는 값을 제한 가능
                isTime
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : [], //isTime 이면 숫자만 들어가도록 제한
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffixText: isTime ? '시' : null, //isTime인 경우 접미사 '시' 추가
            ),
          ),
        ), //여러개의 텍스트 필드를 web의 form처럼 하나의 form으로 제어할때 사용
      ],
    );
  }
}
