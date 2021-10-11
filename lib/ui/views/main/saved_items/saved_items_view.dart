import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import 'package:zc_desktop_flutter/ui/views/main/saved_items/saved_items_viewmodel.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedItemsViewModel>.reactive(
      viewModelBuilder: () => SavedItemsViewModel(),
      builder: (
        BuildContext context,
        SavedItemsViewModel model,
        Widget? child,
      ) {
        return Container(
          child: Column(
            children: [
              DetailedCustomAppBar(
                margin: EdgeInsets.only(left: 2.0.w),
                leading: WorkSpaceTitle(
                  channelTitle: SavedItems,
                ),
              ),
              dismissableCard(model),
              verticalSpaceTiny,
              SavedItemsCards(),
            ],
          ),
        );
      },
    );
  }

  Visibility dismissableCard(SavedItemsViewModel model) {
    return Visibility(
        visible: model.isVisible,
        child: Container(
          color: Colors.grey[50],
          width: 1132.w,
          height: 130.h,
          margin: EdgeInsets.fromLTRB(24, 26, 12, 5),
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Column(
            children: [
              horizontalSpaceTiny,
              Row(
                children: [
                  SvgPicture.asset(
                    SVGAssetPaths.ribbon,
                    width: 17.w,
                    height: 17.h,
                  ),
                  horizontalSpaceSmall,
                  Text('Add messages and files to come back to later',
                      style: headline3.copyWith(fontSize: 17)),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      model.dismissCard();
                    },
                    child: Icon(
                      Icons.close,
                      size: 20,
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
              Text(
                'Mark your to-dos or save something for another time. Only you can see your saved items, So use them however you’d like.',
                style: subtitle2,
              )
            ],
          ),
        ));
  }

  Expanded SavedItemsCards() {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0
                ? Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: Card(
                      child: ListTile(
                        leading: GFAvatar(
                          backgroundColor: kcPrimaryColor,
                          foregroundColor: kcPrimaryLight,
                          shape: GFAvatarShape.standard,
                          child: Text(ImagePlaceholder),
                        ),
                        title: Text(
                          TitlePlaceholder,
                          style: allDmsTitleStyle,
                        ),
                        subtitle: Text(
                          SubtitlePlaceholder,
                          style: allDmsSubtitleStyle,
                        ),
                        trailing: Text(
                          TimePlaceholder,
                          style: allDmsTrailingStyle,
                        ),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xffD0D0D0)),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    child: Card(
                      child: ListTile(
                        leading: GFAvatar(
                          backgroundColor: kcPrimaryColor,
                          foregroundColor: kcPrimaryLight,
                          shape: GFAvatarShape.standard,
                          child: Text(ImagePlaceholder),
                        ),
                        title: Text(
                          TitlePlaceholder,
                          style: allDmsTitleStyle,
                        ),
                        subtitle: Text(
                          SubtitlePlaceholder,
                          style: allDmsSubtitleStyle,
                        ),
                        trailing: Text(
                          TimePlaceholder,
                          style: allDmsTrailingStyle,
                        ),
                        shape: ContinuousRectangleBorder(
                          side:
                              BorderSide(width: 1.w, color: Color(0xffD0D0D0)),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
