import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class AllDmsViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  String _appbarText = "# All direct messages";
  String _searchBarText = "To: @somebody or @somebody@example.com";
  String _dayPlaceholder = "Today";
  String _titlePlaceholder = "Beckylicious";
  String _subtitlePlaceholder = "Rebecca: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ";
  String _timePlaceholder = "13:02";
  String _imagePlaceholder = "B";

  String get imagePlaceholder => _imagePlaceholder;
  String get timePlaceholder => _timePlaceholder;
  String get subtitlePlaceholder => _subtitlePlaceholder;
  String get titlePlaceholder => _titlePlaceholder;
  String get dayPlaceholder => _dayPlaceholder;
  String get searchBarText => _searchBarText;
  String get appbarText => _appbarText;
}