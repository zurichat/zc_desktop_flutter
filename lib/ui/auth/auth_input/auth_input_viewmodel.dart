import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class AuthInputTestViewModel extends BaseViewModel{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passWordController => _passWordController;

  void onSaved(var inputVal){
    print(inputVal);
    notifyListeners();
  }
}