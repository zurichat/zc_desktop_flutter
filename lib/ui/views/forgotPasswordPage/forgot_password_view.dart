import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/forgotPasswordPage/forgot_password_viewmodel.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //logo
                      Image.asset(model.logoUrl),

                      //Display text
                      Text(
                        model.signInText,
                        style: mainTextStyle(),
                      ),
                      Text(
                        model.signInSubtext,
                        style: subTextStyle(),
                      ),

                      //Email Label and text field
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.emailText,
                            style: subTextStyle(),),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 440,
                              height: 58,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: model.emailHint,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Continue button
                      Container(
                        margin: EdgeInsets.only(top: 24, bottom: 48),
                        alignment: Alignment.center,
                        width: 440,
                        height: 58,
                        child: Text(
                          model.btnText,
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xff1A61DB),
                      ),

                      //OR text and lines
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 187,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            model.orText,
                            style: orTextStyle(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 187,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                      // Reset password button
                      Container(
                        margin: EdgeInsets.only(top: 48),
                        alignment: Alignment.center,
                        width: 440,
                        height: 58,
                        child: Text(
                          model.resetBtnText,
                          style: TextStyle(color: Color(0xff1A61DB)),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                      ),

                      // End texts
                      Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              model.privacy,
                              style: endTextStyle(),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              model.contactUs,
                              style: endTextStyle(),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              model.changeRegion,
                              style: endTextStyle(),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black12,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

TextStyle mainTextStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold);
}

TextStyle subTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 18);
}

TextStyle orTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 25);
}

TextStyle endTextStyle() {
  return TextStyle(color: Colors.black12, fontSize: 18);
}
