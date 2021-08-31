import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage(model.logoUrl),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(model.title),
              ),
              Expanded(
                flex: 1,
                child: Text(model.testString),
              ),

              //TODO: Remove after review
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: ()=> model.goToInputView(),
                  child: Text(
                    'input field'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
