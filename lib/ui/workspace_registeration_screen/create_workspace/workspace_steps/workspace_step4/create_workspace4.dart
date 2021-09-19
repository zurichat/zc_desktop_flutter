import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'create_workspace4_viewmodel.dart';

class CreateWorkspaceView4 extends StatelessWidget {
  const CreateWorkspaceView4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkspaceViewModel4>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          controller: model.controllerOne,
          child: Column(children: [
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
                    // margin: EdgeInsets.symmetric(horizontal: 72.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Container(
                          //     height: 40,
                          //     child: buildAppBar(context,
                          //         isSignIn: true, text: 'Forget Password | Zuri')),
                          verticalSpaceLarge,
                          verticalSpaceLarge,
                          verticalSpaceMedium,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.signInPgNum,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400),
                              ),
                              verticalSpaceSmall,
                              Text(
                                model.signInText2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                model.signInText3,
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
                                child: AuthInputField(
                                  controller: TextEditingController(),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (_) {},
                                  hintPlaceHolder: model.emailHint,
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
                            child: buttons(context, model),
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
      ),
      viewModelBuilder: () => CreateWorkspaceViewModel4(),
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
              // IconButton(
              //   icon: Icon(Icons.add_link_sharp, size: 18),
              //   onPressed: () {},
              //   hoverColor: Colors.black,
              //   color: KStartupContainerColor,
              // ),
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

Widget buttons(BuildContext context, CreateWorkspaceViewModel4 model) {
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
                    backgroundColor: MaterialStateProperty.all(kcPrimaryColor)),
                onPressed: () {},
                child: Text(
                  model.btnText,
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
                onPressed: () {},
                child: Text(
                  model.btnText2,
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
