import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/intro1.dart';
import 'package:water_tracking_app/Screens/intro3.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(() => const Intro1());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    )),
              ],
            ),
            const SizedBox(height: 100),
            Center(
                child: Image.asset('assets/images/World water day-bro 1.jpg')),
            const SizedBox(height: 50),
            const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                'Smart Reminders'),
            const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                'Tailored to You'),
            const SizedBox(height: 30),
            const Text(
                style: TextStyle(color: Colors.grey),
                'Quick and easy to set your hydration goal &'),
            const Text(
                style: TextStyle(color: Colors.grey),
                'then track your daily water intake progress.'),
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
                    // Get.to(() => const Intro3());
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const Intro3()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
