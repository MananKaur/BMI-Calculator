import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'resultPage.dart';
import 'calculator_brain.dart';

// Gender selectedGender;
enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(children: [
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                colour: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: cardColumn(
                  iconName: FontAwesomeIcons.mars,
                  gender: 'MALE',
                ),
                onTapFunction: () {
                  setState(() {
                    selectedGender == Gender.male
                        ? selectedGender = Gender.none
                        : selectedGender = Gender.male;
                  });
                },
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: cardColumn(
                    iconName: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                  onTapFunction: () {
                    setState(() {
                      selectedGender == Gender.female
                          ? selectedGender = Gender.none
                          : selectedGender = Gender.female;
                    });
                  }),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(
            colour: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0XFFFF0067),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    overlayColor: Color(0X29FF0067),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0XFFB9BBC7),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 54,
                    max: 244,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            operation: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            operation: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            operation: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            operation: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
            buttonTitle: 'CALCULATE',
            onTapFn: () {
              CalculatorBrain cb =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                          bmiResult: cb.calculateBMI(),
                          interpretation: cb.getInterpretation(),
                          resultText: cb.getResult())));
            })
      ]),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.onTapFn});
  final String buttonTitle;
  final Function onTapFn;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFn,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20, top: 10),
        width: double.infinity,
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.operation});
  final IconData icon;
  final Function operation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45.0,
      ),
    );
  }
}
