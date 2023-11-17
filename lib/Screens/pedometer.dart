import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:sensors/sensors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:water_tracking_app/Screens/Analysis.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';

class StepTracker extends StatefulWidget {
  @override
  _StepTrackerState createState() => _StepTrackerState();
}

class _StepTrackerState extends State<StepTracker> {
  int stepCount = 0;
  late StreamSubscription<AccelerometerEvent> _subscription;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  // Check and request permission
  Future<void> _checkPermission() async {
    var status = await Permission.sensors.status;
    if (status.isGranted) {
      _subscribeToAccelerometer();
    } else {
      var result = await Permission.sensors.request();
      if (result.isGranted) {
        _subscribeToAccelerometer();
      } else {
        // Handle the case where permission is denied
        print("Permission denied");
      }
    }
  }

  // Subscribe to accelerometer events
  void _subscribeToAccelerometer() {
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      // Assuming that positive values on the Y-axis indicate a step
      print("Accelerometer Event: $event");
      if (event.y > 10.0) {
        setState(() {
          stepCount++;
          print("Step Count: $stepCount");
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ensure the body is behind the app bar

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Step Tracker',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130),
            SizedBox(
              width: 300,
              height: 300,
              child:
                  Lottie.asset('assets/Lottie/Animation - 1695630496886.json'),
            ),
            SizedBox(height: 50),
            Text(
              'Step Taken today',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Text(
              '$stepCount',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 150),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  size: 50,
                )),
          ],
        ),
      ),
    );
  }
}
