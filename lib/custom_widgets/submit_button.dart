import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  CustomSubmitButton({
    required this.label,
    required this.onPressed,

  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(100.0, 0, 100, 0),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: onPressed,
        child: Text(label),
        minWidth: 100.0,
        color: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),

      ),
    );
  }
}
