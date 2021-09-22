import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileEditViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  File? imagefile;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  Future chooceFileToUpload() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.image);

      if (result != null) {
        File file = File(result.files.single.path!);
        notifyListeners();
      } else {
        // User canceled the picker
        _navigator.popRepeated(1);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
