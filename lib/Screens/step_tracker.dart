import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:permission_handler/permission_handler.dart';

class StepTracker extends StatefulWidget {
  const StepTracker({super.key});

  @override
  StepTrackerState createState() => StepTrackerState();
}

class StepTrackerState extends State<StepTracker> {
  int stepCount =  0;

  int caloriesBurnedToday = 0;
  
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
  // Subscribe to accelerometer events
  void _subscribeToAccelerometer() {
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      // Assuming that positive values on the Y-axis indicate a step
      print("Accelerometer Event: $event");
      if (event.y > 15.0) {
        setState(() {
          stepCount++;
          // Update calories burned calculation
          print("Step Count: $stepCount");
        });
      }
    });
  }

  @override
  void dispose() {
    caloriesBurnedToday = 0;
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
        title: const Text(
          'Step Tracker',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 130),
            SizedBox(
              width: 300,
              height: 300,
              child:
                  Lottie.asset('assets/Lottie/Animation - 1695630496886.json'),
            ),
            const SizedBox(height: 50),
            const Text(
              'Step Taken today',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              '$stepCount',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text('Calories burned'),
            Text(
              '${(stepCount * 0.05).toInt()}',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 90),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  size: 50,
                )),
          ],
        ),
      ),
    );
  }
}
