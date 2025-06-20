import 'package:flutter/foundation.dart';

class BMICalculatorProvider extends ChangeNotifier {
  double _height = 170.0; // cm
  double _weight = 70.0; // kg
  String _gender = 'male';
  int _age = 30;

  double get height => _height;
  double get weight => _weight;
  String get gender => _gender;
  int get age => _age;

  // BMI calculation result
  double? _bmi;
  double? get bmi => _bmi;

  // BMI status
  String get bmiStatus {
    if (_bmi == null) return '';

    if (_bmi! < 18.5) return 'Düşük Kilo';
    if (_bmi! < 24.9) return 'Normal';
    if (_bmi! < 29.9) return 'Fazla Kilolu';
    if (_bmi! < 34.9) return 'Obez (Sınıf I)';
    if (_bmi! < 39.9) return 'Obez (Sınıf II)';
    return 'Aşırı Obez (Sınıf III)';
  }

  // Status color
  String get statusColor {
    if (_bmi == null) return 'blue';

    if (_bmi! < 18.5) return 'blue';
    if (_bmi! < 24.9) return 'green';
    if (_bmi! < 29.9) return 'yellow';
    return 'red';
  }

  void updateHeight(double height) {
    _height = height;
    notifyListeners();
  }

  void updateWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void updateGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void updateAge(int age) {
    _age = age;
    notifyListeners();
  }

  void calculateBMI() {
    // BMI = weight(kg) / height(m)^2
    _bmi = _weight / ((_height / 100) * (_height / 100));
    notifyListeners();
  }

  void reset() {
    _height = 170.0;
    _weight = 70.0;
    _gender = 'male';
    _age = 30;
    _bmi = null;
    notifyListeners();
  }
}
