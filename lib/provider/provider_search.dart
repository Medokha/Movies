import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class providersearch extends ChangeNotifier{
  TextEditingController _textFieldController = TextEditingController();
  void changesearch (String value){
    _textFieldController.text=value;
    notifyListeners();
  }
}