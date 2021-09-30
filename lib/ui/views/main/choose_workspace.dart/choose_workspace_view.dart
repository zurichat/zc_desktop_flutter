import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';

import 'choose_workspace_viewmodel.dart';

class ChooseWorkspaceView extends StatelessWidget {
  const ChooseWorkspaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseWorkspaceViewmodel>.reactive(
      viewModelBuilder: () => ChooseWorkspaceViewmodel(),
      builder: (context, model, _) => Scaffold(
        body: Container(
          height: 1024.h,
          width: 1440.w,
          color: whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ZuriLogoAndText(model),
              largeWorkspaceText(),
              promiseText(),
              openButtonWidget(),
              WorkspaceBox(
                model,
                height: 182.h,
                innerContainerHeight: 130.h,
                listTileItemCount: 2,
                workspaceOwner: EmailHintText,
                //TODO delete the parameters passed below
                imageAsset: zuriI4gLogo,
                workspaceName: hngText,
              ),
              SizedBox(
                height: 10.h,
              ),
              WorkspaceBox(
                model,
                height: 122.h,
                innerContainerHeight: 70.h,
                listTileItemCount: 1,
                workspaceOwner: EmailHintText2,
                //TODO delete the parameters passed below
                imageAsset: hotels_ng,
                workspaceName: hotelsNg,
              ),
              InkWell(
                onTap: model.goToCreateWorkSpace,
                child: Container(
                  margin: EdgeInsets.only(
                      left: 530.w, right: 530.w, top: 17.h, bottom: 20.h),
                  child: Text(
                    signIntoNewWorkspace,
                    style: newToZuriChatTextstyle.copyWith(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              BottomTexts()
            ],
          ),
        ),
      ),
    );
  }

  promiseText() {
    return Container(
      margin: EdgeInsets.only(left: 460.w, right: 425.w),
      child: Text(
        addWorkspace,
        style: newToZuriChatTextstyle.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Container openButtonWidget() {
    return Container(
      height: 36.h,
      width: 676.w,
      margin: EdgeInsets.only(left: 382.w, right: 382.w, top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectText,
            style: newToZuriChatTextstyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: SvgPicture.asset(leftArrow),
              icon: Text(openText),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kcPrimaryColor)),
            ),
          )
        ],
      ),
    );
  }

  Container largeWorkspaceText() {
    return Container(
      margin: EdgeInsets.only(left: 465.w, right: 430.w, top: 10.h),
      child: Text(
        chooseWorkspace,
        style: ZuriTextstyle.copyWith(
          color: headerColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

 


 
}
class ZuriLogoAndText extends StatelessWidget {
  const ZuriLogoAndText(this.model,{ Key? key }) : super(key: key);

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
            zuri,
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
                zuriChat,
                style: newToZuriChatTextstyle,
              )),
          InkWell(
            onTap: model.goToCreateAccount,
            child: Container(
                child: Text(
              createAccount,
              style: newToZuriChatTextstyle.copyWith(
                  color: kcPrimaryColor, fontWeight: FontWeight.w700),
            )),
          ),
        ],
      ),
    );
  }
}

class BottomTexts extends StatelessWidget {
  const BottomTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 420.w, right: 408.w, bottom: 10.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            privacyText,
            style: subtitlec2.copyWith(color: leftNavBarColor),
          ),
          SizedBox(width: 23.w),
          Text(
            contactUs,
            style: subtitlec2.copyWith(color: leftNavBarColor),
          ),
          Container(
            margin: EdgeInsets.only(left: 23.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(web),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  changeRegion,
                  style: subtitlec2.copyWith(color: leftNavBarColor),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SvgPicture.asset(arrowDown),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WorkspaceBox extends StatelessWidget {
  const WorkspaceBox(
    this.model, {
    this.height,
    this.innerContainerHeight,
    this.listTileItemCount,
    this.workspaceOwner,
    this.imageAsset,
    this.workspaceName,
    Key? key,
  }) : super(key: key);

  final ChooseWorkspaceViewmodel model;
  final double? height;
  final double? innerContainerHeight;
  final int? listTileItemCount;
  final String? workspaceOwner;
  final String? imageAsset;
  final String? workspaceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
                    workspaceText,
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
            height: innerContainerHeight,
            width: 676.w,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
                    leading: Container(
                      height: 60.h,
                      width: 100.w,
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 0.5,
                            child: Checkbox(
                                value: model.value, onChanged: model.onChange),
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imageAsset!),
                                  fit: BoxFit.cover),
                            ),
                          )
                        ],
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workspaceName!,
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
                              '3, 194 $memberText',
                              style: kExtraSmallTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: leftNavBarColor),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Divider(height: 0.5.w),
                  );
                },
                itemCount: listTileItemCount!),
          )
        ],
      ),
    );
  }

  Container imageContainer() {
    return Container(
      height: 16.h,
      width: 16.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          image:
              DecorationImage(image: AssetImage(wksImage), fit: BoxFit.cover)),
    );
  }
}
