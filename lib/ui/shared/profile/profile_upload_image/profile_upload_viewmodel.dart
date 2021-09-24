import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileUploadViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  File? _choosenImage;

  File? get choosenImage => _choosenImage;

  // Crop _cropController;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  // Future<void> cropFileToUpload() async {
  //   setState(() {
  //     _loadingImage = true;
  //   });
  //   for (final assetName in _images) {
  //     _imageDataList.add(await _load(assetName));
  //   }
  //   setState(() {
  //     _loadingImage = false;
  //   });
  // }

  // Future<Uint8List> _load(String assetName) async {
  //   final assetData = await rootBundle.load(assetName);
  //   return assetData.buffer.asUint8List();
  // }

  // Future<void> chooceFileToUpload(BuildContext context) async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       allowMultiple: false,
  //       type: FileType.image,
  //       // withReadStream: true,
  //     );

  //     if (result != null) {
  //       File file = File(result.files.single.path!);
  //       // _choosenImage = File(file.path);
  //       // notifyListeners();
  //       showDialog(context: context, builder: (context) => ProfileUploadView());
  //     } else {
  //       // User canceled the picker
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
