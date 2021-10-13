import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'create_workspace_viewmodel.dart';

class CreateWorkspaceStage3 extends StatelessWidget {
  const CreateWorkspaceStage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height - 40);
    return ViewModelBuilder<CreateWorkspaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            //buildAppBar(context, isHome: false, text: 'Create'),
          Row(
            children: [
              Container(
                  color: Colors.white,
                  height: height,
                  width: 269.w,
                  child: Column(
                    children: [
                      Container(
                        height: 60.h,
                        width: 269.w,
                        color: KStartupContainerColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(model.companyName),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  height: height,
                  width: 731.w,
                  color: Colors.grey[200],
                  // margin: EdgeInsets.symmetric(horizontal: 72.w),
                  child: Container(
                    width: 644.w,
                    child: Column(
                      children: [
                        // Container(
                        //     height: 40,
                        //     child: buildAppBar(context,
                        //         isSignIn: true, text: 'Forget Password | Zuri')),
                        verticalSpaceLarge,
                        // verticalSpaceLarge,
                        // verticalSpaceMedium,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.stage3PageNum,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                            verticalSpaceSmall,
                            Text(
                              model.stage3Text,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              model.stage3SubText,
                              style: TextStyle(
                                  color: KStartupContainerColor,
                                  fontSize: 40.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w800),
                            ),
                            verticalSpaceLarge,
                            Text(
                              model.signInSubtext,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                            verticalSpaceSmall,
                            Container(
                              width: 650.w,
                              child: ZuriDeskInputField(
                                controller: TextEditingController(),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (_) {},
                                hintPlaceHolder: model.stage3EmailHint,
                              ),
                            ),
                            verticalSpaceSmall,
                          ],
                        ),
                        verticalSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                          child: IconTest(),
                        ),
                        verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 315, 0),
                          child: Buttons(
                            text1: model.btnText,
                            onContinueTapped: () {
                              model.goToHome();
                            },
                            text2: model.btnText2,
                            onSkipTapped: () {
                              model.goToHome();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      viewModelBuilder: () => CreateWorkspaceViewModel(),
    );
  }
}

class IconTest extends StatelessWidget {
  const IconTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.add_circle_outline, size: 18),
                onPressed: () {},
                hoverColor: Colors.white,
              ),
              Text(
                ' Add Another',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.add_link_sharp, size: 18),
                onPressed: () {},
                hoverColor: Colors.black,
                color: KStartupContainerColor,
              ),
              Text(
                ' Get a sharable link ',
                style: TextStyle(
                    color: KStartupContainerColor,
                    fontSize: 18.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'instead',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onContinueTapped;
  final Function() onSkipTapped;
  const Buttons(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.onContinueTapped,
      required this.onSkipTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 58.h,
                width: 150.w,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kcPrimaryColor)),
                  onPressed: onContinueTapped,
                  child: Text(
                    text1,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          horizontalSpaceTiny,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 58.h,
                width: 150.w,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[200])),
                  onPressed: onSkipTapped,
                  child: Text(
                    text2,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
