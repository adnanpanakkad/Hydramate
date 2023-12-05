import 'package:flutter/material.dart';

class AddGlassButton extends StatelessWidget {
  final Function decrementPercentage;
  final Function incrementPercentage;

  AddGlassButton({
    required this.decrementPercentage,
    required this.incrementPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.lightBlueAccent.shade100,
          ),
          onPressed: () {
            decrementPercentage();
          },
          child: const Text(
            '-',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            'GLASSES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.lightBlueAccent.shade100,
          ),
          onPressed: () {
            incrementPercentage();
          },
          child: const Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
