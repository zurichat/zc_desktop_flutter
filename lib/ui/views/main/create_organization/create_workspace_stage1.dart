import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';

import 'create_workspace_viewmodel.dart';

class CreateWorkspaceStage1 extends HookWidget {
  CreateWorkspaceStage1({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    return ViewModelBuilder<CreateWorkspaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
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
                          height: 60.h,
                          width: 269.w,
                          color: KStartupContainerColor,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(model.companyName,
                                  style: subtitle2.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kcBackgroundColor1,
                                  )),
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
                      children: [
                        verticalSpaceLarge,
                        verticalSpaceLarge,
                        verticalSpaceMedium,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.stage1PageNum,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                            verticalSpaceSmall,
                            Text(
                              model.stage1Text,
                              style: kHeading2TextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 48.sp,
                              ),
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
                              child: Form(
                                key: _formKey,
                                child: ZuriDeskInputField(
                                  controller: nameController,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    model.setCompanyName(value);
                                  },
                                  hintPlaceHolder: model.companyNameHint,
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('50',
                                        style: TextStyle(
                                            color: lightIconColor,
                                            fontWeight: FontWeight.w200)),
                                  ),
                                ),
                              ),
                            ),
                            verticalSpaceRegular,
                            Container(
                              height: 58.h,
                              width: 150.w,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        lightIconColor)),
                                onPressed: () {
                                  // TODO: pass name to patch request to update Organization name.
                                  model.createOrganization(nameController.text);
                                },
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
              ],
            ),
          ]),
        ),
      ),
      viewModelBuilder: () => CreateWorkspaceViewModel(),
    );
  }
}
