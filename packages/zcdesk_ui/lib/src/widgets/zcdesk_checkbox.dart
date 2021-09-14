import 'package:flutter/material.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class ZcCheckBox extends StatelessWidget {
   const ZcCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.fillColor
  }) : super(key: key);

  final MaterialStateProperty<Color?>? fillColor;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Checkbox(
          checkColor: kcBackgroundColor1,
          fillColor: fillColor,
          splashRadius: 17,
          value: value,
          onChanged: onChanged
      ),
    );
  }
}
