import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';

import 'all_dms_viewmodel.dart';

class AllDmsView extends StatelessWidget {
  const AllDmsView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllDmsViewModel>.reactive(
        viewModelBuilder: () => AllDmsViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              model.appbarText,
              style: allDmsAppbarStyle,
            ),
          ),
            body: Column(
              children: [
               Container(
                 width: 1172.w,
                 height: 41.h,
                 child: TextField(
                   decoration: InputDecoration(
                     contentPadding: EdgeInsets.fromLTRB(20.w, 12.h, 0, 12.h),
                     hintText: model.searchBarText,
                     hintStyle: allDmsSubtitleStyle
                   ),
                 ),
               ),
                verticalSpaceRegular,
                Container(
                  padding: EdgeInsetsDirectional.only(start: 20.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    model.dayPlaceholder,
                    style: allDmsDayStyle,
                  ),
                ),
                verticalSpaceRegular,
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return index == 0 ? ListTile(
                          leading: GFAvatar(
                            backgroundColor: kcPrimaryColor,
                            foregroundColor: kcPrimaryLight,
                            shape: GFAvatarShape.standard,
                            child: Text(model.imagePlaceholder),
                          ),
                          title: Text(
                            model.titlePlaceholder,
                            style: allDmsTitleStyle,
                          ),
                          subtitle: Text(
                            model.subtitlePlaceholder,
                            style: allDmsSubtitleStyle,
                          ),
                          trailing: Text(
                            model.timePlaceholder,
                            style: allDmsTrailingStyle,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: Color(0xffD0D0D0)),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ):ListTile(
                          leading: GFAvatar(
                            backgroundColor: kcPrimaryColor,
                            foregroundColor: kcPrimaryLight,
                            shape: GFAvatarShape.standard,
                            child: Text("B"),
                          ),
                          title: Text(
                            model.titlePlaceholder,
                            style: allDmsTitleStyle,
                          ),
                          subtitle: Text(
                            model.subtitlePlaceholder,
                            style: allDmsSubtitleStyle,
                          ),
                          trailing: Text(
                            model.timePlaceholder,
                            style: allDmsTrailingStyle,
                          ),
                          shape: ContinuousRectangleBorder(
                            side: BorderSide(width: 1.w, color: Color(0xffD0D0D0)),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}
