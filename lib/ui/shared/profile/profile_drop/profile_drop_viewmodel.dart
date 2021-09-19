// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';

// class ProfileDropdownViewModel extends BaseViewModel {
//   final GlobalKey actionKey = GlobalKey();
//   late double height, width, xPosition, yPosition;
//   late OverlayEntry floatingDropdown;
//   bool isDropped = false;

//   bool get isDroppedd => isDropped;
//   get floatingDrop => floatingDropdown;

//   bool get isDroppedd => isDropped;

//   // void setIsDropped(bool value) {
//   //   _isDropped = value;
//   //   notifyListeners();
//   // }

//   void _toggleDropdown({
//     bool close = false,
//   }) {
//     if (isDropped || close) {
//       this.floatingDropdown.remove();

//       isDropped = false;
//       notifyListeners();
//     } else {
//       floatingDropdown = this.createFloatingDropdown();
//       Overlay.of(context)!.insert(this.floatingDropdown);

//       isDropped = true;
//       notifyListeners();
//     }
//   }
// }
