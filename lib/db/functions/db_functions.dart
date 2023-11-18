import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/main.dart';
import 'package:water_tracking_app/model/data_model.dart';

class HiveDb {
  String userBoxKey = 'USERBOX';

  void addUser(UserdataModal value) async {
    Box userDb = await Hive.openBox<UserdataModal>(userBoxKey);
  }
}

getUserImg() async {
  HiveDb db = HiveDb();
  final sharedPrefs = await SharedPreferences.getInstance();
  Box userBox = await Hive.openBox(db.userBoxKey);
  String? email = sharedPrefs.getString(email_key_Name);

  if (email != null) {
    UserdataModal? user = await userBox.get(email);
    if (user != null) {
      imgPath.value = user.imgPath ?? '';
      imgPath.notifyListeners();
      print('printing user image path ${user.imgPath}');
    }
  }
}

updateUserDetails(
    TextEditingController nameController,
    TextEditingController passController,
    TextEditingController ageController,
    TextEditingController emailController) async {
  HiveDb db = HiveDb();
  Box userBox = await Hive.openBox(db.userBoxKey);
  final sharedPrefs = await SharedPreferences.getInstance();
  String? email = sharedPrefs.getString(email_key_Name);
  UserdataModal user = await userBox.get(email);

  userEmail = emailController.text;

  userName = nameController.text;
  user.name = nameController.text;
  userPass = passController.text;
  user.password = passController.text;
  userAge = ageController.text;
  user.age = ageController.text;
  String userImgPath = imgPath.value.isNotEmpty ? imgPath.value : '';
  user.imgPath = userImgPath;

  await userBox.put(email, user);

  passController.clear();
  nameController.clear();
  ageController.clear();
  emailController.clear();
  Get.to(() => const MainPage());
}
// void updateUserDetails(
//   TextEditingController nameController,
//   TextEditingController passwordController,
//   TextEditingController ageController,
//   TextEditingController emailController, // Add emailController parameter
// ) async {
//   // Your existing code to update user details

//   // Update the email in shared preferences
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('userEmail', emailController.text);
//    Get.to(() => const MainPage());
// }

loadValuesToCtrl(
    {required nameController,
    required passwordController,
    required ageController,
    required emailController}) async {
  HiveDb db = HiveDb();
  Box userBox = await Hive.openBox(db.userBoxKey);
  final sharedPrefs = await SharedPreferences.getInstance();
  String? email = sharedPrefs.getString(email_key_Name);
  UserdataModal user = await userBox.get(email);

  nameController.text = user.name;
  passwordController.text = user.password;
  ageController.text = user.age;
  emailController.text = user.email;

  userPass = passwordController.text;
  userName = nameController.text;
  userEmail = emailController.text;
  userAge = ageController.text;
}

final picker = ImagePicker();
//Image Picker function to get image from gallery
Future getPhoto() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    imgPath.value = pickedFile.path;
    imgPath.notifyListeners();
  } else {
    print('not found');
  }
}

  //stepes
  // setLastStep(lastStep) async {
  //   final UserBodyDetailsBox = await Hive.openBox('userBodyDetailsBox');
  //   UserBodyDetails? user = UserBodyDetailsBox.get('userbodydetails');

  //   DateTime lastDate = user!.lastStepTakenDate;
  //   DateTime todayDate = DateTime.now();

  //   if (DateUtils.isSameDay(lastDate, todayDate)) {
  //     print('setLastStep is same day, no functions running');
  //     print('lastDate $lastDate');
  //     print('today date $todayDate');
  //   } else {
  //     print('setLastStep is not same day, updating the date');
  //     print('lastDate $lastDate');
  //     print('today date $todayDate');
  //     user.lastSteps = lastStep;
  //     user.lastStepTakenDate = DateTime.now();
  //     await UserBodyDetailsBox.put('userbodydetails', user);
  //   }
  //   print('settingLastStep func last step parameter passed:  $lastStep');
  //   print('settingLastStep func users last step is:  ${user.lastSteps}');
  //}
