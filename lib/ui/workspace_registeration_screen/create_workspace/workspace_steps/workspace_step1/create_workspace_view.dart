// ignore_for_file: implementation_imports

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/workspace_registeration_screen/create_workspace/workspace_steps/workspace_step1/create_workspace_viewmodel.dart';

class CreateWorkspaceView extends StatelessWidget {
  const CreateWorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = false;
    return ViewModelBuilder<CreateWorkspaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Container(
                //     height: 40,
                //     child: buildAppBar(context,
                //         isSignIn: true, text: 'Forget Password | Zuri')),
                verticalSpaceLarge,
                verticalSpaceLarge,
                Image.asset(model.logoUrl),
                verticalSpaceMedium,
                Text(
                  model.signInText,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 43.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                verticalSpaceSmall,
                Text(
                  model.signInText2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400),
                ),
                verticalSpaceLarge,
                Container(
                  width: 440.w,
                  child: AuthInputField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) {},
                    hintPlaceHolder: model.emailHint,
                  ),
                ),
                verticalSpaceRegular,
                Container(
                  height: 58.h,
                  width: 440.w,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kcPrimaryColor)),
                    onPressed: () {},
                    child: Text(
                      model.btnText,
                      style: authBtnStyle,
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 140, 0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: check,
                          activeColor: kcSuccessColor,
                          onChanged: (value) {},
                        ),
                        Text(
                          model.policy,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  model.signInPolicySubtext,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400),
                ),
                verticalSpaceRegular,
                verticalSpaceMedium,
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.privacy,
                    style: bottomTextStyle(),
                  ),
                  horizontalSpaceMedium,
                  Text(
                    model.contactUs,
                    style: bottomTextStyle(),
                  ),
                  horizontalSpaceMedium,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/world.svg'),
                      ),
                      Text(
                        model.changeRegion,
                        style: bottomTextStyle(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/arrow_down.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => CreateWorkspaceViewModel(),
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
