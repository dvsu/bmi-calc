import 'package:flutter/material.dart';
import 'components/custom_dark_theme.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: customDarkTheme(),
      home: InputPage(),
    );
  }
}
