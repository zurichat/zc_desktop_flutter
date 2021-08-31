import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/authInputTestView/inputTestViewModel.dart';
import 'package:zcdesk_ui/src/widgets/auth_input_field.dart';
import 'package:zcdesk_ui/src/shared/ui_helpers.dart';

class AuthInputTestView extends StatelessWidget {
  const AuthInputTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<InputTestViewModel>.reactive(
        viewModelBuilder: () => InputTestViewModel(),
        builder: (context, model, child){
          return  Scaffold(
            body: Center(
              child: Container(
                height: size.height/2,
                width: size.width/3.5,
                child: Column(
                  children: [
                    AuthInputField(
                      label: 'Email',
                      controller: model.emailController,
                      hintText: 'Markhng@gmail.com',
                      onSaved: (val) => model.onSaved(val),
                    ),

                    verticalSpaceMedium,

                    AuthInputField(
                      label: 'Password',
                      hintText: 'Password',
                      controller: model.passWordController,
                      onSaved: (val) => model.onSaved(val),
                      suffix: TextButton(
                        child: Icon(Icons.visibility_off_outlined,size: 14,),
                        onPressed: () {

                        },
                      ),
                      ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
