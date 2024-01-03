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
  dynamic glasspercentage;
  @HiveField(6)
  String waterglass;
  @HiveField(7)
  String waterglasspercentage;
  UserstepdataModel(
      {required this.dailystepCount,
      required this.totalSteps,
      required this.caloriesBurnedToday,
      required this.totalCaloriesBurned,
<<<<<<< HEAD
      required this.glasspercentage,
      required this.waterglass});
=======
      required this.dateIsToday,
      required this.waterglass,
      required this.waterglasspercentage,
      });
>>>>>>> 19fd47af670458b555788eda60199e91425efe74
}
