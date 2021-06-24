import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularIndicator extends StatelessWidget {
  CustomCircularIndicator({
    required this.percent,
    required this.footer,
    required this.rate,
  });

  final double percent;
  final String footer;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 8.0,
      percent: percent,
      animation: true,
      animationDuration: 1200,
      footer: Text(footer),
      center: new Text(
        rate,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      progressColor: Colors.blue,
    );
  }
}
