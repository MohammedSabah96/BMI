import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String textTitle;
  BottomButton({@required this.textTitle, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            textTitle,
            style: kBottomStyle,
          ),
        ),
        color: kBottomColor,
        width: double.infinity,
        height: kBottomHeight,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}