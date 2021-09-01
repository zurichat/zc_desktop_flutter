import 'package:flutter/material.dart';
import 'package:zcdesk_ui/src/shared/styles.dart';

class ZcdeskText extends StatelessWidget {
  final String text;
  final TextStyle style;

    ZcdeskText.headingOne(this.text) : style = heading1Style;
    ZcdeskText.headingTwo(this.text) : style = heading2Style;
    ZcdeskText.headingThree(this.text) : style = heading3Style;
    ZcdeskText.headingFour(this.text) : style = heading4Style;
    ZcdeskText.headline(this.text) : style = headlineStyle;
    ZcdeskText.bodyText(this.text) : style = bodyStyle;
    ZcdeskText.subheading(this.text) : style = subheadingStyle;
    ZcdeskText.caption(this.text) : style = captionStyle;
    ZcdeskText.extraSmallText(this.text) : style = extraSmallStyle;
    ZcdeskText.authBtnStyle(this.text) : style = authBtnStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
