import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_footer.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/change_region/change_region_view.dart';

import 'choose_workspace_viewmodel.dart';

class ChooseWorkspaceView extends StatelessWidget {
  const ChooseWorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseWorkspaceViewmodel>.reactive(
      viewModelBuilder: () => ChooseWorkspaceViewmodel(),
      onModelReady: (model) async => await model.init(),
      builder: (context, model, _) => Scaffold(
        body: model.isBusy
            ? Center(
                child: CircularProgressIndicator(
                  color: kcPrimaryColor,
                ),
              )
            : Container(
                height: 1024.h,
                width: 1440.w,
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ZuriLogoAndText(model),
                    largeWorkspaceText(),
                    promiseText(),
                    openButtonWidget(model),
                    WorkspaceBox(
                      model,
                      listTileItemCount: 2,
                      workspaceOwner: model.user.email == ''
                          ? EmailHintText
                          : model.user.email,
                    ),
                    signIntoNewWorkspace(model),
                    AuthFooter(),
                  ],
                ),
              ),
      ),
    );
  }
  //This is the text that helps to sign in to a new or different workspace
  // not on our available workspace
  InkWell signIntoNewWorkspace(ChooseWorkspaceViewmodel model) {
    return InkWell(
      onTap: model.goToCreateWorkSpace,
      child: Container(
        margin:
            EdgeInsets.only(left: 530.w, right: 530.w, top: 10.h, bottom: 10.h),
        child: Text(
          SignIntoNewWorkspace,
          style: newToZuriChatTextstyle.copyWith(
            color: kcPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
  //This is the text 
  promiseText() {
    return Container(
      margin: EdgeInsets.only(left: 460.w, right: 425.w),
      child: Text(
        AddWorkspace,
        style: newToZuriChatTextstyle.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  //Onclick of this button it opens all the selected workspaces by the user
  //and displays them on the left side of the organizationView
  Container openButtonWidget(ChooseWorkspaceViewmodel model) {
    return Container(
      height: 36.h,
      width: 676.w,
      margin: EdgeInsets.only(left: 382.w, right: 382.w, top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${model.counter == 0 ? 'None' : model.counter} $SelectText',
            style: newToZuriChatTextstyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            child: ElevatedButton.icon(
              onPressed: () {
                model.saveSelectedOrg();
                model.goToOrganizationView();
              },
              label: SvgPicture.asset(LeftArrow),
              icon: Text(OpenText),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kcPrimaryColor)),
            ),
          )
        ],
      ),
    );
  }
  //Tis the Large Choose Workspace text that appears in the UI
  Container largeWorkspaceText() {
    return Container(
      margin: EdgeInsets.only(left: 465.w, right: 430.w, top: 10.h),
      child: Text(
        ChooseWorkspace,
        style: ZuriTextstyle.copyWith(
          color: headerColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

//This appears at the very top of the UI, it contains the Zuri Logo and the Zuri text
//This UI contains the newToZuriText which helps the user create an account with zuri Onclick of the text
class ZuriLogoAndText extends StatelessWidget {
  const ZuriLogoAndText(this.model, {Key? key}) : super(key: key);

  final ChooseWorkspaceViewmodel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: 1024.w,
      margin: EdgeInsets.only(top: 50.h, left: 559.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Zuri,
            height: 51.14.h,
            width: 50.12.w,
          ),
          Text(
            ZuriText,
            style: ZuriTextstyle,
          ),
          SizedBox(
            width: 380.w,
          ),
          newToZuriText(),
        ],
      ),
    );
  }
//newToZuriText which helps the user create an account with zuri Onclick of the text
  Container newToZuriText() {
    return Container(
      height: 72.h,
      width: 110.w,
      margin: EdgeInsets.only(right: 36.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(top: 38.h),
              child: Text(
                ZuriChat,
                style: newToZuriChatTextstyle,
              )),
          InkWell(
            onTap: model.goToCreateAccount,
            child: Container(
                child: Text(
              CreateAccount,
              style: newToZuriChatTextstyle.copyWith(
                  color: kcPrimaryColor, fontWeight: FontWeight.w700),
            )),
          ),
        ],
      ),
    );
  }
}

//BottomTexts contains all the Privacy text, change region & contact us text.

class BottomTexts extends StatelessWidget {
  const BottomTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 420.w, right: 408.w, bottom: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            PrivacyText,
            style: subtitlec2.copyWith(color: leftNavBarColor),
          ),
          SizedBox(width: 23.w),
          Text(
            ContactUs,
            style: subtitlec2.copyWith(color: leftNavBarColor),
          ),
          Container(
            margin: EdgeInsets.only(left: 23.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Web),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  ChangeRegion,
                  style: subtitlec2.copyWith(color: leftNavBarColor),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                    onTap: () => showDialog(
                        context: context, builder: (_) => ChangeRegionView()),
                    child: SvgPicture.asset(ArrowDown)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//This is the center of the UI and allows the user select the workspaces he/she is registered with
//Then onClick of the open button the user is then navigated appropriately to the organizationView
class WorkspaceBox extends StatelessWidget {
  const WorkspaceBox(
    this.model, {
    this.listTileItemCount,
    this.workspaceOwner,
    Key? key,
  }) : super(key: key);

  final ChooseWorkspaceViewmodel model;
  final int? listTileItemCount;
  final String? workspaceOwner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 676.w,
      margin: EdgeInsets.only(left: 382.w, right: 382.w, top: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 0.5.h, color: boxBorderColor),
      ),
      child: Column(
        children: [
          Container(
              height: 50.h,
              width: 676.w,
              padding: EdgeInsets.only(top: 16.h, left: 24.w, bottom: 16.h),
              child: Wrap(
                children: [
                  Text(
                    WorkspaceText,
                    style: newToZuriChatTextstyle,
                  ),
                  Text(
                    ' $workspaceOwner',
                    style: newToZuriChatTextstyle.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              )),
          Divider(
            height: 0.5,
          ),
          Container(
            height: 230.h,
            width: 676.w,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final boolValue = model.isChecked![index];
                  return CheckboxListTile(
                    value: boolValue,
                    onChanged: (boolValue) {
                      model.onChange(boolValue!, index);
                    },
                    activeColor: kcPrimaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Container(
                      height: 60.h,
                      width: 676.w,
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Row(children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ZuriI4gLogo),
                                
                                //NetworkImage(model.orgList[index].logoUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.orgList[index].name,
                              style: createChannelTextStyle.copyWith(
                                color: headerColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                imageContainer(),
                                imageContainer(),
                                imageContainer(),
                                imageContainer(),
                                imageContainer(),
                                imageContainer(),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '3, 496 $MemberText',
                                  style: kExtraSmallTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: leftNavBarColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Divider(height: 0.5.w),
                  );
                },
                itemCount: model.orgLength),
          )
        ],
      ),
    );
  }


//This is the image which is usually the Logo of the Organizations User is Logged in to
  Container imageContainer() {
    return Container(
      height: 16.h,
      width: 16.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          image:
              DecorationImage(image: AssetImage(WksImage), fit: BoxFit.cover)),
    );
  }
}
