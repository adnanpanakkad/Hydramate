import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/intro2.dart';
import 'package:water_tracking_app/Screens/loginpage/login.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const Login());
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.lightBlueAccent.shade100,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 110),
          Center(child: Image.asset('assets/images/Bottle of water-bro 1.jpg')),
          const SizedBox(height: 50),
          const Text(
            'Track your daily water',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Text(
            'intake with Us.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(height: 30),
          const Text(
            'Achieve your hydration goals with a simple',
            style: TextStyle(color: Colors.grey),
          ),
          const Text(
            'tap!',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 280.0,
            height: 60.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent.shade100,
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.to(() => const Intro2());
              },
            ),
          ),
        ],
      ),
    );
  }
}
