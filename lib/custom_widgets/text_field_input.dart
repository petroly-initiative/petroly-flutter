import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.label,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.obscureText,
    required this.icon,
    this.onChange,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;
  Function(String value)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (value) => onChange!(value),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              icon,
              size: 25,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0)),
        ),
        keyboardType: inputType,
        textInputAction: inputAction,
        obscureText: obscureText);
  }
}
