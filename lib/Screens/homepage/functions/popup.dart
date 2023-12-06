  import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/loginpage/login.dart';
import 'package:water_tracking_app/main.dart';

popup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ARE YOU SURE?'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent.shade100,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                signout(context);
              },
              child: const Text('YES'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent.shade100,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('NO'),
            ),
          ],
        );
      },
    );
  }
      
      signout(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(Save_key_Name, false);
    sharedPrefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const Login()), (route) => false);
  }
      
