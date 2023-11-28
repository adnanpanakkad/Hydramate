import 'package:hive_flutter/adapters.dart';
part 'stepcount_model.g.dart';

@HiveType(typeId: 2)
class Userstepdata {
  @HiveField(1)
  String dailySteps;
  @HiveField(2)
  String totalSteps;
  @HiveField(3)
  String caloriesBurnedToday;
  @HiveField(4)
  String totalCaloriesBurned;
  @HiveField(5)
  DateTime dateIsToday;
  Userstepdata(
      {required this.dailySteps,
      required this.totalSteps,
      required this.caloriesBurnedToday,
      required this.totalCaloriesBurned,
      required this.dateIsToday});
}
