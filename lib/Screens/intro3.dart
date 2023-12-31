import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/intro2.dart';
import 'package:water_tracking_app/Screens/loginpage/login.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(() => const Intro2());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    )),
              ],
            ),
            const SizedBox(height: 100),
            Center(
                child: Image.asset('assets/images/Bottle of water-rafiki 1.jpg')),
            const SizedBox(height: 50),
            const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                'Easy to Use - Drink, Tap,'),
            const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                'Repeat'),
            const SizedBox(height: 30),
            const Text(
                style: TextStyle(color: Colors.grey),
                'Staying hydrated every day is easy with '),
            const Text(
                style: TextStyle(color: Colors.grey), 'Drops Water Tracker.'),
            const SizedBox(height: 50),
            SizedBox(
                width: 280.0,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent.shade100),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(() => const Login());
                    })),
          ],
        ),
      ),
    );
  }
}
