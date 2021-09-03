import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';
import 'components/signupForm.dart';
import 'components/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  // final String title;
  // final String subtitle;
  // final String mainButton;
  // final Widget form;
  // final bool showTermText;
  // final String validationMessage;
  // final Function onMainButtonClick;
  // final Function onCreateButtonTapp;
  // final Function onForgotPassword;
  // final bool busy;

  const SignUpView({
    Key? key,
    // required this.title,
    // required this.subtitle,
    // required this.mainButton,
    // required this.form,
    // required this.showTermText,
    // required this.validationMessage,
    // required this.onMainButtonClick,
    // required this.onCreateButtonTapp,
    // required this.onForgotPassword,
    // required this.busy
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = false;
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: _size.height * 0.07,
                          left: _size.width * 0.07,
                          right: _size.width * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(model.logoUrl),
                              SizedBox(
                                width: _size.width * 0.005,
                              ),
                              Text(
                                model.title,
                                style: heading4Style,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          Text(
                            model.subtitle,
                            style: heading2Style,
                          ),
                          SizedBox(
                            height: _size.height * 0.04,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _size.width * 0.07, right: _size.width * 0.03),
                      child: Column(
                        children: [
                          SignUpForm(),
                          SizedBox(
                            height: _size.height * 0.01,
                          ),
                          SizedBox(
                            width: _size.width * 0.7,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: check,
                                    activeColor: kcSuccessColor,
                                    onChanged: (value) {}),
                                Text(
                                  model.policy,
                                  style: bodyStyle,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 110, right: 50),
                      child: Column(
                        children: [
                          Container(
                            height: _size.height * 0.06,
                            width: _size.width * 0.9,
                            child: FlatButton(
                              color: Colors.blue[800],
                              onPressed: () {},
                              child: Text(
                                "Register",
                                style: authBtnStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Text(
                            'Easy Sign Up With',
                            style: smallStyle,
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buttonGoog(),
                              SizedBox(
                                width: _size.width * 0.03,
                              ),
                              _buttonFace(),
                              SizedBox(
                                width: _size.width * 0.03,
                              ),
                              _buttonTwit(),
                            ],
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: captionStyle,
                              ),
                              SizedBox(
                                width: _size.width * 0.005,
                              ),
                              GestureDetector(
                                onTap: model.goToLogin,
                                child: Text(
                                  "Sign Up",
                                  style: captionStyle1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}

Widget _buttonGoog() {
  return GestureDetector(
    onTap: () {},
    child: SvgPicture.asset(
      "assets/images/google.svg",
      // height: 20,
      // width: 20,
    ),
  );
}

Widget _buttonFace() {
  return GestureDetector(
    onTap: () {},
    child: SvgPicture.asset(
      "assets/images/facebook.svg",
    ),
  );
}

Widget _buttonTwit() {
  return GestureDetector(
    onTap: () {},
    child: SvgPicture.asset(
      "assets/images/twitter.svg",
    ),
  );
}
