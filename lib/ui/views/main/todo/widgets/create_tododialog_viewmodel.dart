import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/app/app.router.dart';
import 'package:zc_desktop_flutter/core/validator/validator.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/services/auth_service.dart';

import 'package:zc_desktop_flutter/services/local_storage_service.dart';

class CreateTodoDialogModel extends BaseViewModel with Validator {
  final _navigator = locator<NavigationService>();

  //Declare the services that are dependent upon
  final _localStorageService = locator<LocalStorageService>();

  /// This gets the currently logged in user respose
  Auth get _auth {
    final auth = _localStorageService.getFromDisk(localAuthResponseKey);
    return Auth.fromJson(jsonDecode(auth as String));
  }

  final log = getLogger('CreateTodoViewModel');
  final _navigationService = locator<NavigationService>();
  // final _todosService = locator<TodosService>();

  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  String _selectedDate =
      DateFormat('MMM dd, yyyy').format(DateTime.now()).toString();

  /// The getter function returns the selected date which is default to the current  date
  String get selectedDate => _selectedDate;

  /// This function is used to update [_selectDate] on the view.
  void setSelectedDate(DateTime date) {
    _selectedDate = DateFormat('MMM dd, yyyy').format(date).toString();
    notifyListeners();
  }

  bool _isSwitched = false;
  String _errorMessage = '';
  bool _showError = false;

  //TextController Error
  String? _todoNameError;
  String? _todoDescriptionError;

  // bool _isBusy = false;
  bool _isPrivate = false;
  // bool _isCreateTodoSuccessful = false;
  bool _isCreateTodoNotSuccessful = false;

  var _todoName = '';
  var _todoDescription = '';

  bool get isSwitched => _isSwitched;
  String get errorMessage => _errorMessage;
  bool get showError => _showError;

  //TextController Error getters

  bool get isPrivate => _isPrivate;
  // bool get isTodoSuccessful => _isTodoSuccessful;
  bool get isTodoNotSuccessful => _isCreateTodoNotSuccessful;

  get todoNameError => _todoNameError;
  get todoDescriptionError => _todoDescriptionError;

  get todoName => _todoName;
  get todoDescription => _todoDescription;

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  void settodoName(String value) {
    _todoName = value;
    notifyListeners();
  }

  void settodoDescription(String value) {
    _todoDescription = value;
    notifyListeners();
  }

  void goToViewTodos() {
    _navigationService.navigateTo(Routes.organizationView);
    notifyListeners();
  }

  // void _setIsBusy() {
  //   _isBusy = !_isBusy;
  //   notifyListeners();
  // }

  void setIsSwitched(bool val) {
    _isSwitched = val;
    _isPrivate = val;
    notifyListeners();
  }

  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  String userEmail() {
    return _auth.user!.email;
  }

  Future<void> createtodo(
    String name,
    String owner,
    String description,
    bool private,
  ) async {
    bool isTodoNameValid = nameValidator(_todoName);
    bool isTodoDescriptionValid = nameValidator(_todoDescription);

    if (!isTodoNameValid || !isTodoDescriptionValid) {
      if (!isTodoNameValid) {
        _todoNameError = 'Todo must be at least 3 characters long';
      } else {
        _todoNameError = null;
      }
      // if (!istodoDescriptionValid) {
      _todoDescriptionError =
          'Todo Description must be at least 5 characters long';
    } else {
      _todoDescriptionError = null;
    }

    notifyListeners();
    return;
  }

  // _setIsBusy();
  // if()
  //   await runBusyFuture(
  //       performCreatetodo(name, owner, description, private));

  //   if (_showError == false) {
  //     setErrorMessage('An unexpected error occured!');
  //     _setIsBusy();
  //     _setIsCreateTodoNotSuccessful();
  //   } else {
  //     _setIsCreateTodoSuccessful();
  //   }

  //   notifyListeners();
  // }

  Future<void> performCreateTodo(
      String name, String owner, String description, bool private) async {
    // await _auth.createtodos(
    //     name, owner, description, private);
    // await _todosService.createTodos(
    //     name: name, owner: owner, description: description, private: private);

    _showError = true;
    await Future.delayed(
      Duration(milliseconds: 1500),
    );
    notifyListeners();
    _navigationService.pushNamedAndRemoveUntil(Routes.organizationView);
  }

  /// Error should be handled here. It could be displaying a toast of something else
  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
  }

  // @override
  // void setFormStatus() {
  //   // TODO: implement setFormStatus
  // }
}
