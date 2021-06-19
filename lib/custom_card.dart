import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginButton;

  CustomCard(
      {required this.color,
      this.child,
      required this.marginLeft,
      required this.marginTop,
      required this.marginRight,
      required this.marginButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin:
          EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginButton),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
