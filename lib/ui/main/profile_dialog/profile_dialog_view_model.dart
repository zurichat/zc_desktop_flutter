import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ProfileDialogViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool _fav = false;
  bool get fav => _fav;


  void updateFav (){
    _fav = !_fav;
    notifyListeners();
  }

  void popDialog(){
    _navigationService.popRepeated(0);
  }
  

}