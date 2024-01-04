import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:water_tracking_app/Screens/appinfo.dart';
import 'package:water_tracking_app/Screens/homepage/functions/popup.dart';
import 'package:water_tracking_app/Screens/privacy_policy.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final ValueNotifier<String> imgPath;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 50),
          const ListTile(
            title: Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text('App Info'),
            onTap: () {
              // Add your logic for displaying app info
              Navigator.pop(context);
              Get.to(() => const AppInfoPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy & Policy'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => const PrivacyPolicyPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () {
              Navigator.pop(context);
              Share.share('https://www.amazon.com/dp/B0CR49V31G/ref=apps_sf_sta');
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
              Navigator.pop(context);

              popup(context);
            },
          ),
          const SizedBox(height: 380),
          const Column(
            children: [
              Text(
                'version',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text('1.1.0'),
            ],
          ),
        ],
      ),
    );
  }
}
