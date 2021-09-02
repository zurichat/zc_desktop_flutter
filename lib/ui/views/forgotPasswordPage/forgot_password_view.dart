import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: viewModelBuilder, builder: (context, model, child) => Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/zc_logo2.png'),
          Text(),
          Text(),

        ],
      ),
    ));
  }
}
