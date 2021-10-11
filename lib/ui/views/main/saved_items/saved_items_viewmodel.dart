import 'package:stacked/stacked.dart';

class SavedItemsViewModel extends BaseViewModel {
  bool isVisible = true;
  void dismissCard() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
