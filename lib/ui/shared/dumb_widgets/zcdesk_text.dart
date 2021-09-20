import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ZcdeskText extends StatelessWidget {
  final String text;
  final TextStyle style;

  ZcdeskText.headingOne(this.text) : style = kHeading1TextStyle;
  ZcdeskText.headingTwo(this.text) : style = kHeading2TextStyle;
  ZcdeskText.headingThree(this.text) : style = kHeading3TextStyle;
  ZcdeskText.headingFour(this.text) : style = kHeading4TextStyle;
  ZcdeskText.headline(this.text) : style = kHeadlineTextStyle;
  ZcdeskText.bodyText(this.text) : style = kBodyTextStyle;
  ZcdeskText.subheading(this.text) : style = kSubHeadingTextStyle;
  ZcdeskText.caption(this.text) : style = kCaptionTextStyle;
  ZcdeskText.extraSmallText(this.text) : style = kExtraSmallTextStyle;
  ZcdeskText.authBtnStyle(this.text) : style = authBtnStyle;
  ZcdeskText.dropDownBodyTextStyle(this.text) : style = dropDownBodyTextStyle;
  ZcdeskText.leftSideBarText(this.text) : style = kLeftSideBarStyle;
  ZcdeskText.leftSideBarLogoText(this.text) : style = leftSideBarLogoText;
  ZcdeskText.boldCaption(this.text) : style = boldCaptionStyle;
  ZcdeskText.lightCaption(this.text) : style = lightCaptionStyle;
  ZcdeskText.preferenceBtn(this.text) : style = authBtnStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
