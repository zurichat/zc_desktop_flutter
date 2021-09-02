import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/widgets/center_list_tile/center_tile.dart';
import 'package:zc_desktop_flutter/ui/appbar/app_bar.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: buildAppBar(context, true)),
            Expanded(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: centertitlecard(context))),
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
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
