import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

// class StepDb {
//   String stepBoxKey = 'USERSTEPBOX';
//   String userstepBoxKey = 'userstepdataBox';
//   late Box<Userstepdata> userstepdataBox;

//   void addUser(Userstepdata value) async {
//     Box userDb = await Hive.openBox<Userstepdata>(stepBoxKey);
//     int id=await userDb.
//   }
// }


// class StepDb {
//   String stepBoxKey = 'USERSTEPBOX';
//   String userstepBoxKey = 'userstepdataBox';
//   late Box<Userstepdata> userstepdataBox;

//   // Initialize Hive and open the box
//   Future<void> initializeHive() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(UserstepdataAdapter());
//     userstepdataBox = await Hive.openBox<Userstepdata>(userstepBoxKey);
//   }

//   // Add user data to the box
//   Future<void> addUser(Userstepdata value) async {
//     await userstepdataBox.add(value);
//   }

//   // Update dailySteps for a specific date
//   Future<void> updateDailySteps(DateTime date, String newDailySteps) async {
//     int index = userstepdataBox.values
//         .toList()
//         .indexWhere((element) => element.dateIsToday == date);

//     if (index != -1) {
//       Userstepdata userData = userstepdataBox.getAt(index)!;
//       userData.updateDailySteps(newDailySteps);
//       await userstepdataBox.putAt(index, userData);
//     }
//   }
// }
