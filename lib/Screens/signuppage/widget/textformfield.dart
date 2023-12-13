import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final dynamic Controller;
  final String Hinttext;
  final String warning;
  const Textfield({
    super.key,
    required this.Controller,
    required this.Hinttext,
    required this.warning,
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
              controller: Controller,
              decoration: InputDecoration(
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
            ),
          ),
        ),
      ),
    );
  }
}
