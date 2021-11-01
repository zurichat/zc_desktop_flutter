import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';

import 'all_dms_viewmodel.dart';

class AllDmsView extends StatelessWidget {
  const AllDmsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllDmsViewModel>.reactive(
        viewModelBuilder: () => AllDmsViewModel(),
        onModelReady: (model) {
          model.setup();
        },
        builder: (context, model, child) => model.isBusy
            ? Center(
                child: Container(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0.r,
                    valueColor: AlwaysStoppedAnimation(Colors.grey),
                  ),
                ),
              )
            : Column(
                children: [
                  DetailedCustomAppBar(
                    margin: EdgeInsets.only(left: 2.0.w),
                    leading: WorkSpaceTitle(
                      channelTitle: AllDms,
                    ),
                  ),
                  Container(
                    width: 1172.w,
                    height: 41.h,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.w, 12.h, 0, 12.h),
                          hintText: SearchBarText,
                          hintStyle: allDmsSubtitleStyle),
                    ),
                  ),
                  verticalSpaceRegular,
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 20.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DayPlaceholder,
                      style: allDmsDayStyle,
                    ),
                  ),
                  verticalSpaceRegular,
                  Expanded(
                    child: ListView.builder(
                        itemCount: model.dms.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            key: UniqueKey(),
                            onTap: () {
                              model.goToDmView(index);
                            },
                            leading: GFAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundColor: kcPrimaryLight,
                              shape: GFAvatarShape.standard,
                              backgroundImage: NetworkImage(model.dms
                                  .elementAt(index)
                                  .otherUserProfile
                                  .imageUrl),
                            ),
                            title: Text(
                              model.dms
                                  .elementAt(index)
                                  .otherUserProfile
                                  .displayName,
                              style: allDmsTitleStyle,
                            ),
                            subtitle: Text(
                              model.dms.elementAt(index).otherUserProfile.bio,
                              style: allDmsSubtitleStyle,
                            ),
                            trailing: Text(
                              TimePlaceholder,
                              style: allDmsTrailingStyle,
                            ),
                            /* shape: ContinuousRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: Color(0xffD0D0D0)),
                              borderRadius: BorderRadius.circular(4.r),
                            ), */
                          );
                        }),
                  ),
                ],
              ));
  }
}
