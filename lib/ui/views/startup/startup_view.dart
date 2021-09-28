import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
