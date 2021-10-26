import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import './threads_viewmodel.dart';

class ThreadsView extends StatelessWidget {
  const ThreadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadsViewModel>.reactive(
        viewModelBuilder: () => ThreadsViewModel(),
        builder: (
          BuildContext context,
          ThreadsViewModel model,
          Widget? child,
        ) =>
            model.isBusy
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
                : Container(
                    color: kcBackgroundColor2,
                    child: Column(
                      children: [
                        DetailedCustomAppBar(
                          margin: EdgeInsets.only(left: 2.0.w),
                          leading: WorkSpaceTitle(
                            channelTitle: threads,
                          ),
                        ),
                        verticalSpaceTiny,
                        Expanded(
                            child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) => Card(
                                      child: ListTile(
                                        leading:
                                            Image.asset('assets/images/7.png'),
                                        trailing: Text(
                                          TimePlaceholder,
                                          style: allDmsTrailingStyle,
                                        ),
                                        title: Text(
                                          TitlePlaceholder,
                                          style: allDmsTitleStyle,
                                        ),
                                        subtitle: Text(
                                          SubtitlePlaceholder,
                                          style: allDmsSubtitleStyle,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.w,
                                              color: Color(0xffD0D0D0)),
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                      ),
                                    )))
                      ],
                    )));
  }
}
