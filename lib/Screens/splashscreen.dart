import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/Screens/intro1.dart';

import 'package:water_tracking_app/main.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() => super.didChangeDependencies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          'assets/images/Splash Screen (1).jpg'),
    );
  }

  Future<void> gotosplash() async {
    await Future.delayed(Duration(seconds: 3));
    Get.to(() => Intro1());
  }

  checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (sharedPrefs.getBool(Save_key_Name) == true) {
      print('user logged in success');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const MainPage()));
    } else {
      
      print('user not logged in');
      gotosplash();
    }
  }
}
