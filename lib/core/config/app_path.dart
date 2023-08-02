import 'package:calculadora_peso_flutter/gui/views/bmi_calculator_view/bmi_calculator_view.dart';
import 'package:calculadora_peso_flutter/gui/views/result_calculator_view/result_calculator_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'calculator': ( _ ) => const BMICalculatorView(),
  'result': ( _ ) => const ResultCalculatorView(),
};