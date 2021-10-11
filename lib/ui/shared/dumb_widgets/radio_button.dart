import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import '../const_app_colors.dart';

class BuildRadio extends StatelessWidget {
  final dynamic value;
  final Object groupValue;
  final void Function(dynamic value)? onChanged;
  final String txt;
  const BuildRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: kcPrimaryColor,
        ),
        Text(
          txt,
          style: prefBodyTextStyle,
        )
      ],
    );
  }
}