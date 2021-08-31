import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class InputTestViewModel extends BaseViewModel{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passWordController => _passWordController;

  void onSaved(var inputVal){
    print(inputVal);
    notifyListeners();
  }
}