import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/constants/connectivity_status.dart';

/// Connectivity Service
///
/// Make checks to network and internet connectivity
///
/// Connectivity plus and Internet Connection Checker packages
class ConnectivityService with ReactiveServiceMixin {
  final log = getLogger('ConnectivityService');

  static const int DEFAULT_PORT = 53;
  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 5);
  static const Duration DEFAULT_INTERVAL = const Duration(minutes: 2);

  // Reactive values
  ReactiveValue<InternetStatus>? _hasInternetConnection;
  ReactiveValue<ConnectivityStatus>? _hasNetworkConnection;

  // Subscriptions
  StreamSubscription? _networkSubscription;
  StreamSubscription? _internetSubscription;

  ReactiveValue<InternetStatus>? get hasInternetConnection =>
      _hasInternetConnection;

  ReactiveValue<ConnectivityStatus>? get hasNetworkConnection =>
      _hasNetworkConnection;

  // initialize connectivity checker on instantiation
  ConnectivityService() {
    // initialize default values for reactive values upon object
    // instantiation
    _hasNetworkConnection =
        ReactiveValue<ConnectivityStatus>(ConnectivityStatus.Offline);
    _hasInternetConnection =
        ReactiveValue<InternetStatus>(InternetStatus.Disconnected);

    // register values to be listened to in this list
    listenToReactiveValues(
      [
        _hasNetworkConnection,
        _hasInternetConnection,
      ],
    );
    log.i('connectivity service initialized');
  }

  /// Check Both Network and Internet Connectivity
  Future<void> checkConnectivity() async {
    // allow anything to load before listening starts
    await Future.delayed(Duration(minutes: 1));
    // listen for changes for network mode first
    _networkSubscription =
        Connectivity().onConnectivityChanged.listen(_connectivityCallback);
  }

  // network connectivity callback
  _connectivityCallback(ConnectivityResult result) async {
    // using the wrapper to remove direct dependency on 3rd party service
    // Connectivity package
    // the process of wrapping into local enum ConnectivityStatus
    final networkStatus = _getNetworkStatusFromResult(result);

    // set the result to the network reactive value
    _hasNetworkConnection!.value = networkStatus;

    // if network result mode not none
    if (networkStatus != ConnectivityStatus.Offline) {
      // check for internet connection
      _internetSubscription =
          InternetConnectionChecker().onStatusChange.listen(_internetCallback);
      InternetConnectionChecker().checkInterval = DEFAULT_INTERVAL;
      InternetConnectionChecker().addresses = _DEFAULT_ADDRESSES;
    }
  }

  // internet connectivity callback
  _internetCallback(InternetConnectionStatus result) {
    // the process of wrapping into local enum InternetStatus
    final internetStatus = _getInternetStatusFromResult(result);
    _hasInternetConnection!.value = internetStatus;
  }

  // cancel subscriptions
  /// Cancel Network check subscription
  Future<void> cancelNetworkCheck() async {
    await _networkSubscription!.cancel();
  }

  /// Cancel Internet check subscription
  Future<void> cancelInternetCheck() async {
    await _internetSubscription!.cancel();
  }

  /// Wrapping ConnectivityResult enum from package to
  /// ConnectivityStatus enum
  ConnectivityStatus _getNetworkStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        log.i('Connectivity on Cellular.');
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        log.i('Connectivity on WiFi.');
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        log.i('Connectivity on Offline.');
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }

  /// Wrapping InternetConnectionStatus enum from package to
  /// InternetStatus enum
  InternetStatus _getInternetStatusFromResult(InternetConnectionStatus result) {
    switch (result) {
      case InternetConnectionStatus.connected:
        log.i('You are connected to the internet.');
        return InternetStatus.Connected;
      case InternetConnectionStatus.disconnected:
        log.i('You are disconnected from the internet.');
        return InternetStatus.Disconnected;
      default:
        return InternetStatus.Disconnected;
    }
  }

  final List<AddressCheckOptions> _DEFAULT_ADDRESSES = List.unmodifiable([
    AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
  ]);
}
