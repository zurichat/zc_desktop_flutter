import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/profile_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'profile_edit_viewmodel.dart';

// ignore: must_be_immutable
class ProfileEditView extends StatelessWidget {
  final _fullNameFormKey = GlobalKey<FormFieldState>();

  ProfileEditView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollcontroller = ScrollController();
    var data = UpdateUserParam(
        firstName: '',
        lastName: '',
        displayName: '',
        who: '',
        pronoun: '',
        phoneNumber: '',
        timeZone: '');
    final _fullNameController = TextEditingController();
    final _displayNameController = TextEditingController();
    final _whoController = TextEditingController();
    final _pronounController = TextEditingController();
    final _phoneNameController = TextEditingController();
    final _timeZoneController = TextEditingController();

    return ViewModelBuilder<ProfileEditViewModel>.reactive(
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 800.h,
          width: 700.w,
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
                      style: kHeading4TextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close),
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
                                  child: Form(
                                    key: _fullNameFormKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        verticalSpaceRegular,
                                        ProfileInputField(
                                          controller: _fullNameController,
                                          label: 'Full Name',
                                          hintPlaceHolder: 'Full Name',
                                          errorText:
                                              "Unfortunately, you can’t leave this blank.",
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            value;
                                            // String fullName =
                                            //     _fullNameController.text;
                                            // var names = fullName.split('');

                                            // data.firstName = value!;
                                            // data.lastName = value;
                                          },
                                          onChanged: (value) {
                                            // model.onValidate();
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r'^[a-z A-Z] +$')
                                                    .hasMatch(value)) {
                                              return 'Enter correct name format';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        verticalSpaceRegular,
                                        ProfileInputField(
                                          controller: _displayNameController,
                                          label: 'Display Name',
                                          helperText:
                                              "This could be your first name, or a nickname, however you’d like people to refer to you in Slack.",
                                          hintPlaceHolder: 'Display Name',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            data.displayName = value;
                                          },
                                          onChanged: (value) {},
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
                                          style: subtitle3b,
                                        ),
                                        verticalSpaceMedium,
                                        ProfileInputField(
                                          controller: _whoController,
                                          label: 'What I do',
                                          hintPlaceHolder: 'What I do',
                                          helperText:
                                              "Let pepole know what you do at Zuri x I4G.",
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            data.who = value;
                                          },
                                          onChanged: (value) {},
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
                                          hintPlaceHolder:
                                              'Ex. they/Them/theirs',
                                          helperText:
                                              "Let pepole know which pronoun you are",
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            data.pronoun = value;
                                          },
                                          onChanged: (value) {},
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
                                          hintPlaceHolder: '(123) 555-55555',
                                          helperText: "Enter a phone number.",
                                          keyboardType: TextInputType.phone,
                                          inputType: TextInputType.phone,
                                          onSaved: (value) {
                                            data.phoneNumber = value;
                                          },
                                          onChanged: (value) {},
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
                                            hintPlaceHolder:
                                                'Please Select an option',
                                            helperText:
                                                'Your current time zone. Used to send summary and notification emails, for times in your activity feeds, and for reminders.',
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        verticalSpaceRegular,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      // left: 5,
                                      right: 10.0,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Profile Photo", style: subtitle3),
                                      verticalSpaceSmall,
                                      model.choosenImage != null
                                          ? Container(
                                              // color: kcCreateChannelColor,
                                              height: 230.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: FileImage(
                                                        model.choosenImage!),
                                                  )),
                                            )
                                          : Container(
                                              height: 230.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: Border.all(
                                                  width: 2,
                                                  color: hoverColor,
                                                ),
                                              ),
                                              child: Image.asset(
                                                'assets/images/profile_placeholder.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                      verticalSpaceRegular,
                                      Container(
                                        width: 180.w,
                                        height: 40.h,
                                        child: OutlineButton(
                                          borderSide: BorderSide(
                                              color: createChannelHeaderColor),
                                          onPressed: () {
                                            model.chooceFileToUpload(context);
                                          },
                                          child: Text(
                                            'Upload an image',
                                            style: subtitle3bb,
                                          ),
                                        ),
                                      ),
                                      verticalSpaceSmallOne,
                                      TextButton(
                                        onPressed: () {
                                          model.removeImage();
                                          // model.isSubmit;
                                        },
                                        child: Text(
                                          "Remove photo",
                                          style: kSubHeadingTextStyle2,
                                        ),
                                      ),
                                    ],
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 45.h,
                      // width: 80.w,
                      child: OutlineButton(
                        borderSide: BorderSide(color: createChannelHeaderColor),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel", style: kSubHeadingTextStyle),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Container(
                      height: 45.h,
                      // width: 100.w,
                      child: ProfileButton(
                        isBusy: model.isBusy,
                        onTap: () async {
                          if (_fullNameFormKey.currentState!.validate())
                            return model.isSubmit;
                          await model.postDetails();
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
