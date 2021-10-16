import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';

class ProfileEditViewModel extends FormViewModel {
  final log = getLogger('ProfileEditViewModel');
  final _organizationService = locator<OrganizationService>();

  // bool _isFormValid() {
  //   return (_fullNameFormKey.currentState!.isValid);
  // }
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Member _currentMember = Member(
    id: '',
    orgId: '',
    firstName: '',
    lastName: '',
    displayName: '',
    bio: '',
    phone: '',
    img: '',
    pronouns: '',
    timeZone: '',
    createdAt: '',
    updatedAt: '',
  );

  Member get currentMember => _currentMember;

  File? _choosenImage = null;

  File? get choosenImage => _choosenImage;


  Future<void> postDetails(
    String bio,
    String displayName,
    String firstName,
    String lastName,
    String phoneNumber,
    String pronoun,
  ) async {
    await runBusyFuture(performProfilePost(
        firstName, lastName, displayName, bio, pronoun, phoneNumber,));
  }

  Future<void> performProfilePost(
    String bio,
    String displayName,
    String firstName,
    String lastName,
    String phoneNumber,
    String pronoun,
  ) async {
    try {
      await _organizationService.updateUser(
        bio: bio,
        displayName: displayName.trim(),
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        phoneNumber: phoneNumber,
        pronoun: pronoun.trim(),
      );
    } catch (e) {
      if (e.toString().contains('40')) {
        throw Failure('');
      }
      throw Failure('');
    }
    // Do something after save
  }

  Future<void> postPicture(
    File url,
  ) async {
    await runBusyFuture(performPicturePost(_choosenImage!));
  }

  Future<void> performPicturePost(
    File url,
  ) async {
    try {
      await _organizationService.updateUserImage(
        url: url,
      );
    } catch (e) {
      if (e.toString().contains('40')) {
        throw Failure('');
      }
      throw Failure('');
    }
    // Do something after save
  }

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
        postPicture(_choosenImage!);
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
