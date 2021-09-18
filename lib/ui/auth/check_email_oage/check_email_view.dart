import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/auth/check_email_oage/check_email_view_model.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/app_bar/app_bar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_footer.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_header.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _args = ModalRoute.of(context)?.settings.arguments as Map;
    final textStyle = TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Lato',
        color: Color.fromRGBO(51, 51, 51, 1));
    String? _email = _args['email'];
    bool? _isResetPassword = _args['isReset'];

    return ViewModelBuilder<CheckEmailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        height: 40,
                        child: buildAppBar(context,
                            isSignIn: true, text: 'Forget Password | Zuri')),
                    Container(
                        width: 481.w,
                        child: AuthHeader(
                            title: model.title,
                            subTitle:
                                'We sent a 6 digit code to $_email. The code expire shortly, so please enter it soon.')),
                    verticalSpaceLarge,
                    Container(
                        width: 768.w,
                        height: 130.h,
                        child: buildOtp(model, _isResetPassword ?? false)),
                    SizedBox(
                      height: 91.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/gmail.svg'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Open Gmail',
                            style: textStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    Text(
                      'Can’t find your code?  Check your spam folder.',
                      style: textStyle,
                    )
                  ],
                ),
                AuthFooter()
              ],
            ),
            if (model.isBusy)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
          ],
        ),
      ),
      viewModelBuilder: () => CheckEmailViewModel(),
      onDispose: (model) {
        model.dispose();
      },
    );
  }

  buildInputTextFieldBox(
      {FocusNode? focus, required void Function(String?) onChanged}) {
    final inputDecoration = InputDecoration(
      filled: true,
      counterText: '',
      fillColor: Colors.white,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 45.w),
      border: OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
    );
    return Container(
      width: 118.w,
      height: 129.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(193, 193, 193, 1))),
      child: TextField(
          decoration: inputDecoration,
          maxLength: 1,
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              color: Colors.black),
          focusNode: focus,
          keyboardType: TextInputType.number,
          onChanged: onChanged),
    );
  }

  buildOtp(CheckEmailViewModel model, bool isReset) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildInputTextFieldBox(
            focus: model.focusNode0,
            onChanged: (value) {
              model.setOtp0(
                value,
              );
            }),
        buildInputTextFieldBox(
            focus: model.focusNode1,
            onChanged: (value) {
              model.setOtp1(
                value,
              );
            }),
        buildInputTextFieldBox(
            focus: model.focusNode2,
            onChanged: (value) {
              model.setOtp2(
                value,
              );
            }),
        SizedBox(width: 15),
        Container(
          height: 1.h,
          width: 19.w,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        SizedBox(width: 15),
        buildInputTextFieldBox(
            focus: model.focusNode3,
            onChanged: (value) {
              model.setOtp3(
                value,
              );
            }),
        buildInputTextFieldBox(
            focus: model.focusNode4,
            onChanged: (value) {
              model.setOtp4(
                value,
              );
            }),
        buildInputTextFieldBox(
            focus: model.focusNode5,
            onChanged: (value) {
              model.setOtp5(value, isReset);
            }),
      ],
    );
  }
}
