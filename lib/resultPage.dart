import 'package:bmi_calculator_new/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                child: Container(
                  child: Text(
                    'Your Result',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 45),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTapFn: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
