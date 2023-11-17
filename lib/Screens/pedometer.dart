import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sensors/sensors.dart';
import 'package:permission_handler/permission_handler.dart';

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
      appBar: AppBar(
        title: Text('Step Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Step Count:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$stepCount',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
