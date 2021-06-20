import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/color_palette.dart';
import 'components/custom_card.dart';
import 'card_content.dart';
import 'components/page_layout.dart';
import 'components/textstyle.dart';
import 'default_data.dart';
import 'results_page.dart';
import 'calculation.dart';

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
  double bodyHeight = 170;
  double bodyWeight = 60;
  double humanAge = 18;

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
                    child: CardContentWithSelection(
                      icon: FontAwesomeIcons.mars,
                      iconName: 'MALE',
                      textColor: selectedGender == Gender.male
                          ? activeTextColor
                          : inactiveTextColor,
                      iconColor: selectedGender == Gender.male
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
                    child: CardContentWithSelection(
                      icon: FontAwesomeIcons.venus,
                      iconName: 'FEMALE',
                      textColor: selectedGender == Gender.female
                          ? activeTextColor
                          : inactiveTextColor,
                      iconColor: selectedGender == Gender.female
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
                    Text(
                      'HEIGHT',
                      style: cardTitleTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          bodyHeight.toStringAsFixed(0),
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
                        value: bodyHeight,
                        min: 120,
                        max: 210,
                        onChanged: (double newValue) {
                          setState(() {
                            bodyHeight = newValue;
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
              onPressed: () {
                BMICalculation bmi =
                    BMICalculation(height: bodyHeight, weight: bodyWeight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiScore: bmi.calculateBMI(),
                            bmiRange: bmi.rangeBMI(),
                            bmiDescription: bmi.describeBMI(),
                          )),
                );
              },
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
