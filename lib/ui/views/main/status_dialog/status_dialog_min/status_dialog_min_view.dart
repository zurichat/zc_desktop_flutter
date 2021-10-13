import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_text.dart';
import 'package:zc_desktop_flutter/ui/views/main/status_dialog/status_dialog_min/status_dialog_min_viewmodel.dart';

class StatusDialogMinView extends StatelessWidget {
  const StatusDialogMinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatusDialogMinViewModel>.reactive(
        viewModelBuilder: () => StatusDialogMinViewModel(),
        builder: (context, model, child) => Dialog(
              child: dialogContainer(context, model),
            ));
  }

  dialogContainer(BuildContext context, StatusDialogMinViewModel model) {
    final statusController = TextEditingController();

    return Container(
      width: 547.w,
      height: 268.h,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZcdeskText.headingThree(model.setAStatus),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: 28.sp,
                  ),
                )
              ],
            ),
            Container(
              height: 61.h,
              child: TextField(
                onChanged: (value) {
                  model.setStatusTag(value);
                },
                controller: statusController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  hintText: model.hintText,
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/emoji_icon.svg')),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.clear,
                        size: 20.sp,
                      )),
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
          child: ElevatedButton(
              onPressed: () {
                model.setStatusTag;
                Navigator.pop(context,);
                // Navigator.pop(context, model.statusTag);
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(117.w, 48.h),
                  textStyle: clearStatusTextStyle,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  primary: Colors.white,
                  onPrimary: bodyColor,
                  side: BorderSide(
                      color: clearStatusBtnBorderColor, width: 1.0.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r))),
              child: Text(model.clearBtnText)),
          //),
        ),
      ]),
    );
  }
}