import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/widget/app_bar.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: buildAppBar(context, true),
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
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
