import 'package:stacked/stacked.dart';

class ProfileDropdownViewModel extends BaseViewModel {
  late double height, width, xPosition, yPosition;

  bool _isDropped = false;
  bool _isHover = false;

  bool get isDropped => _isDropped;
  bool get isHover => _isHover;

  setIsDropped(bool value) {
    _isDropped = value;
    notifyListeners();
  }

  onEntered(bool isHover) {
    _isHover = isHover;
    notifyListeners();
  }
}
