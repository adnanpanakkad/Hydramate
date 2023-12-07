import 'package:flutter/material.dart';

class UpdateTextfield extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final String warning;
  const UpdateTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.warning,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        height: 60,
        width: 500,
        child: Card(
          color: Colors.blue.shade50,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
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
