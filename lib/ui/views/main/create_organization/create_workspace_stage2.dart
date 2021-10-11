import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'create_workspace_viewmodel.dart';

class CreateWorkspaceStage2 extends StatelessWidget {
  const CreateWorkspaceStage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateWorkspaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            //buildAppBar(context, isHome: false, text: 'Create WorkSpace'),
            Row(
              children: [
                Container(
                    color: Colors.white,
                    height: 890.h,
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
                                model.stage2PageNum,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400),
                              ),
                              verticalSpaceSmall,
                              Text(
                                model.stage2Text,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w800),
                              ),
                              verticalSpaceLarge,
                              Text(
                                model.stage2SubText,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400),
                              ),
                              verticalSpaceSmall,
                              Container(
                                width: 600.w,
                                child: ZuriDeskInputField(
                                  //controller: TextEditingController(),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (_) {},
                                  hintPlaceHolder: model.stage2ExampleText,
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
                                child: AuthButton(label: model.btnText, onTap: model.goToStage3,)
                                // TextButton(
                                //   style: ButtonStyle(
                                //       backgroundColor:
                                //           MaterialStateProperty.all(
                                //               lightIconColor)),
                                //   onPressed: () {
                                //     model.goToStage3();
                                //   },
                                //   child: Text(
                                //     model.btnText,
                                //     style: authBtnStyle,
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          GotoLoginButton(isHome: true,)
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
      viewModelBuilder: () => CreateWorkspaceViewModel(),
    );
  }
}
