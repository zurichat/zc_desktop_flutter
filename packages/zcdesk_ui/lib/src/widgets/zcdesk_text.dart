import 'package:flutter/material.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';

class ZcdeskText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ZcdeskText.headingOne(this.text) : style = heading1Style;
  const ZcdeskText.headingTwo(this.text) : style = heading2Style;
  const ZcdeskText.headingThree(this.text) : style = heading3Style;
  const ZcdeskText.headingFour(this.text) : style = heading4Style;
  const ZcdeskText.headline(this.text) : style = headlineStyle;
  const ZcdeskText.bodyText(this.text) : style = bodyStyle;
  const ZcdeskText.subheading(this.text) : style = subheadingStyle;
  const ZcdeskText.caption(this.text) : style = captionStyle;
  const ZcdeskText.extraSmallText(this.text) : style = extraSmallStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
