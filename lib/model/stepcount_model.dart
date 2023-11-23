import 'package:hive_flutter/adapters.dart';
part 'stepcount_model.g.dart';

@HiveType(typeId: 2)
class Userstepdata {
  @HiveField(1)
  int dailySteps;
  @HiveField(2)
  int totalSteps;
  @HiveField(3)
  int caloriesBurnedToday;
  @HiveField(4)
  int totalCaloriesBurned;

  Userstepdata({
    required this.dailySteps,
    required this.totalSteps,
    required this.caloriesBurnedToday,
    required this.totalCaloriesBurned,
  });
}
