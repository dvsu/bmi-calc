import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'color_palette.dart';
import 'custom_card.dart';
import 'card_content.dart';
import 'page_layout.dart';

const activeCardColor = subThemeColor3;
const inactiveCardColor = subThemeColor2;
const activeIconColor = mainContentColor;
const inactiveIconColor = subThemeColor4;
const buttonColor = subContentColor;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    child: CardContent(
                      icon: FontAwesomeIcons.mars,
                      iconName: 'MALE',
                      color: activeIconColor,
                    ),
                    marginLeft: sideToFrameSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToSideSpacing,
                    marginButton: sideToSideSpacing,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: inactiveCardColor,
                    child: CardContent(
                      icon: FontAwesomeIcons.venus,
                      iconName: 'FEMALE',
                      color: inactiveIconColor,
                    ),
                    marginLeft: sideToSideSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToFrameSpacing,
                    marginButton: sideToSideSpacing,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              marginLeft: sideToFrameSpacing,
              marginTop: sideToSideSpacing,
              marginRight: sideToFrameSpacing,
              marginButton: sideToSideSpacing,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    marginLeft: sideToFrameSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToSideSpacing,
                    marginButton: sideToSideSpacing,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    marginLeft: sideToSideSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToFrameSpacing,
                    marginButton: sideToSideSpacing,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: sideToFrameSpacing, vertical: sideToSideSpacing),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
