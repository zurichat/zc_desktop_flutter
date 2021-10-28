import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/constants/app_strings.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/services/organization_service.dart';
import 'package:zc_desktop_flutter/services/window_title_bar_service.dart';

class CreateWorkspaceViewModel extends BaseViewModel {
  final _organizationService = locator<OrganizationService>();
  String _logoUrl = 'assets/images/zuri_logo.svg';
  String get logoUrl => _logoUrl;

  String _worldLogoUrl = 'assets/images/world.svg';
  String get worldLogoUrl => _worldLogoUrl;

  String _arrowDown = 'assets/images/arrow_down.svg';
  String get arrowDown => _arrowDown;

  String _signInText = 'First, enter your email';
  String get signInText => _signInText;

  String _signInText2 = 'We suggest using the email address you use at work. ';
  String get signInText2 => _signInText2;

  String _emailHint = 'name@workemail.com';
  String get emailHint => _emailHint;

  String _btnText = 'Continue';
  String get btnText => _btnText;

  String _policy = 'It’s okay to send me emails about Zuri.';
  String get policy => _policy;

  String _signInPolicySubtext =
      'By continuing, you agree that you have accepted our User \nNotice and Privacy Policy and Cookie Policy.';
  String get signInPolicySubtext => _signInPolicySubtext;

  String _privacy = 'Privacy & Terms';
  String get privacy => _privacy;

  String _contactUs = 'Contact us';
  String get contactUs => _contactUs;

  String _changeRegion = 'Change Region';
  String get changeRegion => _changeRegion;

  String? _email;
  String? get email => _email;

  double _formWidth = 486.w;
  double get formWidth => _formWidth;

  double _authButtonHeight = 48.h;
  double get authButtonHeight => _authButtonHeight;

  bool _acceptEmails = false;
  bool get acceptEmails => _acceptEmails;

  String? _emailErrorText = '';
  String? get emailErrorText => _emailErrorText;

  final _windowsTitleBarService = locator<WindowTitleBarService>();
  
  void init() async {
    await Future.delayed(Duration(milliseconds: 1));
    _windowsTitleBarService.setHome(false);
    _windowsTitleBarService.setTitle('Zuri | Create Workspace');
  }
  void setEmail(String? value) {
    _email = value;
    notifyListeners();
  }

  void checkAcceptEmails() {
    _acceptEmails = !_acceptEmails;
    notifyListeners();
  }

  String _stage1PageNum = 'Stage 1 of 3 ';
  String get stage1PageNum => _stage1PageNum;

  String _companyNameHint = 'Ex: Paystack internatonal ';
  String get companyNameHint => _companyNameHint;

  String _companyName = '';
  String get companyName => _companyName;
  void setCompanyName(String value) {
    _companyName = value.toString();
    notifyListeners();
  }

  String _signInSubtext =
      'This will be the name of your slack workspace - choose something that your team will recognise';
  String get signInSubtext => _signInSubtext;

  String _stage1Text = 'What’s the name of your \ncompany or team? ';
  String get stage1Text => _stage1Text;

  final _navigationService = locator<NavigationService>();
  void goToStage1() {
    _navigationService.navigateTo(Routes.createWorkspaceStage1);
  }

  String _stage2PageNum = 'Stage 2 of 3 ';
  String get stage2PageNum => _stage2PageNum;

  String _stage2Text = 'What is your team working on \nright now? ';
  String get stage2Text => _stage2Text;

  String _stage2SubText =
      'This could be anything: a project, a campaign, event, or the deal you are trying to close';
  String get stage2SubText => _stage2SubText;

  String _stage2ExampleText = 'Ex: Q1 Budget, Project Alpha ';
  String get stage2ExampleText => _stage2ExampleText;

  void goToStage2() {
    _navigationService.navigateTo(Routes.createWorkspaceStage2);
  }

  String _stage3PageNum = 'Stage 3 of 3 ';
  String get stage3PageNum => _stage3PageNum;

  String _stage3Text = 'Who do you email most about ';
  String get stage3Text => _stage3Text;

  String _stage3SubText = 'project-zuri ?';
  String get stage3SubText => _stage3SubText;

  String _stage3btnText = 'Add Teammates';
  String get stage3btnText => _stage3btnText;

  String _stage3EmailHint = 'Ex: bola@gmail.com ';
  String get stage3EmailHint => _stage3EmailHint;

  String _btnText2 = 'Skip this step';

  String get btnText2 => _btnText2;

  void goToStage3() {
    _navigationService.navigateTo(Routes.createWorkspaceStage3);
  }

  void goToHome() {
    _navigationService.navigateTo(Routes.organizationView);
  }

  Future<void> createOrganization(String email) async {
    await runBusyFuture(performCreateOrganization(email));
  }

  Future<void> performCreateOrganization(String email) async {
    try {
      await _organizationService.createOrganization(email);
      //if(!hasError) {
        goToStage1();
     // }
    } catch (e) {
      if(e.toString().contains('40')) {
        throw Failure('user with this email does not exist');
      }
      throw Failure(AuthErrorMessage);
    }
  }
}
