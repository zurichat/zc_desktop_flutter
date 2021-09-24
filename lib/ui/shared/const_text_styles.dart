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

final kCaptionTextStyle = TextStyle(
  fontSize: 20.sp,
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

final kLeftSideBarStyle = TextStyle(
  fontSize: 15.sp,
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  fontFamily: 'Lato',
);

final dropDownBodyTextStyle = TextStyle(
  fontSize: 15.sp,
  color: Colors.white,
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

TextStyle headline7 =
    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, fontFamily: 'Lato');

final headline3 = TextStyle(
  fontSize: 35.sp,
  fontWeight: FontWeight.w600,
  fontFamily: 'Lato',
);

final subtitle2 = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w400,
  fontFamily: 'Lato',
);

final bodyText1 = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w600,
  color: leftNavBarColor,
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
    fontSize: 29.sp,
    color: createChannelHeaderColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato');
TextStyle createChannelSmallHeaderStyle = TextStyle(
    fontSize: 17.sp,
    color: createChannelHeaderColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato');
TextStyle createChannelTextStyle = TextStyle(
    fontSize: 15.sp,
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

//status dialogs styles
final clearStatusTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: bodyColor,
  fontFamily: 'Lato',
);

//Preferences TextStyle

final leftSideBarPrefTextStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w600,
  color: kcPrefTitleColor,
  fontFamily: 'Lato',
);

final prefHeaderTextStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w700,
  color: kcPrefTitleColor,
  fontFamily: 'Lato',
);

final prefBodyTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: kcPrefTitleColor,
  fontFamily: 'Lato',
);

final prefSubTitleTextStyle = TextStyle(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: kcPrefSubtitleColor,
  fontFamily: 'Lato',
);
