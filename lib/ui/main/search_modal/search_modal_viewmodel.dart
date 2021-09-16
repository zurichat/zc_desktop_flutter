import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SearchModalViewmodel extends BaseViewModel {
  final _scrollbarController = ScrollController();

  ScrollController get scrollbarController => _scrollbarController;
}
