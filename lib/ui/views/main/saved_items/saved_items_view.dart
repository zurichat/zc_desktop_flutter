import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/const_widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/detailed_screen_custom_appbar.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/workspace_title.dart';
import 'package:zc_desktop_flutter/ui/views/main/saved_items/saved_items_viewmodel.dart';

class SavedItemsView extends StatefulWidget {
  const SavedItemsView({Key? key}) : super(key: key);
  @override
  _SavedItemsViewState createState() => _SavedItemsViewState();
}

class _SavedItemsViewState extends State<SavedItemsView> {
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
              FineContainer(),
              verticalSpaceTiny,
            ],
          ),
        );
      },
    );
  }

  Container FineContainer() {
    return Container(
      color: Colors.grey[50],
      width: 1132,
      height: 96,
      margin: EdgeInsets.fromLTRB(24, 26, 12, 32),
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
                onTap: () {},
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
    );
  }
}
