import 'package:hive/hive.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class StepDb {
  String stepBoxKey = 'USERSTEPBOX';
  String userstepBoxKey = 'userstepdataBox';
  late Box<Userstepdata> userstepdataBox;

  setDailyStepsDb(dailySteps) async {
    userstepdataBox = await Hive.openBox('userstepdataBox');
    Userstepdata? user = userstepdataBox.get('userstepdataBox');

    user!.dailySteps = dailySteps;
    await userstepdataBox.put('userbodydetails', user);
  }

  Future<int> getDailyStepsDb() async {
    userstepdataBox = await Hive.openBox('userBodyDetailsBox');
    Userstepdata? user = userstepdataBox.get('userbodydetails');
    return user!.dailySteps;
  }

// step tracking
  setTodaySteps(lastStep) async {
    userstepdataBox = await Hive.openBox('userBodyDetailsBox');
    Userstepdata? user = userstepdataBox.get('userbodydetails');

    user!.dailySteps = lastStep;
    await userstepdataBox.put('userbodydetails', user);
  }

  getTodaySteps(lastStep) async {
    userstepdataBox = await Hive.openBox('userBodyDetailsBox');
    Userstepdata? user = userstepdataBox.get('userbodydetails');
    return user!.dailySteps;
  }
}
