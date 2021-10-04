import 'package:stacked/stacked.dart';
import 'package:zc_desktop_flutter/model/app_models.dart';

class PeopleUserGroupViewModel extends BaseViewModel {
  // _pageIndex is used to keep track of the current view.
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  //The boolean value is used to keep track of the view state
  // which initial value is set to false
  bool _isLoading = false;
  get isLoading => _isLoading;

  // Creating a list of dummy datas to be used for ui design.
  // This list contains all the users in the workspace.
  // Querys are performed on this list so we don't have to be making api
  // calls each time user want to perform a search
  List<SuggestionDummyModel> _dataList = [
    SuggestionDummyModel(
        bio: 'CEOing',
        displayName: 'Mark',
        isActive: true,
        displayImage: 'assets/people/mark.png'),
    SuggestionDummyModel(
        displayName: 'Xylux',
        isActive: true,
        displayImage: 'assets/people/xyluz.png'),
    SuggestionDummyModel(
        displayName: 'Naza',
        isActive: true,
        displayImage: 'assets/people/naza.png'),
    SuggestionDummyModel(
        displayName: 'buka',
        isActive: false,
        displayImage: 'assets/people/buka.png'),
    SuggestionDummyModel(
        displayName: 'seunbayo',
        isActive: false,
        displayImage: 'assets/people/seunbayo.png'),
    SuggestionDummyModel(
        displayName: 'Ninyo',
        isActive: false,
        displayImage: 'assets/people/ninyo.png'),
    SuggestionDummyModel(
        bio: 'CEOing',
        displayName: 'Mark',
        isActive: true,
        displayImage: 'assets/people/mark.png'),
    SuggestionDummyModel(
        displayName: 'Xylux',
        isActive: true,
        displayImage: 'assets/people/xyluz.png'),
    SuggestionDummyModel(
        displayName: 'Naza',
        isActive: true,
        displayImage: 'assets/people/naza.png'),
    SuggestionDummyModel(
        displayName: 'buka',
        isActive: false,
        displayImage: 'assets/people/buka.png'),
    SuggestionDummyModel(
        displayName: 'seunbayo',
        isActive: false,
        displayImage: 'assets/people/seunbayo.png'),
    SuggestionDummyModel(
        displayName: 'Ninyo',
        isActive: false,
        displayImage: 'assets/people/ninyo.png'),
    SuggestionDummyModel(
        bio: 'CEOing',
        displayName: 'Mark',
        isActive: true,
        displayImage: 'assets/people/mark.png'),
    SuggestionDummyModel(
        displayName: 'Xylux',
        isActive: true,
        displayImage: 'assets/people/xyluz.png'),
    SuggestionDummyModel(
        displayName: 'Naza',
        isActive: true,
        displayImage: 'assets/people/naza.png'),
    SuggestionDummyModel(
        displayName: 'buka',
        isActive: false,
        displayImage: 'assets/people/buka.png'),
    SuggestionDummyModel(
        displayName: 'seunbayo',
        isActive: false,
        displayImage: 'assets/people/seunbayo.png'),
    SuggestionDummyModel(
        displayName: 'Ninyo',
        isActive: false,
        displayImage: 'assets/people/ninyo.png'),
    SuggestionDummyModel(
        bio: 'CEOing',
        displayName: 'Mark',
        isActive: true,
        displayImage: 'assets/people/mark.png'),
    SuggestionDummyModel(
        displayName: 'Xylux',
        isActive: true,
        displayImage: 'assets/people/xyluz.png'),
    SuggestionDummyModel(
        displayName: 'Naza',
        isActive: true,
        displayImage: 'assets/people/naza.png'),
    SuggestionDummyModel(
        displayName: 'buka',
        isActive: false,
        displayImage: 'assets/people/buka.png'),
    SuggestionDummyModel(
        displayName: 'seunbayo',
        isActive: false,
        displayImage: 'assets/people/seunbayo.png'),
    SuggestionDummyModel(
        displayName: 'Ninyo',
        isActive: false,
        displayImage: 'assets/people/ninyo.png'),
  ];

  //The function is used to fetch and set data from the api into the data list.
  // TODO yet to be written
  void fetchAndOrgUser() async {
    setIsloading();
    await Future.delayed(Duration(milliseconds: 1000));
    setIsloading();
  }

  //This function update the view state using the _isLoading boolean value by inverting it's value
  void setIsloading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  // A list to hold the suggestions
  List<SuggestionDummyModel> _suggestionsList = [];

  //If _suggestionsList is empty
  //i.e the user did not search for any user yet then the data list should be returned
  List<SuggestionDummyModel> get suggestionList =>
      _suggestionsList.isEmpty ? _dataList : _suggestionsList;

  // Change the page index based on what user selected.
  // Assign the parameter value to _pageIndex
  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  /// The function perform a search on the _dataList and save the result of the search
  /// to _suggestionsList.
  void buildSuggestion(String query) {
    _suggestionsList = _dataList
        .where((data) =>
            data.displayName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //The function set the list _dataList to an empty list when user leave the view to save memory.
  void setDataListTONull() {
    _dataList = [];
    notifyListeners();
  }
}
