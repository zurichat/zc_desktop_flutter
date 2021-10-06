import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  // _pageIndex is used to keep track of the current view.
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  ///This function is used to update the pageindex to know which view to display
  void setPageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
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
  // void fetchAndOrgUser() async {
  //   setIsloading();
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   setIsloading();
  // }

//   //This function update the view state using the _isLoading boolean value by inverting it's value
//   void setIsloading() {
//     _isLoading = !_isLoading;
//     notifyListeners();
//   }

//   // A list to hold the suggestions
//   List<TodoDummyModel> _todoList = [];

//   //If _suggestionsList is empty
//   //i.e the user did not search for any user yet then the data list should be returned
//   List<TodoDummyModel> get todoList =>
//       _todoList.isEmpty ? _dataList : _todoList;


//   /// The function perform a search on the _dataList and save the result of the search
//   /// to _suggestionsList.
  

//   //The function set the list _dataList to an empty list when user leave the view to save memory.
//   void setDataListTONull() {
//     _dataList = [];
//     notifyListeners();
//   }
// }
}
