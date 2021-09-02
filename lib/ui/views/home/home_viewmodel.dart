import 'package:stacked/stacked.dart';

import 'package:zc_desktop_flutter/app/app.logger.dart';

import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/services/local_storage_service.dart';
import 'package:zc_desktop_flutter/ui/views/startup/startup_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewwModel");

  String _logoUrl = 'assets/images/zc_logo.png';
  double _logoWidth = 10.0;
  double _logoHeight = 10.0;
  String _title = 'Zuri';
  String _logo2 = 'assets/images/zc_logo2.png';
  double _logoWidth2 = 10.0;
  double _logoHeight2 = 10.0;

  String get logoUrl => _logoUrl;
  double get logoWidth => _logoWidth;
  double get logoHeight => _logoHeight;
  String get title => _title;
  String get logo2 => _logo2;
  double get logo2Width => _logoWidth2;
  double get logo2Height => _logoHeight2;


  // TODO: 4, Remove after review
  final _storageService = locator<LocalStorageService>();

  // TODO: 5, Remove after review
  String get testString => _storageService.getFromDisk(testLocalKey) as String;
}
