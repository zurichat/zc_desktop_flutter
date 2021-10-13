import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_asset_paths.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_edit/profile_edit_view.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/view_profile/view_profile_viewmodel.dart';

class ViewProfileView extends StatelessWidget {
  const ViewProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewProfileViewModel>.nonReactive(
        viewModelBuilder: () => ViewProfileViewModel(),
        builder: (context, model, _) {
          return Align(
            alignment: Alignment.centerRight,
            child: Material(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 826.h,
                  width: 414.w,
                  child: Column(
                    children: [
                      HeaderWidget(),
                      Container(
                        height: 782.h,
                        width: 399.w,
                        padding: EdgeInsets.only(
                            top: 15.h, bottom: 15.w, right: 19.w, left: 19.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            imageBox(),
                            SizedBox(
                              height: 17.h,
                            ),
                            Text(
                              model.user.displayName == ''
                                  ? 'My Name'
                                  : model.user.displayName,
                              style: viewProfileTextstyle,
                            ),
                            SizedBox(
                              height: 8.67.h,
                            ),
                            Text('Design & more'),
                            SizedBox(
                              height: 6.15.h,
                            ),
                            Text('He/Him'),
                            Container(
                              height: 54.h,
                              width: 217.84.w,
                              margin: EdgeInsets.only(bottom: 23.h, top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CallIconWidget(
                                    assetPath: Call,
                                    text: voiceCall,
                                  ),
                                  CallIconWidget(
                                    assetPath: Video,
                                    text: videoCall,
                                  ),
                                  CallIconWidget(
                                    assetPath: MoreHorizontal,
                                    text: textMore,
                                  ),
                                ],
                              ),
                            ),
                            displayNameWidget(
                              labelText: displayName,
                              text: model.user.displayName == ''
                                  ? 'My Name'
                                  : model.user.displayName,
                            ),
                            displayNameWidget(
                              labelText: displayemail,
                              text: model.user.email == ''
                                  ? 'myName@gmail.com'
                                  : model.user.email,
                            ),
                            displayNameWidget(
                              labelText: phoneNumber,
                              text: model.user.phone == ''
                                  ? '+234 666 123 9991'
                                  : model.user.phone,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (_) => ProfileEditView());
                                  },
                                  icon: SvgPicture.asset(EditProfile),
                                  label: Text(
                                    editProfile,
                                    style: viewProfileTextstyle,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

imageBox (){
    return Container(
      height: 258.h,
      width: 250.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(profileAvatar),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 414.w,
      padding: EdgeInsets.only(left: 16.w, right: 17.5.w, top: 6.h),
      color: kcPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Profile',
              style: viewProfileTextstyle.copyWith(
                  color: whiteColor, fontSize: 18.sp)),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              Cancel,
              height: 17.5.h,
              width: 17.5.w,
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}

class displayNameWidget extends StatelessWidget {
  const displayNameWidget({
    @required this.labelText,
    @required this.text,
    Key? key,
  }) : super(key: key);

  final String? labelText;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 10.28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
            style: voiceCallTextstyle.copyWith(fontSize: 15.sp),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            text!,
            style: viewProfileTextstyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            height: 1.h,
            color: kcDisplayChannelColor,
          )
        ],
      ),
    );
  }
}

// widget that dispalys the call video and more buttons and texts
class CallIconWidget extends StatelessWidget {
  const CallIconWidget({
    @required this.assetPath,
    @required this.text,
    Key? key,
  }) : super(key: key);

  final String? assetPath;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              height: 54.h,
              width: 54.w,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(assetPath!),
              ),
            ),
          ),
          Text(text!, style: voiceCallTextstyle),
        ],
      ),
    );
  }
}
