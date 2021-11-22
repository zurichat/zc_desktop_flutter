import 'package:flutter_test/flutter_test.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocalStorageServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('runLogic -', () {
      test('get logged in user', () {
        final service = getAndRegisterLocalStorageService();
        service.getFromDisk(localAuthResponseKey);

      });
    });
  });
}
