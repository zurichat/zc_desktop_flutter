import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/connectivity_status.dart';
import 'package:zc_desktop_flutter/services/connectivity_service.dart';

class BaseConnectivityCheckViewModel extends ReactiveViewModel {
  final log = getLogger('BaseConnectivityCheckViewModel');
  final _connectivityService = locator<ConnectivityService>();
  ReactiveValue<bool> isConnected = ReactiveValue<bool>(true);

  void setup() async {
    await _connectivityService.checkConnectivity();
    runTask();
  }

  void runTask() {
    _connectivityService.hasInternetConnection!.listen(
      (result) {
        if (result == InternetStatus.Disconnected) {
          isConnected.value = false;
        } else {
          isConnected.value = true;
        }
      },
    );
  }

  @override
  void dispose() async {
    // cancels all network related checks
    await _connectivityService.cancelNetworkCheck();
    await _connectivityService.cancelInternetCheck();
    super.dispose();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_connectivityService];
}
