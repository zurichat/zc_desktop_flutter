import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

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
