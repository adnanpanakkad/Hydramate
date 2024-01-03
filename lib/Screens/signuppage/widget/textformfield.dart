import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final dynamic Controller;
  final String Hinttext;
  final String warning;
  final int length;
  final dynamic keybordtype;
  final bool? textvisibility; // Updated the type to allow null
  const Textfield({
    super.key,
    required this.Controller,
    required this.Hinttext,
    required this.warning,
    required this.length,
    required this.keybordtype,
    required this.textvisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        height: 80,
        width: 500,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: TextFormField(
              obscureText:
                  textvisibility ?? false, // Handling null with default value
              maxLength: length,
              keyboardType: keybordtype,
              controller: Controller,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: Hinttext,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return warning;
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ),
    );
  }
}
