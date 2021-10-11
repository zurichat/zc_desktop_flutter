import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/profile_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'profile_edit_viewmodel.dart';

// ignore: must_be_immutable
class ProfileEditView extends StatelessWidget {
  ProfileEditView({
    Key? key,
  }) : super(key: key);

  final scrollcontroller = ScrollController();
  File? imagefile;

  Future chooceFileToUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.image);

      if (result != null) {
        // ignore: unused_local_variable
        File file = File(result.files.single.path!);
      } else {
        // User canceled the picker
      }
    } catch (e) {
    }
  }

  Future cropUploadedFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.image);

      if (result != null) {
        // ignore: unused_local_variable
        File file = File(result.files.single.path!);
      } else {
        // User canceled the picker
      }
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileEditViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 850.h,
          width: 750.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit Profile',
                      style: kHeading2TextStyle,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      verticalSpaceRegular,
                                      ProfileInputField(
                                        label: 'Full Name',
                                        onChanged: (value) {},
                                        errorText:
                                            'Unfortunately, you can’t leave this blank.',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'Full Name',
                                      ),
                                      verticalSpaceRegular,
                                      ProfileInputField(
                                        label: 'Display Name',
                                        onChanged: (value) {},
                                        helperText:
                                            'This could be your first name, or a nickname, however you’d like people to refer to you in Slack.',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'Display Name',
                                      ),
                                      verticalSpaceMedium,
                                      Text(
                                        'Custom rules for this workspace:',
                                        style: subtitle3b,
                                      ),
                                      verticalSpaceRegular,
                                      Text(
                                        'Please use as ingle firstname or a permanent nickname. If someone uses your name, please change it',
                                        style: subtitle3,
                                      ),
                                      verticalSpaceMedium,
                                      ProfileInputField(
                                        label: 'What I do',
                                        onChanged: (value) {},
                                        helperText:
                                            'Let pepole know what you do at Zuri x I4G.',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'What I do',
                                      ),
                                      verticalSpaceMedium,
                                      ProfileInputField(
                                        label: 'Pronouns',
                                        onChanged: (value) {},
                                        helperText:
                                            'Let pepole know which pronoun you are',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'Ex. they/Them/theirs',
                                      ),
                                      verticalSpaceMedium,
                                      ProfileInputField(
                                        label: 'Phone Number',
                                        onChanged: (value) {},
                                        helperText: 'Enter a phone number.',
                                        keyboardType: TextInputType.phone,
                                        inputType: TextInputType.phone,
                                        hintPlaceHolder: '(123) 555-55555',
                                      ),
                                      verticalSpaceMedium,
                                      InkWell(
                                        onTap: () {},
                                        child: ProfileInputField(
                                          label: 'Time Zone',
                                          onChanged: (value) {},
                                          helperText:
                                              'Your current time zone. Used to send summary and notification emails, for times in your activity feeds, and for reminders.',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          hintPlaceHolder:
                                              'Please Select an option',
                                        ),
                                      ),
                                      verticalSpaceRegular,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 10.0,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Profile Photo',
                                        style: headline8,
                                      ),
                                      verticalSpaceRegular,
                                      model.choosenImage != null
                                          ? Container(
                                              // color: kcCreateChannelColor,
                                              height: 300.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  image: DecorationImage(
                                                    image: FileImage(
                                                        model.choosenImage!),
                                                  )),
                                            )
                                          : Container(
                                              height: 300.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Image.asset(
                                                  'assets/images/profile_placeholder.png'),
                                            ),
                                      verticalSpaceRegular,
                                      Container(
                                        width: 200.w,
                                        height: 50.h,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(side: BorderSide(
                                              color: createChannelHeaderColor)),
                                          onPressed: () {
                                            model.chooceFileToUpload(context);
                                          },
                                          child: Text(
                                            'Upload an image',
                                            style: subtitle3,
                                          ),
                                        ),
                                      ),
                                      verticalSpaceRegular,
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Remove photo',
                                            style: kSubHeadingTextStyle1,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 8,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50.h,
                      width: 80.w,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide(color: createChannelHeaderColor)),
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: subtitle3,
                        ),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Container(
                      height: 50.h,
                      // width: 100.w,
                      child: AuthButton(
                        label: 'Save Changes',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ProfileEditViewModel(),
    );
  }
}
