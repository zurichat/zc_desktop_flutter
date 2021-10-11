import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ZcDeskButton extends StatelessWidget {
  const ZcDeskButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.filled = false,
      this.fillColor,
      this.child
      })
      : super(key: key);

  final String? text;
  final VoidCallback? onPressed;
  final bool filled;
  final Color? fillColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: filled ? fillColor : Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey, width: 1.0)),
        minimumSize: Size.fromHeight(58.0),
      ),
      onPressed: onPressed,
      child: text == null ? child : Text(
        text!,
        style: subtitle2.copyWith(
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
