import 'package:flutter/material.dart';
import 'components/custom_card.dart';
import 'components/color_palette.dart';
import 'components/page_layout.dart';
import 'components/textstyle.dart';
import 'input_page.dart';

Map<String, Color> colorMap = {
  'obesity': veryHighBMITextColor,
  'overweight': highBMITextColor,
  'normal': normalBMITextColor,
  'underweight': lowBMITextColor
};

class ResultsPage extends StatelessWidget {
  final String bmiScore;
  final String bmiRange;
  final String bmiDescription;

  ResultsPage(
      {required this.bmiScore,
      required this.bmiRange,
      required this.bmiDescription});

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
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Your Result',
                style: resultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: CustomCard(
                color: activeCardColor,
                marginLeft: sideToFrameSpacing,
                marginTop: sideToFrameSpacing,
                marginRight: sideToFrameSpacing,
                marginButton: sideToFrameSpacing,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      bmiRange.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w600,
                        color: colorMap[bmiRange],
                      ),
                    ),
                    Text(
                      bmiScore,
                      textAlign: TextAlign.center,
                      style: resultValueTextStyle,
                    ),
                    Text(
                      bmiDescription,
                      textAlign: TextAlign.center,
                      style: resultDescTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: sideToFrameSpacing, vertical: sideToSideSpacing),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPage()),
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
                  'RE-CALCULATE',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
