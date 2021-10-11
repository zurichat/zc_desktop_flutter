import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zc_desktop_flutter/app/app.locator.dart';

class ChannelsDetailsViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  void closeDialog() {
    _navigator.popRepeated(1);
    notifyListeners();
  }

  bool _onTileHover = false;
  bool get onTileHover => _onTileHover;
  int? _onTileHoveredIndex;
  int? get onTileHoveredIndex => _onTileHoveredIndex;

  void onTileHovered(bool hover, int index) {
    _onTileHover = hover;
    _onTileHoveredIndex = index;
    notifyListeners();
  }

  bool _onFileTileHover = false;
  bool get onFileTileHover => _onFileTileHover;
  int? _onFileTileHoveredIndex;
  int? get onFileTileHoveredIndex => _onFileTileHoveredIndex;

  void onFileTileHovered(bool hover, int index) {
    _onFileTileHover = hover;
    _onFileTileHoveredIndex = index;
    notifyListeners();
  }

  bool _onActionTextHover = false;
  bool get onActionTextHover => _onActionTextHover;
  int _onActionTextHoverredIndex = 0;
  int get onActionTextHoveredIndex => _onActionTextHoverredIndex;

  void onActionTextHovered(bool hover, int index) {
    _onActionTextHover = hover;
    _onActionTextHoverredIndex = index;
    notifyListeners();
  }

  bool _onHoverActionsHovered = false;
  bool get onHoverActionsHover => _onHoverActionsHovered;

  String _hoverAction = '';
  String get hoverAction => _hoverAction;
  double _hoverWidth = 0;
  double get hoverWidth => _hoverWidth;

  void onHoverActionsHovered(bool hover, String action, double width) {
    _onHoverActionsHovered = hover;
    _hoverAction = action;
    _hoverWidth = width;
    notifyListeners();
  }

  bool _scrolling = false;
  bool get scrolling => _scrolling;
  void onScroll(bool scrolling) {
    _scrolling = scrolling;
    log(scrolling.toString());
    notifyListeners();
  }
}
