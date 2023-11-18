import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/Screens/updateprofile.dart';
import 'package:water_tracking_app/main.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({
    super.key,
  });

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  late int selectedRadio;
  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Profile',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () => Get.to(() => const Updateprofile()),
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ),
              const SizedBox(height: 50),
               ClipRRect(
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
                    )),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          userName,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          userEmail,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  'Age',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          userAge,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}