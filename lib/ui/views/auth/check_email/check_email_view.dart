import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/auth_header.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/goto_login_button.dart';
import 'check_email_viewmodel.dart';

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
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        width: 581.w,
                        child: AuthHeader(
                            title: _isResetPassword != null
                                ? _isResetPassword
                                    ? ResetTitle
                                    : ConfirmTitle
                                : ResetTitle,
                            subTitle:
                                'We sent a 6 digit code to $_email. The code expire shortly, so please enter it soon.')),
                    verticalSpaceSmall,
                    Text(
                      model.errorMsg,
                      style: boldCaptionStyle.copyWith(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                    verticalSpaceSmall,
                    Container(
                        width: 798.w,
                        height: 100.h,
                        child: OTPTextField(
                          length: 6,
                          width: 768.w,
                          fieldWidth: 100.w,
                          style: subtitle2,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) => model.performVarification(pin, _isResetPassword!),
                        )),
                    verticalSpaceLarge,
                    GestureDetector(
                      onTap: model.openGmail,
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
                    ),
                    if (_isResetPassword ?? false)
                      SizedBox(
                        height: 32.h,
                      ),
                    if (_isResetPassword ?? false) GotoLoginButton(),
                  ],
                ),
                //AuthFooter()
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
    );
  }
}
