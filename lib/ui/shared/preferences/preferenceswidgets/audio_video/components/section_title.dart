import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../const_app_colors.dart';
import '../../../../const_text_styles.dart';

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
      style: prefHeaderTextStyle,
    );
  }
}
