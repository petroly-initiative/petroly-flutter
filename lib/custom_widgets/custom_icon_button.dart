import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    required this.label,
    required this.onPressed,
    required this.color,
    required this.icon,
  });

  final String label;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => {},
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
      height: 44,
      minWidth: 120,
    );
  }
}
