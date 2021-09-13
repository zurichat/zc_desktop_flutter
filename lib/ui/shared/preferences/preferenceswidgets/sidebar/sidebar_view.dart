import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/preferences/preferenceswidgets/sidebar/sidebar_viewmodel.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SideBarModel>.reactive(
      builder: (context, model, child) => Container(
        height: 1500.h,
        padding: EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Always show in the side bar',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                  fontSize: 15.sp),
            ),
            SizedBox(height: 14),
            displayCheckBox(
                value: false,
                icon: Icon(Icons.insights_outlined),
                text: 'Insights',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'Threads',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'All DMs',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'Draft',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'Files',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'Integrate',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'To-do',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'File browser',
                style: TextStyle(fontFamily: 'Lato')),
            displayCheckBox(
                value: true,
                icon: Icon(Icons.insights_outlined),
                text: 'Channel browser',
                style: TextStyle(fontFamily: 'Lato')),
            SizedBox(height: 5),
            Divider(
                //thickness: 5,
                ),
          ],
        ),
      ),
      viewModelBuilder: () => SideBarModel(),
    );
  }

  displayCheckBox(
      {required bool value,
      required Icon icon,
      required String text,
      required TextStyle style,
      void Function(bool? value)? onChanged}) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: kcPrimaryColor,
        ),
        icon,
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
