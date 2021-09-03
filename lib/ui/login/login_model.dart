import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/login/login_viewmodel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginModel extends StatelessWidget {
  const LoginModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLoginBtn(),
        verticalSpaceMedium,
        _buildSignInWithText(),
        _buildSocialBtnRow(),
        _buildSignupBtn(),
        verticalSpaceTiny,
        _buildForgotPasswordBtn(),
      ],
    );
  }
}

Widget _buildForgotPasswordBtn() {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => print('Forgot Password Button Pressed'),
      child: Text(
        'Forgot Password?',
        style: bodyText1.copyWith(fontSize: 15.sp),
      ),
    ),
  );
}

Widget _buildLoginBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kcSecondaryColor,
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            letterSpacing: 1.5,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    ),
  );
}

Widget _buildSignInWithText() {
  return Column(
    children: <Widget>[
      Text(
        'Easy Sign in With',
        style: ktsMediumGreyBodyText,
      ),
    ],
  );
}

Widget _buildSocialBtnRow() {
  return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    model.logoUrlG,
                  ),
                  iconSize: 40,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    model.logoUrlF,
                  ),
                  iconSize: 40,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    model.logoUrlT,
                  ),
                  iconSize: 40,
                  onPressed: () {},
                ),
              ],
            ),
          ),
      viewModelBuilder: () => LoginViewModel());
}

Widget _buildSignupBtn() {
  return GestureDetector(
    onTap: () => print('Sign Up Button Pressed'),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account?',
            style: bodyText1,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyle(
              color: Color(0xff20C18C),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

const Color kcMediumGreyColor = Color(0xff868686);

//TextStyles
const TextStyle ktsMediumGreyBodyText = TextStyle(
  color: kcMediumGreyColor,
  fontSize: kBodyTextSize,
  fontFamily: 'lato',
);

//fontSize
const double kBodyTextSize = 16;

//decoration
final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
