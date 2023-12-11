import 'package:hive_flutter/adapters.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

// class StepDb {
//   String stepBoxKey = 'USERSTEPBOX';
//   void addUser(Userstepdata value) async {
//     Box stepDb = await Hive.openBox<Userstepdata>(stepBoxKey);
//   }
  
// }

  // Future<void> saveStepCountInHive(int stepCount) async {
  //   StepDb stepDb = StepDb();

  //   // Check if there's already data for today
  //   var existingData = userstepdataBox.values.firstWhere(
  //     (data) => data.dateIsToday.isAtSameMomentAs(DateTime.now()),
  //     orElse: () => null,
  //   );

  //   if (existingData != null) {
  //     // Update existing data
  //     existingData.stepCount = stepCount.toString();
  //     userstepdataBox.put(existingData.dateIsToday, existingData);
  //   } else {
  //     // Create a new entry for today
  //     var newData = Userstepdata(
  //       stepCount: stepCount.toString(),
  //       totalSteps: '0', // You may need to update this based on your logic
  //       caloriesBurnedToday: '0', // You may need to update this based on your logic
  //       totalCaloriesBurned: '0', // You may need to update this based on your logic
  //       dateIsToday: DateTime.now(),
  //     );

  //     userstepdataBox.put(newData.dateIsToday, newData);
  //   }
  // }