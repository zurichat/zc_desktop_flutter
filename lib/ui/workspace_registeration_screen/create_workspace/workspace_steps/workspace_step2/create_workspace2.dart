import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'create_workspace2_viewmodel.dart';

class CreateWorkspaceView2 extends StatelessWidget {
  const CreateWorkspaceView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkspaceViewModel2>.reactive(
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
                                width: 600.w,
                                child: AuthInputField(
                                  controller: TextEditingController(),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (_) {},
                                  hintPlaceHolder: model.emailHint,
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('50',
                                        style: TextStyle(
                                            color: lightIconColor,
                                            fontWeight: FontWeight.w200)),
                                  ),
                                ),
                              ),
                              verticalSpaceRegular,
                              Container(
                                height: 58.h,
                                width: 150.w,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              lightIconColor)),
                                  onPressed: () {},
                                  child: Text(
                                    model.btnText,
                                    style: authBtnStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
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
      viewModelBuilder: () => CreateWorkspaceViewModel2(),
    );
  }

  bottomTextStyle() {
    return TextStyle(
        fontFamily: 'Lato',
        fontSize: 18.sp,
        color: Color.fromRGBO(153, 153, 153, 1),
        fontWeight: FontWeight.w400);
  }

  buildLine() {
    return Container(
      height: 1.h,
      width: 187.w,
      color: Color.fromRGBO(219, 219, 219, 1),
    );
  }
}
