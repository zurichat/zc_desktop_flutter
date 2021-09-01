import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';

import 'components/signupForm.dart';
import 'components/signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
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
                          top: _size.height * 0.08,
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
                                style: GoogleFonts.lato(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _size.height * 0.04,
                          ),
                          Text(
                            model.subtitle,
                            style: GoogleFonts.lato(
                                fontSize: 35, fontWeight: FontWeight.w600),
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
                          Row(
                            children: [
                              Checkbox(
                                  value: check,
                                  activeColor: Colors.green,
                                  onChanged: (value) {}),
                              Text(
                                model.policy,
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
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
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Text(
                            'Easy Sign Up With',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              wordSpacing: 2,
                              fontWeight: FontWeight.w500,
                            ),
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
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: _size.width * 0.005,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
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
