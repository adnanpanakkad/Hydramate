import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: const Text('App Info'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Name: Water tracking app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Version: 1.0.0', // Replace with your app version
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Description',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "The ultimate companion on your fitness journey. Whether you're a seasoned athlete or just starting out, our app is designed to help you achieve your health and wellness goals. Track your workouts, set personalized fitness plans, and stay motivated with real-time progress updates. With a user-friendly interface and comprehensive features, [Your App Name] is your go-to fitness app for a healthier, happier you. Download now and start your fitness adventure!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Developer: Your Name',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Contact: your.email@example.com',
              style: TextStyle(fontSize: 16),
            ),
            // Add more information as needed
          ],
        ),
      ),
    );
  }
}
