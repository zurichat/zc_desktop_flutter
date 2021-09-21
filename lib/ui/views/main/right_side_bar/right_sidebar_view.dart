import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/views/main/home_page/home_viewmodel.dart';

class RightSideBarView extends ViewModelWidget<HomeViewModel> {
  const RightSideBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      height: model.pageHeight,
      width: model.rightSideBarWidth,
      color: Colors.grey,
      child: Center(
        child: Text(model.rightSideText.toString()),
      ),
    );
  }
}
