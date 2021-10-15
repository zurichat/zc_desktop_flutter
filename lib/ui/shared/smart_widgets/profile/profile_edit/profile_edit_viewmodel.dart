import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'profile_edit_view.form.dart';

class ProfileEditViewModel extends FormViewModel {
  final _userService = locator<UserService>();
  final log = getLogger('ProfileEditViewModel');
  final _organizationService = locator<OrganizationService>();


  // bool _isFormValid() {
  //   return (_fullNameFormKey.currentState!.isValid);
  // }

  Member _currentMember = Member(
    id: '',
    orgId: '',
    firstName: '',
    lastName: '',
    displayName: '',
    bio: '',
    phone: '',
    pronouns: '',
    timeZone: '',
    createdAt: '',
    updatedAt: '',
  );

  Member get currentMember => _currentMember;

  bool _isSaveButtonEnabled = false;

  File? _choosenImage;


  File? get choosenImage => _choosenImage;

  // get isFormValid => _isFormValid();

  // get isSubmit => _isSaveButtonEnabled;

  // void onValidate() {
  //   _isSaveButtonEnabled = _isFormValid();
  //   _fullNameFormKey.currentState!.validate();
  //   notifyListeners();
  // }

  Future<void> postDetails(
    String bio,
    String displayName,
    String firstName,
    String lastName,
    String phoneNumber,
    String pronoun,
    String timeZone,
  ) async {
    await runBusyFuture(performProfilePost(
        firstName, lastName, displayName, bio, pronoun, phoneNumber, timeZone));
  }

  Future<void> performProfilePost(
    String bio,
    String displayName,
    String firstName,
    String lastName,
    String phoneNumber,
    String pronoun,
    String timeZone,
  ) async {
    try {
    await _userService.updateUser(
      bio: whoValue,
      displayName: displayNameValue,
      firstName: firstNameValue,
      lastName: lastNameValue,
      phoneNumber: phoneNumberValue,
      pronoun: pronounValue,
      timeZone: timeZoneValue,
    );
    } catch(e) {
      if (e.toString().contains('40')) {
        throw Failure('');
      }
      throw Failure('');
    }
    // Do something after save
    
  }

  Future<void> postPicture(
    File img,
  ) async {
    await runBusyFuture(performPicturePost(img));
  }

  Future<void> performPicturePost(
    File img,
  ) async {
    final response = await _userService.updateUserImage(
      img: _choosenImage,
    );
    // Do something after save
    return response;
  }

  void setup() async {
    await runBusyFuture(setupOrganization());
    _organizationService.saveMemberId(_currentMember.id);
    log.d('current member id ${_currentMember.id}');
  }

  Future<void> setupOrganization() async {}

  removeImage() {
    _choosenImage = null;
    notifyListeners();
  }

  Future<void> chooceFileToUpload(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        _choosenImage = File(file.path);
        notifyListeners();
      } else {
        // User canceled the picker

      }
    } catch (e) {
      // print(e);
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
