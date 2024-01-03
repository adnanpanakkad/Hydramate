import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/Screens/splashscreen.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/model/data_model.dart';
import 'package:water_tracking_app/model/stepcount_model.dart';

const Save_key_Name = 'UserLoggedIn';
const email_key_Name = 'userEmailKey';
ValueNotifier<String> imgPath = ValueNotifier('');

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserdataModalAdapter().typeId)) {
    Hive.registerAdapter(UserdataModalAdapter());
  }
  if (!Hive.isAdapterRegistered(UserstepdataModelAdapter().typeId)) {
    Hive.registerAdapter(UserstepdataModelAdapter());
    Box<UserstepdataModel> stepCountBox =
        await Hive.openBox<UserstepdataModel>(HiveDb().stepCountBoxKey);
    UserstepdataModel? model = stepCountBox.get('UserDetailsTracking');

    if (model == null) {
      UserstepdataModel newModel = UserstepdataModel(
          dailystepCount: '0',
          totalSteps: '0',
          caloriesBurnedToday: '0',
          totalCaloriesBurned: '0',
          glasspercentage: '0',
          waterglass: '0');
      await stepCountBox.put('UserDetailsTracking', newModel);
    }
  }
  HiveDb db = HiveDb();
  Box userBox = await Hive.openBox(db.userBoxKey);

  final sharedPrefs = await SharedPreferences.getInstance();

  // String email = sharedPrefs.getString(email_key_Name)!;
  // UserdataModal user = await userBox.get(email);
  // userName = user.name;
  // userAge = user.age;
  // userEmail = user.email;
  await getUserDatas();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
