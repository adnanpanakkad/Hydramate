import 'dart:async';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracking_app/Screens/Achive_page.dart';
import 'package:water_tracking_app/Screens/addwatergoal.dart';
import 'package:water_tracking_app/Screens/all_pages.dart';
import 'package:water_tracking_app/Screens/bmi_screen.dart';
import 'package:water_tracking_app/Screens/login.dart';
import 'package:water_tracking_app/db/functions/db_functions.dart';
import 'package:water_tracking_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double percentage = 0;

  void incrementPercentage() {
    setState(() {
      percentage += 0.1; // You can adjust the increment value
      if (percentage >= 1.0) {
        percentage = 1.0; // Ensure the percentage doesn't exceed 100%

        if (percentage == 1.0) {
          archivePopup(context);
        }
      }
    });
  }

  void decrementPercentage() {
    setState(() {
      percentage -= 0.1; // You can adjust the decrement value
      if (percentage < 0.0) {
        percentage = 0.0; // Ensure the percentage doesn't go below 0%
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserImg();
    TimeOfDay time = TimeOfDay.now();
    String amPm = time.hour >= 12 ? 'PM' : 'AM'; // check if it's AM or PM
    ValueNotifier<String> formattedTime =
        ValueNotifier('${time.hourOfPeriod} : ${time.minute} $amPm');

    Timer.periodic(const Duration(seconds: 1), (timer) {
      time = TimeOfDay.now();

      formattedTime.value = '${time.hourOfPeriod} : ${time.minute} $amPm';
    });
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
            // top: Radius.circular(40),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              bmipopup(context);
            },
            icon: const Icon(Icons.medical_information),
          ),
        ],
        title: const Center(
          child: Text(
            'STAY HYDRATED',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: Drawer(
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
                      )),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 79, 187, 238),
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //   image: AssetImage(
                //     'assets/images/waterlevel.jpg',
                //   ),
                // ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Clear App Data'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('App info'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Terms & Conditions'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy & Policy'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                popup(context);
              },
            ),
            const SizedBox(height: 240),
            const Column(
              children: [
                Text(
                  'version',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text('1.0.0'),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 200,
                width: 320,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/eb8a48bad52ef6cb78500277d8b9b4ff.gif'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      left: 10,
                      child: ValueListenableBuilder(
                          valueListenable: formattedTime,
                          builder:
                              (BuildContext context, String value, Widget) {
                            return Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          }),
                    ),
                    const Positioned(
                      top: 45,
                      left: 10,
                      child: Text(
                        '200ml water(1 Glass)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () => Get.to(const Addgoal()),
                          child: const Text(
                            'add your goal',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 18.0,
                    percent: percentage,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '${(percentage * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    progressColor: Colors.lightBlueAccent.shade100,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Target',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  '2000ml',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.lightBlueAccent.shade100),
                  onPressed: () {
                    decrementPercentage();
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'GLASSES',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.lightBlueAccent.shade100),
                  onPressed: () {
                    incrementPercentage();
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ]),
            const SizedBox(height: 30),
            Text(
              'You got ${(percentage * 100).toStringAsFixed(0)}% of today’s goal, keep',
              style: TextStyle(color: Colors.grey),
            ),
            const Text('focus on your health!',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  signout(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(Save_key_Name, false);
    sharedPrefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const Login()), (route) => false);
  }

  popup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ARE YOU SURE?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                signout(context);
              },
              child: const Text('YES'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('NO'),
            ),
          ],
        );
      },
    );
  }

  bmipopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'height in cm',
                      icon: Icon(Icons.accessibility_new),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'weight in kg',
                      icon: Icon(Icons.monitor_weight),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_heightController.text.isNotEmpty &&
                          _weightController.text.isNotEmpty) {
                        double bmi = calculateBMI();
                        _heightController.text = '';
                        _weightController.text = '';

                        {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => BMIDetailsScreen(
                                        bmiValue: bmi,
                                      )));
                        }
                      }
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  double calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    return result;
  }

 Future<void> archivePopup(BuildContext context) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Congratulations!',
    desc: 'Harry has archived your goal today',
    btnOkText: 'Okay',
    btnOkOnPress: () {},
  ).show();
}
}
