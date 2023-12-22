import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/intro2.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100),
          const SizedBox(height: 100),
          Center(child: Image.asset('assets/images/Bottle of water-bro 1.jpg')),
          const SizedBox(height: 50),
          const Text(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              'Track your daily water'),
          const Text(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              'intake with Us.'),
          const SizedBox(height: 30),
          const Text(
              style: TextStyle(color: Colors.grey),
              'Achieve your hydration goals with a simple'),
          const Text(style: TextStyle(color: Colors.grey), 'tap!'),
          const SizedBox(height: 50),
          SizedBox(
            width: 280.0,
            height: 60.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent.shade100),
                child: const Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.to(() => const Intro2());
                }),
          ),
        ],
      ),
    );
  }
}
