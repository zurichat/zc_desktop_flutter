import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ZcDeskButton extends StatelessWidget {
  const ZcDeskButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kcSecondaryColor,
        minimumSize: Size.fromHeight(58.0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: subtitle2.copyWith(
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
