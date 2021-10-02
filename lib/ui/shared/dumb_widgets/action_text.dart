import 'package:flutter/material.dart';

class ActionText extends StatelessWidget {
  const ActionText(
      {Key? key,
      this.textDecoration,
      this.textColor = Colors.blue,
      this.text = '',
      this.onTap,
      })
      : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final TextDecoration? textDecoration;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            decoration: textDecoration,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: textColor),
      ),
    );
  }
}
