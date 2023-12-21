import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class StepTracker extends StatefulWidget {
  const StepTracker({Key? key}) : super(key: key);

  @override
  StepTrackerState createState() => StepTrackerState();
}

class StepTrackerState extends State<StepTracker> {
  int stepCount = 0;
  String calorieCount = '0';
  int caloriesBurnedToday = 0;
  late StreamSubscription<AccelerometerEvent> _subscription;

  @override
  void initState() {
    super.initState();
    resetStepCounterAtMidnight();
    _loadStepCountFromHive();
    getCaloriecount();
    _checkPermission();
  }

  void resetStepCounterAtMidnight() {
    DateTime now = DateTime.now();
    DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    Duration timeUntilMidnight = nextMidnight.difference(now);

    Timer.periodic(Duration(days: 1), (Timer timer) {
      setState(() {
        stepCount = 0;
        HiveDb().updateStepCount(stepCount);
        // You may also want to update other related data or perform additional tasks here
      });
    });

    if (now.isBefore(nextMidnight)) {
      Timer(timeUntilMidnight, () {
        // Reset the step counter immediately after the initial check
        setState(() {
          stepCount = 0;
          HiveDb().updateStepCount(stepCount);
          // You may also want to update other related data or perform additional tasks here
        });
        resetStepCounterAtMidnight(); // Reschedule for the next day
      });
    }
  }

  Future<void> _checkPermission() async {
    var status = await Permission.sensors.status;
    if (status.isGranted) {
      _subscribeToAccelerometer();
    } else {
      var result = await Permission.sensors.request();
      if (result.isGranted) {
        _subscribeToAccelerometer();
      } else {
        print("Permission denied");
      }
    }
  }

  void _subscribeToAccelerometer() {
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.y > 15.0) {
        setState(() {
          stepCount++;
          HiveDb().updateStepCount(stepCount);
          HiveDb().updateCalorieCount((stepCount * 0.05).toInt());
        });
      }
    });
  }

  void _loadStepCountFromHive() async {
    HiveDb db = HiveDb();
    Box<UserstepdataModel> stepCountBox =
        await Hive.openBox<UserstepdataModel>(db.stepCountBoxKey);
    UserstepdataModel? model = stepCountBox.get('UserDetailsTracking');
    setState(() {
      stepCount = int.parse(model!.dailystepCount);
    });
  }

  getCaloriecount() async {
    HiveDb db = HiveDb();
    Box<UserstepdataModel> stepCalorieBox =
        await Hive.openBox<UserstepdataModel>(db.stepCountBoxKey);
    UserstepdataModel model = stepCalorieBox.get('UserDetailsTracking')!;
    setState(() {
      calorieCount = model.caloriesBurnedToday;
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
      extendBodyBehindAppBar: true,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
