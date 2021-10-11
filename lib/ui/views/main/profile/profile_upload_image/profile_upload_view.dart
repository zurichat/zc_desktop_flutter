import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/views/main/profile/profile_upload_image/profile_upload_viewmodel.dart';

// ignore: must_be_immutable
class ProfileUploadView extends StatelessWidget {
  ProfileUploadView({
    Key? key,
  }) : super(key: key);

  final scrollcontroller = ScrollController();
  // final controller = CropController(aspectRatio: 1000 / 667.0);
  // double _rotation = 0;
  // BoxShape shape = BoxShape.rectangle;

  late File imagefile;

  // Future chooceFileToUpload() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform
  //         .pickFiles(allowMultiple: false, type: FileType.image);

  //     if (result != null) {
  //       // _cropImage(result);
  //       File file = File(result.files.single.path!);
  //       imagefile = File(path);
  //     } else {
  //       // User canceled the picker
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
                    'Crop your picture',
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
                      'Cancel',
                      style: authBtnStyle,
                    ),
                  ),
                  horizontalSpaceSmall,
                  AuthButton(label: 'Save')
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
