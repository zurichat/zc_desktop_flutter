import 'package:flutter/material.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

class ZcdeskText extends StatelessWidget {
  final String text;
  final TextStyle style;

  ZcdeskText.headingOne(this.text) : style = kHeading1TextStyle;
  ZcdeskText.headingTwo(this.text) : style = kHeading2TextStyle;
  ZcdeskText.headingThree(this.text) : style = kHeading3TextStyle;
  ZcdeskText.headingFour(this.text) : style = kHeading4TextStyle;
  ZcdeskText.headingCreateChannel(this.text) : style = createChannelHeaderStyle;
  ZcdeskText.searchChannelHeaderStyle(this.text)
      : style = searchChannelHeaderStyle;
  ZcdeskText.searchChannelHeaderGreenStyle(this.text)
      : style = searchChannelHeaderGreenStyle;
  ZcdeskText.headingSmallCreateChannel(this.text)
      : style = kHeading2TextStyle;
  ZcdeskText.displayChannelSmallHeaderBlackStyle(this.text)
      : style = displayChannelSmallHeaderBlackStyle;
  ZcdeskText.textCreateChannel(this.text) : style = createChannelTextStyle;
  ZcdeskText.displayChannelSmallHeaderStyle(this.text)
      : style = boldCaptionStyle;
  ZcdeskText.headline(this.text) : style = kHeadlineTextStyle;
  ZcdeskText.headline2(this.text) : style = headline8;
  ZcdeskText.bodyText(this.text) : style = kBodyTextStyle;
  ZcdeskText.subheading(this.text) : style = kSubHeadingTextStyle;
  ZcdeskText.caption(this.text) : style = kCaptionTextStyle;
  ZcdeskText.extraSmallText(this.text) : style = kExtraSmallTextStyle;
  ZcdeskText.authBtnStyle(this.text) : style = authBtnStyle;
  ZcdeskText.authBtnChannelStyle(this.text) : style = authBtnChannelStyle;
  ZcdeskText.authBtnChannelDisplayStyle(this.text)
      : style = authBtnChannelDisplayStyle;
  ZcdeskText.authBtnChannelDisplayBlackStyle(this.text)
      : style = authBtnChannelDisplayBlackStyle;
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
    );
  }
}
