import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/appinfo.dart';
import 'dart:io';
import 'package:water_tracking_app/Screens/homepage/functions/popup.dart';
import 'package:water_tracking_app/Screens/privacy_policy.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final ValueNotifier<String> imgPath;

  AppDrawer({
    required this.userName,
    required this.userEmail,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: const TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              userEmail,
              style: const TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ValueListenableBuilder(
                    valueListenable: imgPath,
                    builder: (BuildContext context, file, _) {
                      return imgPath.value.isEmpty
                          ? Image.asset(
                              'assets/images/pokiman.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(file),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            );
                    },
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 79, 187, 238),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text('Clear App Data'),
            // onTap: () async {
            //   // Add your logic for clearing app data
            //   HiveDb db = HiveDb();
            //   await db.clearAllData();
            // },
          ),
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text('App info'),
            onTap: () {
              // Add your logic for displaying app info
              Get.to(() => const AppInfoPage());
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.library_books),
          //   title: const Text('Terms & Conditions'),
          //   onTap: () {

          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy & Policy'),
            onTap: () {
              Get.to(() => const PrivacyPolicyPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              // Add your logic for logging out
              popup(context);
            },
          ),
          const SizedBox(height: 220),
          const Column(
            children: [
              Text(
                'version',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text('1.0.0'),
            ],
          ),
        ],
      ),
    );
  }
}
