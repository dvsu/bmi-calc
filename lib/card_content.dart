import 'package:flutter/material.dart';
import 'components/textstyle.dart';
import 'components/custom_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardContentWithSelection extends StatelessWidget {
  final Color textColor;
  final Color iconColor;
  final IconData icon;
  final String iconName;

  CardContentWithSelection(
      {required this.icon,
      required this.iconName,
      required this.textColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            iconName,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CardContentWithButton extends StatelessWidget {
  final String contentTitle;
  final double contentValue;
  final String contentUnit;
  final Function(int) onPressedMinus;
  final Function(int) onPressedPlus;

  CardContentWithButton(
      {required this.contentTitle,
      required this.contentValue,
      required this.contentUnit,
      required this.onPressedMinus,
      required this.onPressedPlus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          contentTitle,
          style: cardTitleTextStyle,
        ),
        Text(
          contentValue.toStringAsFixed(0),
          style: weightTextStyle,
        ),
        Text(
          contentUnit,
          style: weightUnitTextStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () => onPressedMinus(1),
            ),
            SizedBox(width: 20.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () => onPressedPlus(1),
            ),
          ],
        ),
      ],
    );
  }
}
