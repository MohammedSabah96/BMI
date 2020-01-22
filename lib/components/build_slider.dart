import 'package:flutter/material.dart';

class BuildSlider extends StatelessWidget {
  final int height;
  final Function onChanged;
  const BuildSlider({@required this.height, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Color(0xFF8D8E98),
        thumbColor: Color(0xFFEB1555),
        overlayColor: Color(0x29EB1555),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
      ),
      child: Slider(
        value: height.toDouble(),
        min: 120.0,
        max: 220.0,
        onChanged: onChanged,
      ),
    );
  }
}
