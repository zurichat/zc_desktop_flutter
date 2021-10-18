import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/const_text_styles.dart';
import 'package:zc_desktop_flutter/ui/shared/const_ui_helpers.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/profile_input_field.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/zcdesk_auth_btn.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/profile/profile_edit/profile_edit_viewmodel.dart';
import 'profile_edit_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'displayName'),
  FormTextField(name: 'who'),
  FormTextField(name: 'pronoun'),
  FormTextField(name: 'phoneNumber'),
])
class ProfileEditView extends StatelessWidget with $ProfileEditView {
  final _fullNameFormKey = GlobalKey<FormState>();

  ProfileEditView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollcontroller = ScrollController();

    return ViewModelBuilder<ProfileEditViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
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
                      'Edit Profile',
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
                                          controller: firstNameController,
                                          label: 'First Name',
                                          hintPlaceHolder: 'First Name',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            value!;
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty ||
                                                !RegExp(r'^[a-z A-Z]+$')
                                                    .hasMatch(value)) {
                                              return 'Unfortunately, you can’t leave this blank.';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        verticalSpaceRegular,
                                        ProfileInputField(
                                          controller: lastNameController,
                                          label: 'Last Name',
                                          hintPlaceHolder: 'Last Name',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            value!;
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty ||
                                                !RegExp(r'^[a-z A-Z]+$')
                                                    .hasMatch(value)) {
                                              return 'Unfortunately, you can’t leave this blank.';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        verticalSpaceRegular,
                                        ProfileInputField(
                                          controller: displayNameController,
                                          label: 'Display Name',
                                          helperText:
                                              'This could be your first name, or a nickname, however you’d like people to refer to you in Slack.',
                                          hintPlaceHolder: 'Display Name',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            value;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter displayname';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        verticalSpaceMedium,
                                        Text(
                                          'Custom rules for this workspace:',
                                          style: subtitle3bb,
                                        ),
                                        verticalSpaceRegular,
                                        Text(
                                          'Please use as single firstname or a permanent nickname. If someone uses your name, please change it',
                                          style: subtitle3b,
                                        ),
                                        verticalSpaceMedium,
                                        ProfileInputField(
                                          controller: whoController,
                                          label: 'What I do',
                                          hintPlaceHolder: 'What I do',
                                          helperText:
                                              'Let pepole know what you do at Zuri x I4G.',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            value;
                                          },
                                          
                                        ),
                                        verticalSpaceMedium,
                                        ProfileInputField(
                                          controller: pronounController,
                                          label: 'Pronouns',
                                          hintPlaceHolder:
                                              'Ex. they/Them/theirs',
                                          helperText:
                                              'Let pepole know which pronoun you are',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            value;
                                          },
                                        ),
                                        verticalSpaceMedium,
                                        ProfileInputField(
                                          controller: phoneNumberController,
                                          label: 'Phone Number',
                                          hintPlaceHolder: '(123) 555-55555',
                                          helperText: 'Enter a phone number.',
                                          inputType: TextInputType.number,
                                          keyboardType: TextInputType.phone,
                                          onSaved: (value) {
                                            value!;
                                          },
                                          validator: (value) {
                                            if (value!.length < 9) {
                                              return 'Enter currect phone number';
                                            } else {
                                              return null;
                                            }
                                          },
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
                                      Text('Profile Photo', style: subtitle3),
                                      verticalSpaceSmall,
                                      model.choosenImage != null
                                          ? Container(
                                              // color: kcCreateChannelColor,
                                              height: 200.h,
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
                                              height: 200.h,
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
                                        child: OutlinedButton(
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
                                          'Remove photo',
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
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel', style: kSubHeadingTextStyle),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Container(
                      height: 45.h,
                      child: ProfileButton(
                        isBusy: model.isBusy,
                        onTap: () async {
                          if (!_fullNameFormKey.currentState!.validate())
                            return;
                          await model.postDetails(
                            whoController.text,
                            displayNameController.text,
                            firstNameController.text,
                            lastNameController.text,
                            phoneNumberController.text,
                            pronounController.text,
                          );

                          if (model.choosenImage != null) {
                            await model.postPicture(model.choosenImage!);
                          }

                          Navigator.of(context).pop();
                        },
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
