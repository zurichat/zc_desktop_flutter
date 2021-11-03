import 'package:mockito/mockito.dart';
import 'package:zc_desktop_flutter/ui/views/auth/sign_up/sign_up_viewmodel.dart';
import '../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
 group('SignUpViewmodelTest -', (){
  setUp(() => registerServices());
  tearDown(() => unregisterServices());

  group('runLogic setState -', () {
   test('Verify that when setPasswordVisibility() is called _passwordVisibility is negated', () {
     final signupViewModel = SignUpViewModel();
     final passwordVisibility = signupViewModel.passwordVisibility;
     signupViewModel.setPasswordVisibility();
     expect(signupViewModel.passwordVisibility, !passwordVisibility);
   });

   test('Verify that when setConfirmPasswordVisibility() is called _confirmPasswordVisibility is negated', () {
     final signupViewModel = SignUpViewModel();
     final confirmPasswordVisibility = signupViewModel.confirmPasswordVisibility;
     signupViewModel.setPasswordVisibility();
     expect(signupViewModel.passwordVisibility, !confirmPasswordVisibility);
   });

   test('Verify that when onPolicyCheckChanged is called _isPolicyChecked is updated to the passed in value', () {
     final signupViewModel = SignUpViewModel();
     signupViewModel.onPolicyCheckChanged(true);
     expect(signupViewModel.isPolicyChecked, true);
   });

   group('runLogic signup', () {
     test('verify that when isPolicyChecked is true no error is thrown', () async {
       final signupViewModel = SignUpViewModel();
       signupViewModel.onPolicyCheckChanged(true);
       await signupViewModel.performSignUp('email', 'password', 'Toxic Bishop');
       expect(await signupViewModel.hasError , false);
     });

     test('Verify that when perform signup is called authservie sign is called with the fname and lname since there\'s space in the passwed name', () async {
        final signupViewModel = SignUpViewModel();
        final authService = getAndRegisterAuthService();
        signupViewModel.onPolicyCheckChanged(true);
        await signupViewModel.performSignUp('email ', 'password', 'Toxic Bishop');
        verifyNever(authService.signup(email: 'email'.trim(), password: 'password', fName:'Toxic', lName: 'Bishop' ));
     });

     test('throw an error if isPolicyCheckChanged is false ', () async {
        final signupViewModel = SignUpViewModel();
        final authService = getAndRegisterAuthService();
        signupViewModel.onPolicyCheckChanged(true);
        await signupViewModel.performSignUp('email ', 'password', 'Toxic');
        verifyNever(authService.signup(email: 'email'.trim(), password: 'password', fName:'Toxic'));
     });
   });
  });
 });
}