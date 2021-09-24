import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileEditViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  File? _choosenImage;

  File? get choosenImage => _choosenImage;

  void closeDialog() {
    _navigator.popRepeated(1);
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
      print(e);
    }
  }
}
