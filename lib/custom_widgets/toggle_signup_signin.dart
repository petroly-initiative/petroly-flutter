import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ToggleSignUp extends StatelessWidget {
  ToggleSignUp({required this.page, required this.text, required this.link});

  final String page;
  final String text;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: text, style: TextStyle(color: Colors.black87)),
            TextSpan(
                text: link,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacementNamed(context, page);
                    // Navigator.pushNamed(context, page);
                  },
                style: TextStyle(
                    color: Colors.greenAccent[700],
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
