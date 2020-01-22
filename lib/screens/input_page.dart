import 'package:bmi_calculator/calculate_brain.dart';
import 'package:bmi_calculator/screens/result_saved.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../components/build_slider.dart';

enum Gender { mela, femela }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.poll),
              title: Text('Result'),
              onTap: () {
                Navigator.pushNamed(context, '/resultSaved');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BuildCard(
                    colour: selectedGender == Gender.mela
                        ? kCardColorSelected
                        : kCardColorUnSelected,
                    cardChild: BuildIconContent(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.mela;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: BuildCard(
                    colour: selectedGender == Gender.femela
                        ? kCardColorSelected
                        : kCardColorUnSelected,
                    cardChild: BuildIconContent(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.femela;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BuildCard(
              colour: kCardColorSelected,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  BuildSlider(
                    height: height,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BuildCard(
                    colour: kCardColorSelected,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BuildCard(
                    colour: kCardColorSelected,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            textTitle: 'CALCULATE BMI',
            onTap: () {
              CalculateBrain calc =
                  CalculateBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ResultPage(
                    bmiResult: calc.getBMI(),
                    textResult: calc.getResult(),
                    interpration: calc.getInterprtion(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
