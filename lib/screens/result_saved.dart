import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultSaved extends StatelessWidget {
  final String showResult;
  ResultSaved({this.showResult});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.keyboard),
              title: Text('Input Page'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('this is the $showResult'),
        ),
      ),
    );
  }
}
