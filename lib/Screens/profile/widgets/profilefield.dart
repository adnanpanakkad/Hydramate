import 'package:flutter/material.dart';

class Profilefield extends StatelessWidget {
  final String text;
  const Profilefield({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 3,
      child: Container(
        height: 50,
        width: 320,
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
             borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
