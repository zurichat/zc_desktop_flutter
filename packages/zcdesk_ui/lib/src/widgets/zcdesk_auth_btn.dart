import 'package:flutter/material.dart';
import 'package:zcdesk_ui/src/shared/app_colors.dart';
import 'package:zcdesk_ui/src/widgets/zcdesk_text.dart';

class AuthButton extends StatelessWidget {
  late final String label;
  late final VoidCallback? onTap;

  AuthButton({
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: authBtnColor,
          // fixedSize: Size(double.infinity, 60.h
          // )
        ),
        child: ZcdeskText.authBtnStyle(label));
  }
}
