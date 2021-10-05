import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/zuri_api_service.dart';
import 'package:zc_desktop_flutter/ui/shared/dumb_widgets/center_tile.dart';

class ProfileEditViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _api = locator<ZuriApiService>();
  final _organizationService = locator<OrganizationService>();
  final GlobalKey<FormFieldState> _fullNameFormKey =
      GlobalKey<FormFieldState>();

  bool? _isFormValid() {
    return((_fullNameFormKey.currentState?.isValid));
    // return (_fullNameFormKey.currentState?.isValid);
  }

  bool _isSaveButtonEnabled = false;

  User? user;
  String? userId;
  String? token;

  final error1 = "";
  String profileImage = '';

  File? _choosenImage;

  File? get choosenImage => _choosenImage;
  get isFormValid => _isFormValid();

  get isSubmit => _isSaveButtonEnabled;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  void onChanged(value) {
    _isSaveButtonEnabled = _isFormValid()!;
    _fullNameFormKey.currentState?.validate();
    notifyListeners();
  }

  getUserDetail() async {
    final orgId = _organizationService.getOrganizationId();
    var user = await _api.updateUserDetails(organizationId: orgId, memberId: '', token: '',);
    notifyListeners();
  }

  // Future<void> getOrganizations() async {
  //   _organization = await _organizationService.getOrganizations();
  // }

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