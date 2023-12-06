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

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Water Goal',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We prepared a lot of goals for you!',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GoalItemContainer(
                title: 'Summer time',
                quantity: '10 Glass',
                icon: Icons.forest,
                iconColor: Colors.green,
              ),
              GoalItemContainer(
                title: 'Sporty',
                quantity: '7 Glass',
                icon: Icons.sports_football,
                iconColor: Colors.orange,
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GoalItemContainer(
                title: 'Snow day',
                quantity: '5 Glass',
                icon: Icons.ac_unit,
                iconColor: Colors.blue,
              ),
              GoalItemContainer(
                title: 'Child',
                quantity: '4 Glass',
                icon: Icons.child_care,
                iconColor: Colors.pink,
              ),
            ],
          ),
        ],
      ),
    );
  }
}





