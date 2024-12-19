import 'package:flutter/material.dart';

class TextFieldProvider extends ChangeNotifier{
  String userInput="";
  void updateInput(String value)
  {
    userInput=value;
    notifyListeners();
  }
}