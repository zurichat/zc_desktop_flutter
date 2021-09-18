import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

import 'create_workspace5_viewmodel.dart';

class CreateWorkspaceView5 extends StatelessWidget {
  const CreateWorkspaceView5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkspaceViewModel5>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          controller: model.controllerOne,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      color: Colors.white,
                      height: 890.h,
                      width: 269.w,
                      child: Column(
                        children: [
                          Container(
                            height: 70.h,
                            width: 269.w,
                            color: KStartupContainerColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 20.h,
                                width: 250.w,
                                color: Colors.grey[300],
                                child: Text(''),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 890.h,
                      width: 731.w,
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          verticalSpaceSmall,
                          Image.asset(model.logoUrl,
                              width: 100, height: 40, fit: BoxFit.fill),
                          verticalSpaceMedium,
                          verticalSpaceLarge,
                          Container(
                            height: 102.h,
                            width: 102.h,
                            color: Color(0xffC4C4C4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  model.signInText2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 43.sp,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          verticalSpaceSmall,
                          Text(
                            model.signInText3,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 45.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600),
                          ),
                          verticalSpaceLarge,
                          verticalSpaceSmall,
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lato',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: model.signInText1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                TextSpan(
                                    text: model.signInSubtext,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}),
                                TextSpan(
                                  text: model.signInText4,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Lato',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: model.signInText5,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                TextSpan(
                                    text: model.signInText6,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}),
                              ],
                            ),
                          ),
                          verticalSpaceRegular,
                          verticalSpaceMedium,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => CreateWorkspaceViewModel5(),
    );
  }
}
