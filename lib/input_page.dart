import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'color_palette.dart';
import 'custom_card.dart';
import 'card_content.dart';
import 'page_layout.dart';
import 'textstyle.dart';
import 'default_data.dart';

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
  int bodyWeight = 60;
  int humanAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppBar(
              title: Text(
                'BMI CALCULATOR',
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
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
            flex: 6,
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
                          style: heightUnitTextStyle,
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
            flex: 6,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    marginLeft: sideToFrameSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToSideSpacing,
                    marginButton: sideToSideSpacing,
                    child: CardContentWithButton(
                      contentTitle: 'WEIGHT',
                      contentValue: bodyWeight,
                      contentUnit: 'kg',
                      onPressedMinus: (int val) {
                        setState(() {
                          bodyWeight = (bodyWeight <= minimumWeight)
                              ? bodyWeight
                              : bodyWeight -= val;
                        });
                      },
                      onPressedPlus: (int val) {
                        setState(() {
                          bodyWeight = (bodyWeight >= maximumWeight)
                              ? bodyWeight
                              : bodyWeight += val;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: activeCardColor,
                    marginLeft: sideToSideSpacing,
                    marginTop: sideToSideSpacing,
                    marginRight: sideToFrameSpacing,
                    marginButton: sideToSideSpacing,
                    child: CardContentWithButton(
                      contentTitle: 'AGE',
                      contentValue: humanAge,
                      contentUnit: 'years old',
                      onPressedMinus: (int val) {
                        setState(() {
                          humanAge = (humanAge <= minimumAge)
                              ? humanAge
                              : humanAge -= val;
                        });
                      },
                      onPressedPlus: (int val) {
                        setState(() {
                          humanAge = (humanAge >= maximumAge)
                              ? humanAge
                              : humanAge += val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: sideToFrameSpacing, vertical: sideToSideSpacing),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor),
                foregroundColor: MaterialStateProperty.all(buttonTextColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                textStyle: MaterialStateProperty.all(buttonTextStyle),
              ),
              child: Container(
                alignment: Alignment.center,
                height: buttonHeight,
                width: double.infinity,
                child: Text(
                  'CALCULATE',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
