import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

import 'error_view_model.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ErrorViewModel>.nonReactive(
      viewModelBuilder: () => ErrorViewModel(),
      builder: (
        BuildContext context,
        ErrorViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: kcDisplayChannelColor,
          body: Center(
            child: Container(
              height: 360.h,
              width: 629.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kcBackgroundColor1),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.32, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ErrorHeaderText,
                        style: kHeadlineTextStyle.copyWith(
                          fontSize: 28.sp,
                        )),
                    verticalSpaceSmall,
                    RichText(
                        text: TextSpan(
                            text: WeAreSorryText,
                            style: boldCaptionStyle,
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => model.launchUrl(ZuriStatusUrlText),
                              text: '$ZuriStatusUrlText ',
                              style: boldCaptionStyle.copyWith(
                                color: kcPrimaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: MightBeFromOurEndText,
                                  style: boldCaptionStyle,
                                )
                              ])
                        ])),
                    verticalSpaceSmall,
                    Text(
                      TroubleshootText,
                      style: headline7,
                    ),
                    verticalSpaceRegular,
                    Text(
                      FewThingToTryText,
                      style: boldCaptionStyle,
                    ),
                    verticalSpaceRegular,
                    Row(children: [
                      const BuildCircularDot(),
                      horizontalSpaceSmall,
                      Text(
                        InternetIsnotBlockText,
                        style: boldCaptionStyle,
                      )
                    ]),
                    verticalSpaceRegularOne,
                    Row(
                      children: [
                        const BuildCircularDot(),
                        horizontalSpaceSmall,
                        Text(
                          CheckInternetText,
                          style: boldCaptionStyle,
                        )
                      ],
                    ),
                    verticalSpaceRegularOne,
                    Row(
                      children: [
                        BuildCircularDot(),
                        horizontalSpaceSmall,
                        Text(
                          RestartZuriText,
                          style: boldCaptionStyle,
                        )
                      ],
                    ),
                    verticalSpaceMediumTwo,
                    RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => model.launchUrl(''),
                          text: CheckHelpText,
                          style: boldCaptionStyle.copyWith(
                            color: kcPrimaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: MoreDetailsText,
                              style: boldCaptionStyle,
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BuildCircularDot extends StatelessWidget {
  const BuildCircularDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: hoverColor),
    );
  }
}
