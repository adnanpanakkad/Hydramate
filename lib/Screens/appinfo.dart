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
              'App Name: Your App Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Version: 1.0.0', // Replace with your app version
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Description: Write a brief description of your app here. Mention its purpose, features, and anything else relevant.',
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
