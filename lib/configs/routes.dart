import 'package:flutter/material.dart';
import '../screens/basic_calculator.dart';
import '../screens/bmi_calculator.dart';
import '../screens/home_screen.dart';

class Routes {
  static const String home = '/';
  static const String basicCalculator = '/basic-calculator';
  static const String bmiCalculator = '/bmi-calculator';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      basicCalculator: (context) => const BasicCalculatorScreen(),
      bmiCalculator: (context) => const BMICalculatorScreen(),
    };
  }
}
