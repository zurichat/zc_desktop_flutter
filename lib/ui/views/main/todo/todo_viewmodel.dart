import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/core/network/failure.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';
import 'package:zc_desktop_flutter/app/app.logger.dart';
import 'package:zc_desktop_flutter/services/user_service.dart';
import 'package:zc_desktop_flutter/services/zuri_api/api.dart';

class TodoViewModel extends BaseViewModel {
  final _apiService = locator<Api>();
  final _userService = locator<UserService>();
  final log = getLogger('TodoViewModel');
  //Save the list of Todos the the variable [_todo]
  List<Todo> _todoList = [];
  //The getter return the list [_todoList]
  List<Todo> get todoList => _todoList;
  // _pageIndex is used to keep track of the current view.
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  ///This function is used to update the pageindex to know which view to display
  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  bool _isLoading = false;
  get isLoading => _isLoading;
  //  List<TodoDummyModel> _dataList = [
  //   TodoDummyModel(
  //       TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //        TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //        TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //        TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //       TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //        TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //       TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  //   TodoDummyModel(
  //       TodoText1: 'ggg',
  //       TodoName: 'Mark',
  //       isActive: true,
  //       displayImage: 'assets/people/mark.png'),
  // ];

  //The function is used to fetch and set data from the api into the data list.
  // TODO yet to be written
  void fetchAndSetTodos() async {
    setIsloading();
    try {
      _todoList = await _apiService.fetchTodoList();
      log.i(_todoList);
    } catch (e) {
      log.i(e);
    }
    setIsloading();
  }

  /// The un

//   //This function update the view state using the _isLoading boolean value by inverting it's value
  void setIsloading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  //This function creates a new todo
  Future<void> createTodo({required String title, String? description}) async {
    log.i(_todoList);
    final todo = Todo(
        description: description ?? '',
        title: title,
        status: '',
        type: '',
        userID: _userService.auth.user!.id);
    try {
      await runBusyFuture(
          _apiService.createTodo(todo, _userService.auth.user!.token));
      //Add the todo to the current list of todo.
      //_todoList.add(todo);
      _todoList.insert(0, todo);
      log.i(_todoList);
      notifyListeners();
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  void deleteTodo(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  @override
  void onFutureError(error, Object? key) {
    // TODO: implement onFutureError
    super.onFutureError(error, key);
  }

//   // A list to hold the suggestions
  // List<TodoDummyModel> _todoList = [];

//   //If _suggestionsList is empty
//   //i.e the user did not search for any user yet then the data list should be returned
  // List<TodoDummyModel> get todoList =>
  //     _todoList.isEmpty ? _dataList : _todoList;

  // / The function perform a search on the _dataList and save the result of the search
  // / to _suggestionsList.

  //The function set the list _dataList to an empty list when user leave the view to save memory.
//   void setDataListTONull() {
//     _dataList = [];
//     notifyListeners();
//   }
  final _navigator = locator<NavigationService>();

  // //Declare the services that are dependent upon
  // final _localStorageService = locator<LocalStorageService>();

  // /// This gets the currently logged in user respose

  // final _navigationService = locator<NavigationService>();
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

  // void settodoName(String value) {
  //   _todoName = value;
  //   notifyListeners();
  // }

  // void settodoDescription(String value) {
  //   _todoDescription = value;
  //   notifyListeners();
  // }

  // void goToViewTodos() {
  //   _navigationService.navigateTo(rou);
  //   notifyListeners();
  // }

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

  // String userEmail() {
  //   return _auth.user!.email;
  // }

  // Future<void> createtodo(
  //   String name,
  //   String owner,
  //   String description,
  //   bool private,
  // ) async {
  //   bool isTodoNameValid = nameValidator(_todoName);
  //   bool isTodoDescriptionValid = nameValidator(_todoDescription);

  //   if (!isTodoNameValid || !isTodoDescriptionValid) {
  //     if (!isTodoNameValid) {
  //       _todoNameError = 'Todo must be at least 3 characters long';
  //     } else {
  //       _todoNameError = null;
  //     }
  //     // if (!istodoDescriptionValid) {
  //     _todoDescriptionError =
  //         'Todo Description must be at least 5 characters long';
  //   } else {
  //     _todoDescriptionError = null;
  //   }

  //   notifyListeners();
  //   return;
  // }

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

  // Future<void> performCreateTodo(
  //     String name, String owner, String description, bool private) async {
  //   // await _auth.createtodos(
  //   //     name, owner, description, private);
  //   // await _todosService.createTodos(
  //   //     name: name, owner: owner, description: description, private: private);

  //   //   _showError = true;
  //   //   await Future.delayed(
  //   //     Duration(milliseconds: 1500),
  //   //   );
  //   //   notifyListeners();
  //   //   _navigationService.pushNamedAndRemoveUntil(Routes.organizationView);
  //   // }

  //   /// Error should be handled here. It could be displaying a toast of something else
  // }
}
