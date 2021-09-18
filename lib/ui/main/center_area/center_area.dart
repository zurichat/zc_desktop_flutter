import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/home_page/home_viewmodel.dart';

class CenterArea extends ViewModelWidget<HomeViewModel> {
  const CenterArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      height: double.infinity,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            model.showRightSide(model.sideBarItemName.toString());
          },
          child: Text(model.sideBarItemName.toString()),
        ),
      ),
    );
  }
}
