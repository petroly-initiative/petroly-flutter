import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petroly/custom_widgets/form_contianer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Instructor extends StatefulWidget {
  @override
  _InstructorState createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('intsructor page'),
      ),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return Stack(children: <Widget>[
    CustomContianer(
      height: 600,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/blank_profile.png',
              fit: BoxFit.cover,
              width: 80,
              height: 80,
              alignment: Alignment.centerLeft,
            ),
          ),
          Text('Dr. Nawaf Alfiafi',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          Text(
            'ICS',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 8.0,
            percent: .60,
            animation: true,
            animationDuration: 1200,
            center: new Text(
              "3/5",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.blue,
          ),
          ToggleSwitch(
            cornerRadius: 20.0,
            radiusStyle: true,
            initialLabelIndex: 0,
            minWidth: 120,
            totalSwitches: 2,
            labels: ['Rating', 'Comments'],
            onToggle: (index) {
              if (index == 0) {
                CustomContianer(height: 250, child: Column());
              } else {
                CustomContianer(height: 200, child: Column());
              }
            },
          ),
        ],
      ),
    )
  ]);
}
