// step_tracker.dart
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class StepTracker extends StatefulWidget {
  const StepTracker({Key? key}) : super(key: key);

  @override
  State<StepTracker> createState() => _StepTrackerState();
}

class _StepTrackerState extends State<StepTracker> {
  int _getSteps = 0;

  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();

  @override
  void initState() {
    super.initState();
    fetchStepData();
  }

  Future<void> fetchStepData() async {
    int? steps;

    // define the types to get
    var types = [
      HealthDataType.STEPS,
    ];

    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    var permissions = [
      HealthDataAccess.READ,
    ];

    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        // get the number of steps for today
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        print("Caught exception in getTotalStepsInInterval: $error");
      }

      print('Total number of steps: $steps');

      setState(() {
        _getSteps = (steps == null) ? 0 : steps;
      });
    } else {
      print("Authorization not granted - error in authorization");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Text(
          'Total steps: $_getSteps',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
