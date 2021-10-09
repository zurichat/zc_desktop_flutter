import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WhiteBoardViewModel extends BaseViewModel {
  //  _point.clear(){}

  Color? _SelectedColor = Color(0xFF42A5F5);
  Color? get selectedColor => _SelectedColor;

  set selectedColor(color) {
    this._SelectedColor = color;
  }
}
