import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: preferenceStyleBold,
    );
  }
}
