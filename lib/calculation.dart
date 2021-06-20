import 'dart:math';

class BMICalculation {
  double height;
  double weight;

  double _bmi = 0.0;

  BMICalculation({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String rangeBMI() {
    if (_bmi >= 30.0) {
      return 'obesity';
    } else if (_bmi >= 25.0) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String describeBMI() {
    if (_bmi >= 30.0) {
      return 'You have a very high body weight. Please try to increase physical activity and a healthier diet.';
    } else if (_bmi >= 25.0) {
      return 'You have a high body weight. Please try to increase physical activity and a healthier diet.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. ';
    } else {
      return 'You have a low body weight. Please try to increase your calorie intake.';
    }
  }
}
