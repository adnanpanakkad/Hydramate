import 'package:hive/hive.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

class StepDb {
  String stepBoxKey = 'USERSTEPBOX';
  String userstepBoxKey = 'userstepdataBox';
  late Box<Userstepdata> userstepdataBox;

 void addUser(Userstepdata value) async {
    Box userDb = await Hive.openBox<Userstepdata>(stepBoxKey);
  }
}
