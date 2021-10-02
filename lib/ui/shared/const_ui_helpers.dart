import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//common values
final topBarHeight = 50.h;

// horizontal spacing
Widget horizontalSpaceVeryTiny = SizedBox(
  width: 3.0.w,
);
Widget horizontalSpaceTiny = SizedBox(width: 5.0.w);
Widget horizontalSpaceSmall = SizedBox(width: 10.0.w);
Widget horizontalSpaceRegular = SizedBox(width: 18.0.w);
Widget horizontalSpaceMedium = SizedBox(width: 25.0.w);
Widget horizontalSpaceLarge = SizedBox(width: 50.0.w);

// vertical spacing
Widget verticalSpaceTiny = SizedBox(height: 5.0.h);
Widget verticalSpaceTinyTwo = SizedBox(height: 6.0.h);
Widget verticalSpaceTinyThree = SizedBox(height: 3.0.h);
Widget verticalSpaceSmall = SizedBox(height: 10.0.h);
Widget verticalSpaceSmallOne = SizedBox(height: 16.0.h);
Widget verticalSpaceRegular = SizedBox(height: 18.0.h);
Widget verticalSpaceRegularOne = SizedBox(height: 16.0.h);
Widget verticalSpaceMedium = SizedBox(height: 25.0.h);
Widget verticalSpaceMediumTwo = SizedBox(height: 30.0.h);
Widget verticalSpaceLarge = SizedBox(height: 50.0.h);

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
