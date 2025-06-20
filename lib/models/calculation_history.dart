import 'calculation_result.dart';

class CalculationHistory {
  final List<CalculationResult> _history = [];

  List<CalculationResult> get history => List.unmodifiable(_history);

  void addCalculation(CalculationResult result) {
    _history.add(result);
    // Keep only the last 20 calculations
    if (_history.length > 20) {
      _history.removeAt(0);
    }
  }

  void clearHistory() {
    _history.clear();
  }
}
