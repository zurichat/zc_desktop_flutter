import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/login/login_model.dart';
import 'package:zc_desktop_flutter/ui/login/login_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/ui_helpers.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(color: Colors.green),
                ),
              ),
              // alignment: Alignment.topRight,
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  // alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(75, 40, 40, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Image(
                            image: AssetImage(model.logoUrl),
                          ),
                        ),
                        verticalSpaceRegular,
                        Text(
                          model.title,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        verticalSpaceMedium,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              model.email,
                              style: ktsMediumGreyBodyText.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'lato'),
                            ),
                            verticalSpaceRegular,
                            Container(
                              child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: model.emailhint)),
                            ),
                          ],
                        ),
                        verticalSpaceRegular,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              model.password,
                              style: ktsMediumGreyBodyText.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            verticalSpaceRegular,
                            Container(
                              child: TextField(
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    border: OutlineInputBorder(),
                                    hintText: model.hint,
                                  )),
                            ),
                            verticalSpaceRegular,
                            LoginModel()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
