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

class ProfileEditView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // final GlobalKey<FormFieldState> _fullNameFormKey =
  //     GlobalKey<FormFieldState>();
  // bool _isFormValid() {
  //   return (_fullNameFormKey.currentState!.isValid);
  // }

  ProfileEditView({
    Key? key,
  }) : super(key: key);

  final scrollcontroller = ScrollController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _whoController = TextEditingController();
  final TextEditingController _pronounController = TextEditingController();
  final TextEditingController _phoneNameController = TextEditingController();

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
                      "Edit Profile",
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
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      verticalSpaceRegular,
                                      ProfileInputField(
                                        key: model.isFormValid,
                                        controller: _fullNameController,
                                        label: 'Full Name',
                                        onChanged: model.onChanged,
                                        errorText:
                                            "Unfortunately, you can’t leave this blank.",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'Full Name',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[a-z A-Z] +$')
                                                  .hasMatch(value)) {
                                            return 'Enter currect name format';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      verticalSpaceRegular,
                                      ProfileInputField(
                                        controller: _displayNameController,
                                        label: 'Display Name',
                                        onChanged: (value) {},
                                        helperText:
                                            "This could be your first name, or a nickname, however you’d like people to refer to you in Slack.",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'Display Name',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[a-z A-Z 1-0] +$')
                                                  .hasMatch(value)) {
                                            return 'Enter currect displayname';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      verticalSpaceMedium,
                                      Text(
                                        "Custom rules for this workspace:",
                                        style: subtitle3bb,
                                      ),
                                      verticalSpaceRegular,
                                      Text(
                                        "Please use as ingle firstname or a permanent nickname. If someone uses your name, please change it",
                                        style: subtitle2,
                                      ),
                                      verticalSpaceMedium,
                                      ProfileInputField(
                                        controller: _whoController,
                                        label: 'What I do',
                                        onChanged: (value) {},
                                        helperText:
                                            "Let pepole know what you do at Zuri x I4G.",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'What I do',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[a-z A-Z] +$')
                                                  .hasMatch(value)) {
                                            return 'Enter currect what you do';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      verticalSpaceMedium,
                                      ProfileInputField(
                                        controller: _pronounController,
                                        label: 'Pronouns',
                                        onChanged: (value) {},
                                        helperText:
                                            "Let pepole know which pronoun you are",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintPlaceHolder: 'Ex. they/Them/theirs',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[a-z A-Z] +$')
                                                  .hasMatch(value)) {
                                            return 'Enter currect pronoun format';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      verticalSpaceMedium,
                                      ProfileInputField(
                                        controller: _phoneNameController,
                                        label: 'Phone Number',
                                        onChanged: (value) {},
                                        helperText: "Enter a phone number.",
                                        keyboardType: TextInputType.phone,
                                        inputType: TextInputType.phone,
                                        hintPlaceHolder: '(123) 555-55555',
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1[-\s\.\] +$')
                                                  .hasMatch(value)) {
                                            return 'Enter currect phone number';
                                          } else {
                                            return null;
                                          }
                                        },
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
                                      Text("Profile Photo", style: headline6),
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
                                      verticalSpaceRegularOne,
                                      Container(
                                        width: 200.w,
                                        height: 50.h,
                                        child: OutlineButton(
                                          borderSide: BorderSide(
                                              color: createChannelHeaderColor),
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
                                          onPressed: () {
                                            model.isSubmit;
                                          },
                                          child: Text(
                                            "Remove photo",
                                            style: kSubHeadingTextStyle2,
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
                      // width: 80.w,
                      child: OutlineButton(
                        borderSide: BorderSide(color: createChannelHeaderColor),
                        onPressed: () {},
                        child: Text("Cancel", style: subtitle3),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Container(
                      height: 50.h,
                      // width: 100.w,
                      child: ProfileButton(
                        onTap: () {
                          model.getUserDetail();
                        },
                        label: "Save Changes",
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