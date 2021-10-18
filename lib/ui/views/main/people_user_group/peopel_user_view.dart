import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_input_field.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/people_user_view_model.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/widgets/group_view.dart';
import 'package:zc_desktop_flutter/ui/views/main/people_user_group/widgets/people_view.dart';

class PeopleUserGroupView extends StatelessWidget {
  PeopleUserGroupView({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<PeopleUserGroupViewModel>.reactive(
      viewModelBuilder: () => PeopleUserGroupViewModel(),
      builder: (
        BuildContext context,
        PeopleUserGroupViewModel model,
        Widget? child,
      ) {
        return Container(
            color: kcBackgroundColor2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:2.0),
                  child: Container(
                    height: 40.h,
                    width: double.infinity,
                    color: kcPrimaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '# $AddPeopleText',
                          style: headline7.copyWith(color: kcBackgroundColor2),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.close, color: Colors.white),
                              padding: const EdgeInsets.only(bottom: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    AddPeopleUserGroupHeader,
                    style: preferenceStyleNormal,
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 564.w,
                        child: ZuriDeskInputField(
                          hintPlaceHolder: InvitePeopleTextFieldHintText,
                          errorText: model.errorText,
                          controller: _emailController,
                        ),
                      ),
                      horizontalSpaceRegular,
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: model.errorText != null ? 30.h : 0),
                        child: Container(
                          height: 45.h,
                          width: 107.w,
                          color: kcViewColor,
                          child: GestureDetector(
                            onTap: () => model
                                .inviteUsersToOrg(_emailController.text)
                                .then((value) {
                              if (model.errorText == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    model.hasError
                                        ? UserAdditionErrorMessage
                                        : UserAdittionSuccessMessage,
                                  ),
                                  backgroundColor: model.hasError
                                      ? Theme.of(context).errorColor
                                      : kcPrimaryColor,
                                ));
                              }
                            }),
                            child: Center(
                              child: model.isBusy
                                  ? CircularProgressIndicator(
                                      color: kcPrimaryColor,
                                    )
                                  : Text(AddButtonText,
                                      style: preferenceStyleNormal),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(children: [
                      GestureDetector(
                        onTap: () => model.setPageIndex(0),
                        child: Text(
                          MemberText,
                          style: preferenceStyleNormal.copyWith(
                              color: kcPrimaryColor),
                        ),
                      ),
                      horizontalSpaceLarge,
                      // GestureDetector(
                      //   onTap: () => model.setPageIndex(1),
                      //   child: Text(
                      //     GroupText,
                      //     style: preferenceStyleNormal.copyWith(
                      //         color: kcPrimaryColor),
                      //   ),
                      // )
                    ]),
                  ),
                ),
                Stack(
                  children: [
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width <= 1540
                              ? model.pageIndex == 0
                                  ? 26.0.w
                                  : 146.w
                              : model.pageIndex == 0
                                  ? 10.0.w
                                  : 90.w),
                      child: Container(
                        height: 4.h,
                        width: 36.w,
                        color: kcPrimaryColor,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: model.pageIndex == 0 ? PeopleView() : GroupView(),
                )
              ],
            ));
      },
    );
  }
}
