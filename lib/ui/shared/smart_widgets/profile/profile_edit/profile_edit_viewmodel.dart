import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';

class ProfileEditViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _userService = locator<UserService>();
  final GlobalKey<FormFieldState> _fullNameFormKey =
      GlobalKey<FormFieldState>();

  bool _isFormValid() {
    return (_fullNameFormKey.currentState!.isValid);
    // return (_fullNameFormKey.currentState?.isValid);
  }

  bool _isSaveButtonEnabled = false;

  User? user;
  String? userId;
  String? token;
  String _param = '';

  final error1 = "";
  String profileImage = '';

  File? _choosenImage;

  File? get choosenImage => _choosenImage;

  get param => _param;
  get isFormValid => _isFormValid();

  get isSubmit => _isSaveButtonEnabled;

  // void closeDialog() {
  //   _navigator.popRepeated(1);
  //   notifyListeners();
  // }

  // void onValidate() {
  //   _isSaveButtonEnabled = _isFormValid();
  //   _fullNameFormKey.currentState!.validate();
  //   notifyListeners();
  // }

  Future<void> postDetails() async {
    await runBusyFuture(performProfilePost(param));
  }
  

  Future<void> performProfilePost(UpdateUserParam param) async {
    try {
      await _userService.updateUser(params: param);
    } catch (e) {
      throw Failure(e.toString());
    }
    // Do something after save
  }

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
        // withReadStream: true,
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
}
