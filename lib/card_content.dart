import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String iconName;

  CardContent(
      {required this.icon, required this.iconName, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            iconName,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
