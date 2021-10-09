import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';
//import 'package:zc_desktop_flutter/ui/views/startup/startup_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {

//  StartUpViewModel _getModel() => StartUpViewModel();
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('runStartupLogic -', () {
      test('Check if a user is saved to disk', () {
        // final startupService = getAndRegisterStartupService(hasLoggedInUser: true);
        // //var model = 
        // _getModel();
        // //model.initialise();
        // verify(startupService.hasLoggedInUser);
      });
    });
  });
}
