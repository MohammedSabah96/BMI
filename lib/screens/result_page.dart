import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String textResult;
  final String interpration;
  ResultPage({
    @required this.bmiResult,
    @required this.textResult,
    @required this.interpration,
  });
  List<String> result=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleStyleResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BuildCard(
              colour: kCardColorSelected,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    textResult.toUpperCase(),
                    style: kResultStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIStyle,
                  ),
                  Text(
                    'Normal BMI range:',
                    style: kBMIRangeStyle,
                  ),
                  Text(
                    '18,5 - 25 kg/m2',
                    style: kBodyStyle,
                  ),
                  Text(
                    interpration,
                    textAlign: TextAlign.center,
                    style: kBodyStyle,
                  ),
                  BuildCard(
                    colour: Color(0xFF181A2E),
                    cardChild: Container(
                      padding: EdgeInsets.all(15.0),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Text(
                        'Save Result',
                        style: kBodyStyle,
                      ),
                    ),
                    onPress: () {
                      result.add(bmiResult);
                      print(result);
                    },
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            textTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
