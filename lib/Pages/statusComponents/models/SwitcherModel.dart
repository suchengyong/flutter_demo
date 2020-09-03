import 'package:flutter/material.dart';

class SwitcherModel with ChangeNotifier {
  bool _status = false;

  void changeStatus(value) {
    _status = value;
    notifyListeners();
  }

  bool get status => _status; // get方法
}
