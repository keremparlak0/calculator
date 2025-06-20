import 'package:flutter/foundation.dart';
import '../models/calculation_history.dart';
import '../models/calculation_result.dart';

class CalculatorProvider extends ChangeNotifier {
  String _currentInput = '';
  String _currentExpression = '';
  String _result = '';
  final CalculationHistory _history = CalculationHistory();

  String get currentInput => _currentInput;
  String get currentExpression => _currentExpression;
  String get result => _result;
  CalculationHistory get history => _history;

  void appendNumber(String number) {
    _currentInput += number;
    notifyListeners();
  }

  void appendDecimal() {
    if (_currentInput.isEmpty) {
      _currentInput = '0.';
    } else if (!_currentInput.contains('.')) {
      _currentInput += '.';
    }
    notifyListeners();
  }

  void appendOperator(String operator) {
    if (_currentInput.isNotEmpty) {
      _currentExpression += _currentInput + operator;
      _currentInput = '';
    } else if (_result.isNotEmpty) {
      _currentExpression = _result + operator;
      _result = '';
    } else if (_currentExpression.isNotEmpty) {
      // Replace the last operator
      _currentExpression =
          _currentExpression.substring(0, _currentExpression.length - 1) +
          operator;
    }
    notifyListeners();
  }

  void calculate() {
    if (_currentInput.isEmpty && _currentExpression.isEmpty) return;

    String fullExpression = _currentExpression + _currentInput;
    if (fullExpression.isEmpty) return;

    try {
      // Simple implementation - in a real app, you would use a proper expression parser
      List<String> parts = [];
      String currentNumber = '';

      for (int i = 0; i < fullExpression.length; i++) {
        String char = fullExpression[i];
        if ('0123456789.'.contains(char)) {
          currentNumber += char;
        } else {
          if (currentNumber.isNotEmpty) {
            parts.add(currentNumber);
            currentNumber = '';
          }
          parts.add(char);
        }
      }

      if (currentNumber.isNotEmpty) {
        parts.add(currentNumber);
      }

      double calculatedResult = double.parse(parts[0]);
      for (int i = 1; i < parts.length; i += 2) {
        String operator = parts[i];
        double operand = double.parse(parts[i + 1]);

        switch (operator) {
          case '+':
            calculatedResult += operand;
            break;
          case '-':
            calculatedResult -= operand;
            break;
          case '×':
            calculatedResult *= operand;
            break;
          case '÷':
            if (operand == 0) {
              throw Exception('Cannot divide by zero');
            }
            calculatedResult /= operand;
            break;
        }
      }

      _result = calculatedResult.toString();
      // Remove trailing zeros if it's a whole number
      if (_result.endsWith('.0')) {
        _result = _result.substring(0, _result.length - 2);
      }

      _history.addCalculation(
        CalculationResult(
          expression: fullExpression,
          result: _result,
          calculatedAt: DateTime.now(),
        ),
      );

      _currentExpression = '';
      _currentInput = '';
      notifyListeners();
    } catch (e) {
      _result = 'Error';
      notifyListeners();
    }
  }

  void clear() {
    _currentInput = '';
    _currentExpression = '';
    _result = '';
    notifyListeners();
  }

  void delete() {
    if (_currentInput.isNotEmpty) {
      _currentInput = _currentInput.substring(0, _currentInput.length - 1);
      notifyListeners();
    }
  }
}
