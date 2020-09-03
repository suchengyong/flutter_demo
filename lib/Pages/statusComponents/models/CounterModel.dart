import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _value = 10;

  void increment() {
    _value += 10;
    notifyListeners();
  }

  int get value => _value; // get方法
}
