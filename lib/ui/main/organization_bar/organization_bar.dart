import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/home_page/home_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class OrganizationBarView extends ViewModelWidget<HomeViewModel> {
  const OrganizationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    final _colors = Colors.primaries;
    return Container(
      color: kcBackgroundColor2,
      width: model.organizationBarWidth,
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildOrganizationLogo(_colors[index], index.toString()),
            );
          }),
    );
  }
}

Widget _buildOrganizationLogo(Color? color, String? text) {
  return GestureDetector(
    child: Container(
      height: 60.h,
      width: 60.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(text.toString()),
      ),
    ),
  );
}
