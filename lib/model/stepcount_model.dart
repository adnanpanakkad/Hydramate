import 'package:hive_flutter/adapters.dart';
part 'stepcount_model.g.dart';

@HiveType(typeId: 1)
class UserstepdataModel {
  @HiveField(1)
  String dailystepCount;
  @HiveField(2)
  String totalSteps;
  @HiveField(3)
  String caloriesBurnedToday;
  @HiveField(4)
  String totalCaloriesBurned;
  @HiveField(5)
  DateTime dateIsToday;
  @HiveField(6)
  String waterglass;
  @HiveField(7)
  String waterglasspercentage;
  UserstepdataModel(
      {required this.dailystepCount,
      required this.totalSteps,
      required this.caloriesBurnedToday,
      required this.totalCaloriesBurned,
      required this.dateIsToday,
      required this.waterglass,
      required this.waterglasspercentage,
      });
}
