import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ZcdeskText extends StatelessWidget {
  final String text;
  final TextStyle style;

  ZcdeskText.headingOne(this.text) : style = heading1Style;
  ZcdeskText.headingTwo(this.text) : style = heading2Style;
  ZcdeskText.headingThree(this.text) : style = heading3Style;
  ZcdeskText.headingFour(this.text) : style = heading4Style;
  ZcdeskText.headingCreateChannel(this.text) : style = createChannelHeaderStyle;
  ZcdeskText.searchChannelHeaderStyle(this.text) : style = searchChannelHeaderStyle;
  ZcdeskText.searchChannelHeaderGreenStyle(this.text) : style = searchChannelHeaderGreenStyle;
  ZcdeskText.headingSmallCreateChannel(this.text) : style = createChannelSmallHeaderStyle;
  ZcdeskText.displayChannelSmallHeaderBlackStyle(this.text) : style = displayChannelSmallHeaderBlackStyle;
  ZcdeskText.textCreateChannel(this.text) : style = createChannelTextStyle;
  ZcdeskText.displayChannelSmallHeaderStyle(this.text) : style = displayChannelSmallHeaderStyle;
  ZcdeskText.headline(this.text) : style = headlineStyle;
  ZcdeskText.bodyText(this.text) : style = bodyStyle;
  ZcdeskText.subheading(this.text) : style = subheadingStyle;
  ZcdeskText.caption(this.text) : style = captionStyle;
  ZcdeskText.extraSmallText(this.text) : style = extraSmallStyle;
  ZcdeskText.authBtnStyle(this.text) : style = authBtnStyle;
  ZcdeskText.authBtnChannelStyle(this.text) : style = authBtnChannelStyle;
  ZcdeskText.authBtnChannelDisplayStyle(this.text) : style = authBtnChannelDisplayStyle;
  ZcdeskText.authBtnChannelDisplayBlackStyle(this.text) : style = authBtnChannelDisplayBlackStyle;
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
