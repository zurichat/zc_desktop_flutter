import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zc_desktop_flutter/ui/views/auth/login/login_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
 group('LoginViewmodelTest -', (){
  setUp(() => registerServices());
  tearDown(() => unregisterServices());

  group('Login-', () {
   test('Verify that loginViewModel.login user called from the AuthService with the pass in value', () {
     final authService = getAndRegisterAuthService();
     final loginViewModel = LoginViewModel();
     loginViewModel.login('toxic', 'test');
     verify(authService.loginUser(email: 'toxic', password: 'test'));
   });

   test('Verify that when login is called gotoChooseWorkSpace is called to redirect the user to choose workspace view', () async {
     final loginViewModel = LoginViewModel();
     await loginViewModel.login('email', 'password');
     verify(loginViewModel.gotoChooseWorkSpace());
   });

   group('Verify state update', () { 
     test('when setPasswordVisibility() is called expect _passwordVisibility to be false', () async {
       final loginViewModel = LoginViewModel();
      loginViewModel.setPasswordVisibility();
      expect(loginViewModel.passwordVisible, false);
     });
   });
  });
 });
}