import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/profile/profile_upload_image/profile_upload_viewmodel.dart';

class ProfileUploadView extends StatelessWidget {
  ProfileUploadView(
    File file, {
    Key? key,
  }) : super(key: key);

  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileUploadViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          height: 800.h,
          width: 500.w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Crop your picture",
                    style: kHeading2TextStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      model.closeDialog();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Scrollbar(
                controller: scrollcontroller,
                isAlwaysShown: true,
                thickness: 10,
                showTrackOnHover: true,
                child: SingleChildScrollView(
                  controller: scrollcontroller,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 600,
                                  width: 450,
                                  color: kcPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: authBtnStyle,
                    ),
                  ),
                  horizontalSpaceSmall,
                  AuthButton(label: "Save")
                ],
              ),
            ),
          ]),
        ),
      ),
      viewModelBuilder: () => ProfileUploadViewModel(),
    );
  }
}
