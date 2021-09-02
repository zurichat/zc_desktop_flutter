import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
<<<<<<< HEAD
        appBar: AppBar(
          title: Text(model.appName),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: model.goToChat,
            child: Text("Get Started"),
          ),
=======
        body: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.lightGreen,
                // TODO: Add welcome card.
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                ),
                // TODO: Add signin and signup form

                child: Center(
                  child: ElevatedButton(
                    onPressed: model.goToHome,
                    child: Text('Get Started'),
                  ),
                ),
              ),
            ),
          ],
>>>>>>> 41d6f533a007467fe1a6dd591d3ab55cb4fe22a7
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
