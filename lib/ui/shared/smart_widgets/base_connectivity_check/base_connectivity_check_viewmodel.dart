import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/connectivity_status.dart';
import 'package:zc_desktop_flutter/services/connectivity_service.dart';

class BaseConnectivityCheckViewModel extends ReactiveViewModel {
  final log = getLogger("BaseConnectivityCheckViewModel");
  final _connectivityService = locator<ConnectivityService>();

  Future<bool> connected() async {
    // 5 seconds before checking
    await Future.delayed(Duration(seconds: 5));
    if (_connectivityService.hasNetworkConnection!.value !=
        ConnectivityStatus.Offline) {
      if (_connectivityService.hasInternetConnection!.value !=
          InternetStatus.Disconnected) {
        log.i("has Network and Internet - true");
        return true;
      }
    }
    // false if no internet
    log.i("has Network and Internet - false");
    return false;
  }

  @override
  void dispose() async {
    await _connectivityService.cancelNetworkCheck();
    super.dispose();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_connectivityService];
}
