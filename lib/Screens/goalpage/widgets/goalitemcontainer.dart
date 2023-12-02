import 'package:flutter/material.dart';

class GoalItemContainer extends StatelessWidget {
  final String title;
  final String quantity;
  final IconData icon;
  final Color iconColor;

  const GoalItemContainer({
    required this.title,
    required this.quantity,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                quantity,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Icon(icon, color: iconColor),
            ],
          ),
        ],
      ),
    );
  }
}


class GlassContainer extends StatelessWidget {
  final String selecteditem;
  final ValueChanged<String> onSelectionChanged;

  GlassContainer({required this.selecteditem, required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 130, top: 130),
      child: Container(
        height: 90,
        width: 120,
        color: Colors.lightBlueAccent.shade100,
        child: Center(
          child: Text(
            selecteditem,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 70,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}