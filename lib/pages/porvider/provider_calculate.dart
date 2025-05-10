import 'package:flutter/material.dart';

class ProviderCalculate with ChangeNotifier {
  double? number1;
  double? number2;
  String result = '';
  List<String> history = [];

  void setNumber1(String value) {
    number1 = double.tryParse(value);
  }

  void setNumber2(String value) {
    number2 = double.tryParse(value);
  }

  void calculate(String operator) {
    if (number1 == null || number2 == null) return;

    final operations = {
      '+': () => number1! + number2!,
      '-': () => number1! - number2!,
      '*': () => number1! * number2!,
      '/': () => number2 != 0 ? number1! / number2! : double.nan,
    };

    final operation = operations[operator];
    if (operation == null) return;

    final res = operation();
    result = '$number1 $operator $number2 = ${res.toStringAsFixed(2)}';
    history.insert(0, result);
    notifyListeners();
  }

  void clearHistory() {
    history.clear();
    notifyListeners();
  }
}
