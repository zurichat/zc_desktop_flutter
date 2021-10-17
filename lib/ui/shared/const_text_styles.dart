import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';

// Text Styles we will be using through the app.
final kHeading1TextStyle = TextStyle(
  fontSize: 43.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

final kHeading2TextStyle = TextStyle(
  fontSize: 37.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Lato',
);

final channelDetailTitleTextStyle = TextStyle(
  fontSize: 17.sp,
  fontWeight: FontWeight.w700,
  fontFamily: 'Lato',
);

final kHeading3TextStyle = TextStyle(
  fontSize: 31.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Lato',
);

final kHeading4TextStyle = TextStyle(
  fontSize: 25.sp,
  fontWeight: FontWeight.w700,
  fontFamily: 'Lato',
);

final kHeadlineTextStyle = TextStyle(
  fontSize: 30.sp,
  fontWeight: FontWeight.w700,
  fontFamily: 'Lato',
);

final kBodyTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final kSubHeadingTextStyle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final kSubHeadingTextStyle1 = TextStyle(
  fontSize: 20.sp,
  color: kcPrimaryColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final kCaptionTextStyle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final kSubHeadingTextStyle2 = TextStyle(
  fontSize: 18.sp,
  color: kcPrimaryColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final kExtraSmallTextStyle = TextStyle(
  overflow: TextOverflow.fade,
  fontSize: 11.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final authBtnStyle = TextStyle(
  fontSize: 20.sp,
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

final profileBtnStyle = TextStyle(
  fontSize: 18.sp,
  color: whiteColor,
  // fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

final kLeftSideBarStyle = TextStyle(
  fontSize: 15.sp,
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  fontFamily: 'Lato',
);

final dropDownBodyTextStyle = TextStyle(
  fontSize: 12.sp,
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);
final leftSideBarLogoText = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

final boldCaptionStyle = TextStyle(
  fontSize: 15.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Lato',
);

final lightCaptionStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w300,
  fontFamily: 'Lato',
);

// ====== New Text Styles ====== //

final headline6 = TextStyle(
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
  fontFamily: 'Lato',
);

final headline8 = TextStyle(
  fontSize: 25.sp,
  fontWeight: FontWeight.w500,
  color: createChannelHeaderColor,
  fontFamily: 'Lato',
);

final headline7 = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final headline3 = TextStyle(
  fontSize: 35.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Lato',
);

final subtitle2 = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final subtitlec2 = TextStyle(
  fontSize: 16.sp,
  color: kcBackgroundColor2,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final subtitle2b = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Lato',
  color: createChannelHeaderColor,
  fontWeight: FontWeight.bold,
);

final subtitle3 = TextStyle(
  fontSize: 20.sp,
  color: createChannelHeaderColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final subtitle3b = TextStyle(
  fontSize: 16.sp,
  color: createChannelHeaderColor,
  fontWeight: FontWeight.w500,
  fontFamily: 'Lato',
);

final bodyText1 = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w600,
  color: leftNavBarColor,
  fontFamily: 'Lato',
);

final preferenceStyleNormal = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

final preferenceStyleBold = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w700,
);

final subtitle3bb = TextStyle(
  fontSize: 16.sp,
  color: createChannelHeaderColor,
  fontWeight: FontWeight.w500,
  fontFamily: 'Lato',
);

final searchModal = TextStyle(
  color: avatarColor4,
  fontSize: 16.sp,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

final searchModal1 = TextStyle(
  color: headerColor,
  fontSize: 18.sp,
  fontWeight: FontWeight.w700,
  fontFamily: 'Lato',
);

final searchModal2 = TextStyle(
  fontFamily: 'Lato',
  fontWeight: FontWeight.w500,
  fontSize: 18.sp,
  color: bodyColor,
);

final searchModal3 = TextStyle(
  color: bodyColor,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w700,
  fontSize: 18.sp,
);

final searchModal4 = TextStyle(
  color: bodyColor,
  fontSize: 18.sp,
  fontFamily: 'Lato',
);

final messageSenderStyleBold = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w800,
);

final messageStyleNormal = TextStyle(
  fontSize: 15.sp,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w400,
);

final messageTimeStyleNormal = TextStyle(
  fontSize: 14.sp,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w300,
  // color: Colors.grey[300]
);

//Create and Display Channels Styles
TextStyle authBtnChannelStyle = TextStyle(
    fontSize: 20.sp,
    color: whiteColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Lato');
TextStyle authBtnChannelDisplayStyle = TextStyle(
    fontSize: 20.sp,
    color: whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato');
TextStyle authBtnChannelDisplayBlackStyle = TextStyle(
    fontSize: 20.sp,
    color: createChannelHeaderColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Lato');
TextStyle leftSideBarStyle = TextStyle(
    fontSize: 15.sp,
    color: leftNavBarColor,
    fontWeight: FontWeight.normal,
    fontFamily: 'Lato');
TextStyle searchChannelHeaderStyle = TextStyle(
    fontSize: 16.sp,
    color: kcDisplayChannelColor4,
    fontWeight: FontWeight.w600,
    fontFamily: 'Lato');
TextStyle searchChannelHeaderGreenStyle = TextStyle(
    fontSize: 16.sp,
    color: kcPrimaryColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Lato');
TextStyle createChannelHeaderStyle = TextStyle(
    fontSize: 28.sp,
    color: createChannelHeaderColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato');
TextStyle createChannelSmallHeaderStyle = TextStyle(
    fontSize: 17.sp,
    color: createChannelHeaderColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato');
TextStyle createChannelTextStyle = TextStyle(
    fontSize: 13.5.sp,
    color: createChannelTextColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato');
TextStyle displayChannelSmallHeaderStyle = TextStyle(
    fontSize: 21.sp,
    color: whiteColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Lato');
TextStyle displayChannelSmallHeaderBlackStyle = TextStyle(
    fontSize: 20.5.sp,
    color: createChannelHeaderColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato');

TextStyle newToZuriChatTextstyle = TextStyle(
    fontSize: 13.sp,
    color: createAccountColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Lato');
TextStyle voiceCallTextstyle = TextStyle(
    fontSize: 13.sp,
    color: kcDisplayChannelColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato');

TextStyle viewProfileTextstyle = TextStyle(
    fontSize: 15.sp,
    color: headerColor,
    fontWeight: FontWeight.w700,
    fontFamily: 'Lato');

TextStyle ZuriTextstyle = TextStyle(
    fontSize: 38.71.sp,
    color: ZuriWorkspaceTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: 'Lato');

//status dialogs styles
final clearStatusTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: bodyColor,
  fontFamily: 'Lato',
);

//All DMs TextStyle
TextStyle allDmsTitleStyle = TextStyle(
    fontSize: 15.sp,
    color: Color(0xff3A3A3A),
    fontWeight: FontWeight.w700,
    fontFamily: 'Lato');

TextStyle allDmsSubtitleStyle = TextStyle(
    fontSize: 15.sp,
    color: Color(0xff3A3A3A),
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato');

TextStyle allDmsTrailingStyle = TextStyle(
    fontSize: 13.sp,
    color: Color(0xffC1C1C1),
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato');

TextStyle allDmsAppbarStyle = TextStyle(
    fontSize: 18.sp,
    color: kcPrimaryLight,
    fontWeight: FontWeight.w700,
    fontFamily: 'Lato');

TextStyle allDmsDayStyle = TextStyle(
    fontSize: 13.sp,
    color: Color(0xff242424),
    fontWeight: FontWeight.w400,
    fontFamily: 'Lato');

final changeRegionStyle = TextStyle(
  color: createAccountColor,
  fontSize: 18.sp,
  fontWeight: FontWeight.w700,
  fontFamily: 'Lato',
);

final regionStyle = TextStyle(
  color: leftNavBarColor,
  fontSize: 18.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);
 final bottomTextStyle = TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.sp,
        color: Color.fromRGBO(153, 153, 153, 1),
        fontWeight: FontWeight.w400);
  

final addPeopleChannelStyle = TextStyle(
  fontSize: 25,
  fontFamily: 'Lato',
  fontWeight: FontWeight.bold,
);

final leftSideBarPrefTextStyle =
    subtitle2.copyWith(fontWeight: FontWeight.w600);

final prefHeaderTextStyle = subtitle2.copyWith(fontWeight: FontWeight.w700);

final prefBodyTextStyle = kBodyTextStyle.copyWith(fontWeight: FontWeight.w600);

final prefSubTitleTextStyle =
    kBodyTextStyle.copyWith(fontWeight: FontWeight.w600, color: bodyColor);
