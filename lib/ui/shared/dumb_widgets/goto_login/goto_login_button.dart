import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'goto_login_button_model.dart';

class GotoLoginButton extends StatelessWidget {
  const GotoLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GotoLoginButtonModel>.reactive(
      viewModelBuilder: () => GotoLoginButtonModel(),
      builder: (
        BuildContext context,
        GotoLoginButtonModel model,
        Widget? child,
      ) {
        return GestureDetector(
          onTap: model.gotoLogin,
          child: Text(
            model.gotoText,
            style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(0, 184, 124, 1),
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400),
          ),
        );
      },
    );
  }
}
