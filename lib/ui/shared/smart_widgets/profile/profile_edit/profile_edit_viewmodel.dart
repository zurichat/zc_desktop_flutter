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

class ProfileEditViewModel extends FormViewModel {
  final _userService = locator<UserService>();
  final log = getLogger('ProfileEditViewModel');
  final _organizationService = locator<OrganizationService>();
  final GlobalKey<FormFieldState> _fullNameFormKey =
      GlobalKey<FormFieldState>();

  bool _isFormValid() {
    return (_fullNameFormKey.currentState!.isValid);
  }

  bool _isSaveButtonEnabled = false;

  User? user;
  String? userId;
  String? token;

  String profileImage = '';

  File? _choosenImage;

  Member _currentMember = Member();

  Member get currentMember => _currentMember;

  File? get choosenImage => _choosenImage;

  get isFormValid => _isFormValid();

  get isSubmit => _isSaveButtonEnabled;

  void onValidate() {
    _isSaveButtonEnabled = _isFormValid();
    _fullNameFormKey.currentState!.validate();
    notifyListeners();
  }

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
        bio: '',
        displayName: '',
        firstName: firstName,
        lastName: lastName,
        phoneNumber: '',
        pronoun: '',
        timeZone: '',
      );
    } catch (e) {
      throw Failure(e.toString());
    }
    // Do something after save
  }

  void setup() async {
    await runBusyFuture(setupOrganization());
    _organizationService.saveMemberId(_currentMember.id);
    log.d('current member id ${_currentMember.id}');
  }

  Future<void> setupOrganization() async {}

  // getUserDetail() async {
  //   final orgId = _organizationService.getOrganizationId();
  //   var response = await _api.updateUserDetails(
  //     organizationId: orgId,
  //     memberId: '',
  //     token: '', parameter: [],
  //   );
  //   notifyListeners();
  // }

  // Future<void> getOrganizations() async {
  //   _organization = await _organizationService.getOrganizations();
  // }

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
