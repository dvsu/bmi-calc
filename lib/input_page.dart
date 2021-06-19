import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'color_palette.dart';
import 'custom_card.dart';
import 'card_content.dart';
import 'page_layout.dart';
import 'textstyle.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int bodyHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    child: CardContent(
                      icon: FontAwesomeIcons.mars,
                      iconName: 'MALE',
                      color: selectedGender == Gender.male
                          ? activeIconColor
                          : inactiveIconColor,
                    ),
                    marginLeft: sideToFrameSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToSideSpacing,
                    marginButton: sideToSideSpacing,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    child: CardContent(
                      icon: FontAwesomeIcons.venus,
                      iconName: 'FEMALE',
                      color: selectedGender == Gender.female
                          ? activeIconColor
                          : inactiveIconColor,
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          bodyHeight.toString(),
                          style: heightTextStyle,
                        ),
                        Text(
                          'cm',
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: activeSliderColor,
                        inactiveTrackColor: inactiveSliderColor,
                        thumbColor: thumbSliderColor,
                        overlayColor: overlaySliderColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      ),
                      child: Slider(
                        value: bodyHeight.toDouble(),
                        min: 120,
                        max: 210,
                        onChanged: (double newValue) {
                          setState(() {
                            bodyHeight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
