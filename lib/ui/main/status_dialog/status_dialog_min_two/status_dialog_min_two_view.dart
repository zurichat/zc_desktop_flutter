import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/main/status_dialog/status_dialog_min_two/status_dialog_min_two_viewmodel.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';

class StatusDialogMinTwoView extends StatelessWidget {
  const StatusDialogMinTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatusDialogMinTwoViewModel>.reactive(
        viewModelBuilder: () => StatusDialogMinTwoViewModel(),
        builder: (context, model, child) => Dialog(
              child: dialogContainer(model),
            ));
  }

  dialogContainer(StatusDialogMinTwoViewModel model) {
    return Container(
      width: 547.h,
      height: 268.w,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZcdeskText.headingThree(model.setAStatus),
                IconButton(onPressed: model.popDialog, icon: Icon(Icons.close))
              ],
            ),
            Container(
              height: 61.h,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  hintText: model.hintText,
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/emoji_icon.svg')),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                ),
              ),
            ),
            verticalSpaceSmall,
            Row(
              children: [
                ZcdeskText.dropDownBodyTextStyle(model.clearAfter),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down))
              ],
            ),
            verticalSpaceRegular,
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          //child: Padding(
            //padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(117.w, 48.h),
                        textStyle: clearStatusTextStyle,
                        padding: EdgeInsets.symmetric( horizontal: 16.w),
                        primary: Colors.white,
                        onPrimary: bodyColor,
                        side: BorderSide(
                            color: clearStatusBtnBorderColor,
                            width: 1.0.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Text(model.cancelBtnText)),
                horizontalSpaceMedium,
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(117.w, 48.h),
                        textStyle: clearStatusTextStyle,
                        padding: EdgeInsets.symmetric( horizontal: 16.w),
                        primary: kcPrimaryColor,
                        onPrimary: Colors.white,
                        side: BorderSide(
                            color: clearStatusBtnBorderColor,
                            width: 1.0.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Text(model.saveBtnText)),
              ],
            ),
          //),
        ),
      ]),
    );
  }
}
