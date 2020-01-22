import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/screens/result_saved.dart';
import 'package:flutter/material.dart';
import './screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E19),
        scaffoldBackgroundColor: Color(0xFF0A0E19),
      ),
      routes: {
        '/': (context) => InputPage(),
        '/resultPage': (context) => ResultPage(),
        '/resultSaved': (context) => ResultSaved()
      },
    );
  }
}
