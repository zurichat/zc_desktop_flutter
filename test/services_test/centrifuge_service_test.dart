// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:zc_desktop_flutter/services/centrifuge_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  CentrifugeService _getService = CentrifugeService();
  group('CentrifugeServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('runLogic -', () {
      test('', () {});
    });
  });
}
