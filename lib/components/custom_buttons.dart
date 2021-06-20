import 'package:flutter/material.dart';
import 'color_palette.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: roundedButtonIconColor,
      ),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      elevation: 2.0,
      shape: CircleBorder(),
      fillColor: roundedButtonColor,
    );
  }
}
