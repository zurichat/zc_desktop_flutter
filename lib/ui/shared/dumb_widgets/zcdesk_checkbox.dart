import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';

class ZcCheckBox extends StatelessWidget {
   const ZcCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Checkbox(
          checkColor: kcBackgroundColor1,
          activeColor: kcPrimaryColor,
          splashRadius: 17,
          value: value,
          onChanged: onChanged
      ),
    );
  }
}
